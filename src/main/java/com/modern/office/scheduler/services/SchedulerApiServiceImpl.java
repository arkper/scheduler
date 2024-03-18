package com.modern.office.scheduler.services;

import com.modern.office.config.AppConfig;
import com.modern.office.domain.*;
import com.modern.office.repository.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.collections.api.factory.Lists;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;

@Service
@RequiredArgsConstructor
@Slf4j
public class SchedulerApiServiceImpl implements SchedulerApiService {
    private static final long DAYS_IN_ADVANCE = 1;

    private final ProviderRepository providerRepo;
    private final InsuranceRepository insuranceRepo;
    private final ProviderBlockRepository providerBlockRepo;
    private final ProviderExceptionRepository providerExceptionRepo;
    private final AppointmentRepository appointmentRepo;
    private final ProductRepository productRepo;
    private final AddressRepository addressRepo;
    private final PatientInsuranceRepository patientInsuranceRepo;
    private final PatientRepository patientRepo;
    private final CodeRepository codeRepo;
    private final InsurancePlanRepository insurancePlanRepo;
    private final BusinessRepository businessRepository;
    private final PatientPreferencesRepository patientPreferencesRepository;
    private final FrameRxRepository frameRxRepository;
    private final AppConfig appConfig;

    @Value("${scheduler.rx-notifier-id}")
    private int rxNotifierId;

    private TreeMap<Integer, String> providerMap = new TreeMap<>();

    @Override
    public List<Provider> getProviders() {
        Iterable<Provider> it = this.providerRepo.getProviderByIsProviderAndProviderActive(1, true);
        return StreamSupport.stream(it.spliterator(), false)
                .filter(p -> appConfig.getProviders().contains(p.getProviderNo())).collect(Collectors.toList());
    }

    @Override
    public Iterable<FrameRxOrder> getRxOrdersToNotify(LocalDate sinceDate) {
        return Lists.mutable.withAll(this.frameRxRepository.getFrameRxOrderByRcvdDateAfter(sinceDate))
                .select(o -> Objects.isNull(o.getNotifiedDate()))
                .collect(this::updateOrder);
    }

    private FrameRxOrder updateOrder(FrameRxOrder order) {
        Lists.mutable.withAll(
                        this.appointmentRepo.getAppointmentByPatientNoAndApptDate(
                                order.getPatientId(), order.getDispensedDate()))
                .stream().findAny()
                .map(a -> order.setPhone(a.getApptPhone()));
        return order;
    }

    @Override
    @Transactional
    public FrameRxOrder updateRxOrder(FrameRxOrder order) {
        order.setNotifiedBy(this.rxNotifierId);
        order.setNotifiedDate(LocalDate.now());
        return this.frameRxRepository.save(order);
    }

    @Override
    public List<Provider> getAllProviders() {
        Iterable<Provider> it = this.providerRepo.findAll();
        return StreamSupport.stream(it.spliterator(), false).collect(Collectors.toList());
    }

    @Override
    public List<Insurance> getInsurances() {
        return appConfig.getInsurances().stream()
                .map(s -> Insurance.builder().insuranceNo(Integer.parseInt(StringUtils.substringAfterLast(s, ",")))
                        .insuranceName(StringUtils.substringBeforeLast(s, ",")).build())
                .collect(Collectors.toList());
    }

    @Override
    public Iterable<ProviderBlock> getByProviderNo(int providerNo) {
        return this.providerBlockRepo.findAllByProviderNo(providerNo);
    }

    @Override
    public Iterable<Appointment> getAppointmentByApptDate(LocalDate apptDate) {
        return this.appointmentRepo.getAppointmentByApptDate(apptDate);
    }

    @Override
    public Iterable<Appointment> getAppointmentByApptDateBetween(LocalDate startDate, LocalDate endDate) {
        return this.appointmentRepo.getAppointmentByApptDateBetween(startDate, endDate);
    }

    @Override
    public Appointment save(Appointment appointment) {
        log.info("Saving appointment [{}]", appointment);
        if (StringUtils.isEmpty(appointment.getApptAddress())) {
            Patient patient = this.getPatient(appointment.getPatientNo());

            Address address = patient.getAddress();

            appointment.setApptAddress(this.getAddressLine(address));
        }
        return this.appointmentRepo.save(appointment);
    }

