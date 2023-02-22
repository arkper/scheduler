package com.modern.office.scheduler.services;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;

import org.apache.commons.lang3.StringUtils;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.modern.office.scheduler.AppConfig;
import com.modern.office.scheduler.domain.Address;
import com.modern.office.scheduler.domain.Appointment;
import com.modern.office.scheduler.domain.Code;
import com.modern.office.scheduler.domain.Insurance;
import com.modern.office.scheduler.domain.InsurancePlan;
import com.modern.office.scheduler.domain.Patient;
import com.modern.office.scheduler.domain.PatientInsurance;
import com.modern.office.scheduler.domain.Product;
import com.modern.office.scheduler.domain.Provider;
import com.modern.office.scheduler.domain.ProviderBlock;
import com.modern.office.scheduler.domain.ProviderException;
import com.modern.office.scheduler.domain.Timeslot;
import com.modern.office.scheduler.repository.AddressRepository;
import com.modern.office.scheduler.repository.AppointmentRepository;
import com.modern.office.scheduler.repository.CodeRepository;
import com.modern.office.scheduler.repository.InsurancePlanRepository;
import com.modern.office.scheduler.repository.InsuranceRepository;
import com.modern.office.scheduler.repository.PatientInsuranceRepository;
import com.modern.office.scheduler.repository.PatientRepository;
import com.modern.office.scheduler.repository.ProductRepository;
import com.modern.office.scheduler.repository.ProviderBlockRepository;
import com.modern.office.scheduler.repository.ProviderExceptionRepository;
import com.modern.office.scheduler.repository.ProviderRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class SchedulerApiServiceImpl implements SchedulerApiService {
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
	private final List<Integer> supportedProviders;
	private final List<String> supportedInsurances;

	public SchedulerApiServiceImpl(final ProviderRepository providerRepo, final InsuranceRepository insuranceRepo,
			final ProviderBlockRepository providerBlockRepo, final ProviderExceptionRepository providerExceptionRepo,
			final AppointmentRepository appointmentRepo, final ProductRepository productRepo,
			final AddressRepository addressRepo, final PatientInsuranceRepository patientInsuranceRepo,
			final PatientRepository patientRepo, final InsurancePlanRepository insurancePlanRepo,
			final CodeRepository codeRepo, final AppConfig secConfig) {
		this.providerRepo = providerRepo;
		this.insuranceRepo = insuranceRepo;
		this.providerBlockRepo = providerBlockRepo;
		this.providerExceptionRepo = providerExceptionRepo;
		this.appointmentRepo = appointmentRepo;
		this.productRepo = productRepo;
		this.addressRepo = addressRepo;
		this.patientInsuranceRepo = patientInsuranceRepo;
		this.patientRepo = patientRepo;
		this.codeRepo = codeRepo;
		this.insurancePlanRepo = insurancePlanRepo;
		this.supportedProviders = secConfig.getProviders();
		this.supportedInsurances = secConfig.getInsurances();
	}

	@Override
	public List<Provider> getProviders() {
		Iterable<Provider> it = this.providerRepo.getProviderByIsProviderAndProviderActive(1, true);
		return StreamSupport.stream(it.spliterator(), false)
				.filter(p -> this.supportedProviders.contains(p.getProviderNo())).collect(Collectors.toList());
	}

	@Override
	public List<Insurance> getInsurances() {
		return this.supportedInsurances.stream()
				.map(s -> Insurance.builder().insuranceNo(Integer.parseInt(StringUtils.substringAfter(s, ",")))
						.insuranceName(StringUtils.substringBefore(s, ",")).build())
				.collect(Collectors.toList());
	}

	@Override
	public Iterable<ProviderBlock> getByProviderNo(int providerNo) {
		return this.providerBlockRepo.findAllByProviderNo(providerNo);
	}

	@Override
	public Iterable<Appointment> getAppointmentByApptDateBetween(LocalDate startDate, LocalDate endDate) {
		return this.appointmentRepo.getAppointmentByApptDateBetween(startDate, endDate);
	}

	@Override
	public Appointment save(Appointment appointment) {
		log.info("Saving appointment [{}]", appointment);
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
		return appointmentRepo.getAppointmentByPatientNoAndApptDateBetween(patientNo, startDate, endDate);
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
	public Patient save(Patient patient) {
		log.info("Saving patient [{}]", patient);
		Patient saved = this.patientRepo.save(patient.setAddressNoOld(patient.getAddress().getAddressNo()));

		patient.getPatientInsurances().forEach(pi -> this.patientInsuranceRepo
				.save(pi.setPatientNo(patient.getPatientNo()).setInsuredNo(patient.getPatientNo())));

		return saved;
	}

	@Override
	public Patient getPatient(int patientNo) {
		return this.patientRepo.findById(patientNo).orElse(null);
	}

	@Override
	@Transactional
	public void updatePhone(int addressNo, String newPhoneNumber) {
		this.addressRepo.updatePhone(addressNo, newPhoneNumber);
	}

	@Override
	@Transactional
	public Appointment cancel(int apptNo) {
		final Appointment appointment = this.appointmentRepo.findById(apptNo).orElse(null);

		if (appointment != null) {
			appointment.setApptCancelInd(1);
		}

		return appointment;
	}

	@Override
	@Cacheable(cacheNames = { "sourceCodeCache" }, key = "#categoryNo")
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
}