    @Override
    public Iterable<Appointment> getAppointmentByProviderNoAndApptDateBetween(int providerNo, LocalDate startDate,
                                                                              LocalDate endDate) {
        return appointmentRepo.getAppointmentByProviderNoAndApptDateBetween(providerNo, startDate, endDate);
    }

    @Override
    public Iterable<Appointment> getAppointmentByPatientNoAndApptDateBetween(int patientNo, LocalDate startDate,
                                                                             LocalDate endDate) {
        var appointments = appointmentRepo.getAppointmentByPatientNoAndApptDateBetween(patientNo, startDate, endDate);
        appointments.forEach(each -> each.setProvider(this.getProvider(each.getProviderNo())));
        return appointments;
    }

    @Override
    public Provider save(Provider provider) {
        return this.providerRepo.save(provider);
    }

    @Override
    public Insurance save(Insurance insurance) {
        return this.insuranceRepo.save(insurance);
    }

    @Override
    public ProviderBlock save(ProviderBlock providerBlock) {
        return this.providerBlockRepo.save(providerBlock);
    }

    @Override
    public Iterable<Product> getAvailableProducts() {
        return this.productRepo.getProductsByProductAvailable(1);
    }

    @Override
    public Address getAddress(int addressNo) {
        return this.addressRepo.findById(addressNo).orElse(null);
    }

    @Override
    public Address save(Address address) {
        log.info("Saving address [{}]", address);

        return this.addressRepo.save(address);
    }

    @Override
    public PatientInsurance save(PatientInsurance patientInsurance) {
        return this.patientInsuranceRepo.save(patientInsurance);
    }

    @Override
    public Iterable<PatientInsurance> getPatientInsurances(int patientNo) {
        return this.patientInsuranceRepo.findAllByPatientNo(patientNo);
    }

    @Override
    public Iterable<Patient> findPatientsByLastNameAndBirthDate(String lastName, LocalDate birthDate) {
        return this.patientRepo.findPatientsByLastNameAndBirthDate(lastName, birthDate);
    }

    @Override
    public Iterable<Patient> findPatientsByLastNameAndFirstName(String lastName, String firstName) {
        return this.patientRepo.findPatientsByLastNameAndSalutation(lastName, "Dear " + firstName + ":");
    }

    @Override
    public Iterable<Patient> findPatientsByLastNameAndFirstNameLike(String lastName, String firstName) {
        lastName = "any".equalsIgnoreCase(lastName) ? "%" : lastName + "%";
        firstName = "any".equalsIgnoreCase(firstName) ? "%" : firstName + "%";
        log.info("Searching by lastName {}, firstName {}", lastName, firstName);

        return Lists.mutable.withAll(
                        this.patientRepo.findPatientsByLastNameAndSalutationLike(lastName, "Dear " + firstName))
                .reject(p -> StringUtils.isEmpty(p.getLastName()))
                .collect(Patient::transform);
    }

    @Override
    public Patient save(Patient patient) {
        log.info("Saving patient [{}]", patient);

        if (patient.getAddress().getAddressNo() == 0) {
            patient.getAddress().setWrongAddressFlag(0);
            Address savedAddress = this.addressRepo.save(patient.getAddress());
            patient.setAddress(savedAddress);
            log.info("Saved patient address [{}]", savedAddress);
        }

        Patient saved = this.patientRepo.save(patient.setAddressNoOld(patient.getAddress().getAddressNo()));

        patient.getPatientInsurances().forEach(pi -> this.patientInsuranceRepo
                .save(pi.setPatientNo(patient.getPatientNo()).setInsuredNo(patient.getPatientNo())));

        return saved;
    }

    @Override
    public Patient getPatient(int patientNo) {
        log.info("Getting patient info for id {}", patientNo);

        return this.patientRepo.findById(patientNo)
                .map(Patient::transform)
                .orElse(null);
    }

    @Override
    @Transactional
    public void updatePhone(int addressNo, String newPhoneNumber) {
        this.addressRepo.updatePhone(addressNo, newPhoneNumber);
    }

    @Override
    @Transactional
    public Appointment setLeftMsgInd(int apptNo, int state) {
        final Appointment appointment = this.appointmentRepo.findById(apptNo).orElse(null);

        if (appointment != null) {
            log.info("Setting left message indicator appointment {} to {}", appointment, state);
            appointment.setApptLeftMsgInd(state);
            this.updateAppointmentRecord(appointment);
        }
        return appointment;
    }

    @Override
    @Transactional
    public Appointment setShowInd(int apptNo, int state) {
        final Appointment appointment = this.appointmentRepo.findById(apptNo).orElse(null);

        if (appointment != null) {
            log.info("Updating show indicator for appointment {} to {}", appointment, state);
            appointment.setApptShowInd(state);
            appointment.setApptLeftMsgInd(0);
            this.updateAppointmentRecord(appointment);
        }
        return appointment;
    }

    @Override
    @Transactional
    public Appointment cancel(int apptNo) {
        return this.setShowInd(apptNo, 2);
    }

    @Override
    @Transactional
    public Appointment confirm(int apptNo) {
        final Appointment appointment = this.appointmentRepo.findById(apptNo).orElse(null);

        if (appointment != null) {
            log.info("Confirming appointment {}", appointment);
            appointment.setApptConfirmedInd(1);
            appointment.setApptLeftMsgInd(0);
            this.updateAppointmentRecord(appointment);
        }
        return appointment;
    }

    @Override
    @Cacheable(cacheNames = {"sourceCodeCache"}, key = "#categoryNo")
    public Iterable<Code> getCodesByCategory(int categoryNo) {
        return this.codeRepo.getCodesByCategory(categoryNo);
    }

    @Override
    public Iterable<ProviderException> getExceptionsByProviderNo(int providerNo) {
        return this.providerExceptionRepo.getProviderExceptionsByProviderNo(providerNo);
    }

    @Override
    public Iterable<ProviderException> getExceptionsByProviderNoAndExceptionDate(int providerNo, LocalDate fromDate,
                                                                                 LocalDate toDate) {
        return this.providerExceptionRepo.getProviderExceptionsByProviderNoAndExceptionDateBetween(providerNo, fromDate,
                toDate);
    }

    @Override
    public Set<Timeslot> getTimeslots(int providerNo, LocalDate fromDate, LocalDate toDate) {
        AtomicReference<LocalDate> current = new AtomicReference<LocalDate>(fromDate);

        Iterable<ProviderBlock> providerBlocks = this.providerBlockRepo.findAllByProviderNo(providerNo);
        Iterable<ProviderException> exceptions = this.providerExceptionRepo
                .getProviderExceptionsByProviderNo(providerNo);

        Iterable<Appointment> appointments = this.appointmentRepo
                .getAppointmentByProviderNoAndApptDateBetween(providerNo, fromDate, toDate);

        final Set<Timeslot> result = new TreeSet<Timeslot>();

        while (toDate.plusDays(1).isAfter(current.get())) {
            final int dayOfWeek = current.get().getDayOfWeek().getValue();
            StreamSupport.stream(providerBlocks.spliterator(), false)
                    .filter(b -> b.getDayOfWeek() == dayOfWeek)
                    .filter(block -> block.getBlockType() == 1 && block.getRangeNo() == 0)
                    .map(block -> this.getTimeslotsFor(current.get(), block, exceptions, appointments))
                    .forEach(slots -> result.addAll(slots));

            log.debug("Collecting timeslots for {}. Current count is {}", current, result.size());
            current.set(current.get().plusDays(1));
        }

        return result;
    }

    private List<Timeslot> getTimeslotsFor(LocalDate date, ProviderBlock block, Iterable<ProviderException> exceptions,
                                           Iterable<Appointment> appointments) {
        List<Timeslot> result = new ArrayList<Timeslot>();

        LocalDateTime startTime = this.getDateTime(date, block.getStartDateTime());
        LocalDateTime endTime = this.getDateTime(date, block.getEndDateTime());

        LocalDateTime current = startTime;
        while (current.isBefore(endTime.minusMinutes(1))) {
            Timeslot timeslot = Timeslot.builder().date(date).startTime(current).endTime(current.plusMinutes(15))
                    .available(true).build();
            if (this.isTimeslotAvailable(timeslot, block.getProviderNo(), exceptions, appointments)) {
                result.add(timeslot);
            }
            current = current.plusMinutes(15);
        }

        return result;
    }

    private boolean isTimeslotAvailable(Timeslot timeslot, int providerNo, Iterable<ProviderException> exceptions,
                                        Iterable<Appointment> appointments) {
        Stream<ProviderException> filteredExceptions = StreamSupport.stream(exceptions.spliterator(), false)
                .filter(exception -> exception.getExceptionDate().equals(timeslot.getDate()));

        return filteredExceptions.noneMatch(exception -> {
            return timeslot.getStartTime()
                    .isAfter(this.getDateTime(exception.getExceptionDate(), exception.getStartTime()).minusMinutes(1))
                    && timeslot.getEndTime().isBefore(
                    this.getDateTime(exception.getExceptionDate(), exception.getEndTime()).plusMinutes(1));
        }) && StreamSupport.stream(appointments.spliterator(), false).filter(appt -> appt.getApptCancelInd() == 0 && appt.getApptDeletedInd() == 0)
                .noneMatch(
                        a -> this.getDateTime(a.getApptDate(), a.getApptStartTime()).equals(timeslot.getStartTime()));
    }

    private LocalDateTime getDateTime(LocalDate date, String time) {
        if (date == null) {
            date = LocalDate.now();
        }
        return LocalDateTime.parse(date.format(DateTimeFormatter.ISO_DATE) + "T" + time);
    }

    @Override
    public Iterable<InsurancePlan> getInsurancePlans(int insuranceNo) {
        return this.insurancePlanRepo.findInsurancePlansByInsuranceNo(insuranceNo);
    }

    @Override
    public Iterable<Appointment> getAppointmentToConfirm(int confirmInd, int showInd, int leftMsgInd) {
        var appts = this.getAppointmentByApptDate(LocalDate.now().plusDays(DAYS_IN_ADVANCE));

        return StreamSupport.stream(appts.spliterator(), false)
                .filter(a -> checkIndicator(a.getApptConfirmedInd(), confirmInd) && checkIndicator(a.getApptShowInd(), showInd) && checkIndicator(a.getApptLeftMsgInd(), leftMsgInd))
                .toList();
    }

    private boolean checkIndicator(Integer indicatorValue, int targetValue) {
        if (indicatorValue == null) {
            indicatorValue = 0;
        }

        return indicatorValue == targetValue;
    }

    private String getAddressLine(Address address) {
        return address.getAddress1() + ", " +
                address.getCity() + ", " +
                this.getState(address) + " " +
                address.getZip();
    }

    private String getState(Address address) {
        return StreamSupport.stream(this.getCodesByCategory(CodeCategory.STATE_CODE_CATEGORY.getValue()).spliterator(), false)
                .filter(c -> c.getCode() == address.getStateNo())
                .findFirst().get().getUserCode();
    }

    @Override
    public Business getBusiness(int businessNo) {
        return this.businessRepository.findById(businessNo)
                .orElse(null);
    }

    @Override
    public List<PatientPreferences> getPatientPreferences(int patientNo) {
        return this.patientPreferencesRepository.findPatientPreferencesByPatientNo(patientNo);
    }

    @Override
    public PatientPreferences savePatientPreferences(PatientPreferences patientPreferences) {
        return this.patientPreferencesRepository.save(patientPreferences);
    }

    private void updateAppointmentRecord(Appointment appointment) {
        appointment.setRecordedBy(3);
        appointment.setRecordedDateTime(LocalDateTime.now());
        appointment.setRecordedByComputer("MANAGER_PC");
    }

    private String getProvider(Integer providerNo) {
        if (CollectionUtils.isEmpty(this.providerMap)) {
            this.getProviders().forEach(each -> this.providerMap.put(each.getProviderNo(), each.getProviderFirstName() + " " + each.getProviderLastName()));
        }
        return this.providerMap.getOrDefault(providerNo, "");
    }
}
