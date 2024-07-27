import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, catchError } from 'rxjs';
import { environment } from 'src/environments/environment';
import { of } from 'rxjs';
import { Address, Appointment, Code, Company, CorrespondenceReportRequest, DocType, Document, Patient, PatientInsurance, PaymentComissionsReportRequest, PaymentCommision, Provider, SigninRecord } from '../store/model/patient.model';
import { DatePipe } from '@angular/common';

const STATE_CODE_CATEGORY: number = 32;
const CARRIER_CODE_CATEGORY: number = 5;
const RELATIONSHIP_CODE_CATEGORY: number = 59;

@Injectable({
  providedIn: 'root'
})
export class OfficeApiService {
  static stateCodes: Code[] = [];
  static carrierCodes: Code[] = [];
  static relationshipCodes: Code[] = [];

  company!: Company;

  providers!: Provider[];

  insurances!: {insuranceNo: number, insuranceName: string};

  constructor(private http: HttpClient, private datepipe: DatePipe) { 
    this.getCodes(STATE_CODE_CATEGORY)
      .subscribe({next: codes => OfficeApiService.stateCodes = codes});
    this.getCodes(CARRIER_CODE_CATEGORY)
      .subscribe({next: codes => OfficeApiService.carrierCodes = codes});
    this.getCodes(RELATIONSHIP_CODE_CATEGORY)
      .subscribe({next: codes => OfficeApiService.relationshipCodes = codes});
    this.fetchCompany()
      .subscribe({next: c => this.company = c}); 
    this.getProviders()
      .subscribe({next: data => this.providers = data});
    this.getInsurances()
      .subscribe({next: data => this.insurances = data});   
  }

  register(): Observable<any>{
    return this.http.post("/forms/register", null, this.getHttpOptions());
  }

  getDocTypes(category: string): DocType[]{
    return category === 'EDoc'
      ? [{id: "release", desc: "Release Of Medical Info"},
         {id: "transportation", desc: "Transportation Approval"},
         {id: "eye-glasses", desc: "Medicaid Eyeglasses"}]
      : [{id: "consent", desc: "Consent To Examination"}];
  }

  getPatientsByName(lastName: string, firstName: string): Observable<Patient[]> {
    if (environment.production) {
      return this.http
        .get<Patient[]>(`/patients-by-name-like/${ lastName }/${ firstName }`, this.getHttpOptions());
    } else {
      const address: Address = {addressNo: 1, address1: "123 East 12th St", address2: null, city: "Brooklyn", stateNo: 65, state: null, zip: "11223", phone1: "(718) 123-45678", phone2: null};
      const insurance: PatientInsurance = {patientInsuranceNo: 1, insuranceNo: 2, insuredId: "A12345", insuredNo: 111, relationToInsuredNo: 335}
      const patients = [
        {patientNo: 111, lastName: 'Perepelyuk', firstName: 'Arkady', address: address, salutation: null, birthDate: '1962-09-27', sex: 1, ssNo: '123456', patientInsurances: [insurance]},
        {patientNo: 112, lastName: 'Perepelyuk', firstName: 'Dina', address: null, salutation: null, birthDate: '1964-09-07', sex:0, ssNo: '23232323', patientInsurances: null}
      ];
      const found: Patient[] | undefined = patients.filter(p => (lastName === 'any' || p.lastName.includes(lastName)) && (firstName === 'any' || p.firstName.includes(firstName)));

      if (found !== undefined) {
        return of<Patient[]>(found);
      } else {
        return of([]);
      }
    }
  }

  getPatientsByLastNameOrFirstName(lastName: string, firstName: string): Observable<Patient[]> {
    if (environment.production) {
      return this.http
        .get<Patient[]>(`/patients-by-name-like/${ lastName }/or/${ firstName }`, this.getHttpOptions());
    } else {
      const address: Address = {addressNo: 1, address1: "123 East 12th St", address2: null, city: "Brooklyn", stateNo: 65, state: null, zip: "11223", phone1: "(718) 123-45678", phone2: null};
      const insurance: PatientInsurance = {patientInsuranceNo: 1, insuranceNo: 2, insuredId: "A12345", insuredNo: 111, relationToInsuredNo: 335}
      const patients = [
        {patientNo: 111, lastName: 'Perepelyuk', firstName: 'Arkady', address: address, salutation: null, birthDate: '1962-09-27', sex: 1, ssNo: '123456', patientInsurances: [insurance]},
        {patientNo: 112, lastName: 'Perepelyuk', firstName: 'Dina', address: null, salutation: null, birthDate: '1964-09-07', sex:0, ssNo: '23232323', patientInsurances: null}
      ];
      const found: Patient[] | undefined = patients.filter(p => (lastName === 'any' || p.lastName.includes(lastName)) && (firstName === 'any' || p.firstName.includes(firstName)));

      if (found !== undefined) {
        return of<Patient[]>(found);
      } else {
        return of([]);
      }
    }
  }

  getPatientsById(patientNo: string): Observable<Patient> {
    if (environment.production) {
      return this.http
        .get<Patient>(`/patients/${ patientNo }`, this.getHttpOptions());
    } else {
      const address: Address = {addressNo: 1, address1: "123 East 12th St", address2: null, city: "Brooklyn", stateNo: 65, state: null, zip: "11223", phone1: "(718) 123-45678", phone2: null};
      const insurance: PatientInsurance = {patientInsuranceNo: 1, insuranceNo: 2, insuredId: "A12345", insuredNo: 111, relationToInsuredNo: 335}
      return of({patientNo: 111, lastName: 'Perepelyuk', firstName: 'Arkady', address: address, salutation: null, birthDate: '1962-09-27', sex: 1, ssNo: '123456', patientInsurances: [insurance]});
    }
  }

  getDocs(patientNo: number, type: string): Observable<Document[]> {
    return type === 'EDoc'? this.getEdocs(patientNo) : this.getHipaaDocs(patientNo);
  }

  getEdocs(patientNo: number): Observable<Document[]> {
    if (environment.production) {
      return this.http.get<Document[]>('/documents/e-docs/' + patientNo, this.getHttpOptions());
    } else {
      return of([{formType: 'Consent', recordedOn: '2023-12-12', expiresOn: '2023-12-31', docLink: 'form.pdf'}]);
    }
  }

  getHipaaDocs(patientNo: number): Observable<any[]> {
    if (environment.production) {
      return this.http.get<any[]>('/documents/hippa-docs/' + patientNo, this.getHttpOptions());
    } else {
      return of([{formType: 'Consent', recordedOn: '2023-12-12', expiresOn: '2023-12-31'}]);
    }
  }

  getPatientAppts(patientNo: number): Observable<any[]> {
    let endDate = this.datepipe.transform(new Date(), 'yyyy-MM-dd');
    let startDate = this.datepipe.transform(new Date().setDate(new Date().getDate() - 7), 'yyyy-MM-dd'); 
    if (environment.production) {
      return this.http.get<any[]>(`/patient-appointments/${patientNo}/${startDate}/${endDate}`, this.getHttpOptions());
    } else {
      return of([{apptNo: 1, apptName: "Arkady Perepelyuk", apptDate: "2023-12-17", apptStartTime: "13:30", provider: "Steven Givner"}]);
    }
  }

  saveSigninRecord(record: any): Observable<any> {
    if (environment.production) {
      return this.http.post('/signin', record, this.getHttpOptions());
    } else {
      record.id = 1;
      return of(record);
    }

  }

  getSigninRecords(): Observable<any> {
    let date = this.datepipe.transform(new Date(), 'yyyy-MM-dd');
    if (environment.production) {
      return this.http.get(`/signin/${date}`, this.getHttpOptions());
    } else {
      return of([{visitorName: "Arkady Perepelyuk", dateTimeIn: "2023-12-17T12:00:00", toBeSeenBy: "Steven Givner", signinImage: null}]);
    }
  }

  getProviders(): Observable<any> {
    if (environment.production) {
      return this.http.get('/providers', this.getHttpOptions());
    } else {
      return of([{providerNo: 20, providerFirstName: "Diana", providerLastName: "Lakovitsky", providerName: "Diana Lakovitsky"},
                 {providerNo: 3, providerFirstName: "Steven", providerLastName: "Givner", providerName: "Steven Givner"}]);
    }
  }

  updateAppointment(appt: Appointment): Observable<any> {
    if (environment.production) {    
      return this.http.post(`/appointment/${appt.apptNo}/show`, null, this.getHttpOptions());
    } else {
      return of({apptNo: 1, apptName: "Arkady Perepelyuk", apptDate: "2023-12-17", apptTime: "13:30", provider: "Steven Givner"});
    }
  }

  generateDocument(data: any): Observable<any>
  {
    return this.http.post(`/forms/generate`, data, {responseType: 'text'});
  }

  submitDocument(data: any, formType: string): Observable<any>
  {
    return this.http.post(`/forms/${formType}/generate`, data, {responseType: 'text'});
  }

  getCorrespondenceReport(request: CorrespondenceReportRequest): Observable<any> {
    if (environment.production) {    
      return this.http.post('/correspondence', request, this.getHttpOptions());
    } else {
      return of([{patientNo: 1, lastName: "Perepelyuk", firstName: 'Arkady', birthDate: "1962-12-17", lastExamDate: "2022-12-09"}]);
    }   
  }

  downloadReport(request: CorrespondenceReportRequest): Observable<any> {
    if (environment.production) {    
      return this.http.post('/correspondence/download', request, {responseType: 'blob'});
    } else {
      return of([{patientNo: 1, lastName: "Perepelyuk", firstName: 'Arkady', birthDate: "1962-12-17", lastExamDate: "2022-12-09"}]);
    }   
  }

  downloadComissionsReport(request: PaymentComissionsReportRequest): Observable<any> {
    if (environment.production) {    
      return this.http.post('/forms/commissions/download', request, {responseType: 'blob'});
    } else {
      return of([{patientNo: 1, lastName: "Perepelyuk", firstName: 'Arkady', birthDate: "1962-12-17", lastExamDate: "2022-12-09"}]);
    }   
  }

  getInsurances(): Observable<any> {
    if (environment.production) {    
      return this.http.get('/insurances', this.getHttpOptions());
    } else {
      return of([{insuranceNo: 1, insuranceName: 'Aetna'}, {insuranceNo: 2, insuranceName: "Signa"}, {insuranceNo: 3, insuranceName: 'VSP'}]);
    }
  }

  requestSignature(data: any): Observable<any>
  {
    console.log("Requesting signature for: ", data);
    return this.http.post('/forms/sign-requests', data, {responseType: 'text'});
  }

  getRequest(): Observable<any>
  {
    return this.http.get('/forms/sign-requests', this.getHttpOptions());
  }

  getState(stateNo: number | undefined): string | undefined{
    if (stateNo == undefined) {
      return undefined;
    }
    return OfficeApiService.stateCodes.find(c => c.code === stateNo)?.userCode;
  }

  getCarrier(carrierNo: number | undefined): string | undefined{
    if (carrierNo == undefined) {
      return undefined;
    }
    return OfficeApiService.carrierCodes.find(c => c.code === carrierNo)?.description;
  }

  getRelationship(relationshipNo: number | undefined): string | undefined{
    if (relationshipNo == undefined) {
      return undefined;
    }
    return OfficeApiService.relationshipCodes.find(c => c.code === relationshipNo)?.description;
  }

  getDocFile(docLink: string): string {
    if (docLink.indexOf("\\") >= 0){
      return docLink.substring(docLink.lastIndexOf("\\") + 1);
    } else if (docLink.indexOf("/") >= 0) {
      return docLink.substring(docLink.lastIndexOf("/") + 1);
    } else {
      return docLink;
    }
  }

  fetchCompany(): Observable<Company> {
    if (environment.production)
    {
      return this.http.get<Company> ("/forms/company", this.getHttpOptions());
    }

    return of(
    {
      name: "Modern Optika, Inc.",
      address: {
        addressNo: 0,
        address1: "453 Kings Hwy",
        address2: null,
        city: "Brooklyn",
        stateNo: 65,
        state: "NY",
        zip: "11223",
        phone1: "(718) 336-0309",
        phone2: null
      }
    });
  }

  getCompany(): Company | undefined {
    return this.company;
  }

  getPaymentComissions(request: PaymentComissionsReportRequest): Observable<any> {
    if (environment.production)
      {
        return this.http.post (`/payment-comissions`, request, this.getHttpOptions());
      }
  
      return of([
      {
        id: 56,
        paymentDate: '2024-07-19',
        paymentAmount: "127.23",
        insurance: "Aetna",
        provider: 'Steven Givner'
      },]);
  }

  savePayment(payment: PaymentCommision): Observable<any> {
    if (environment.production)
      {
        return this.http.post<PaymentCommision> (`/payment-comission`, payment, this.getHttpOptions());
      }
  
      return of(
      {
        ... payment,
        id: 57,
      });
  }

  deletePayment(id: number): Observable<any> {
    if (environment.production)
      {
        return this.http.delete (`/payment-comission/${id}`, {responseType: 'text'});
      }
  
      return of("ok");
  }

  getCodes(category: number): Observable<Code[]> {
    if (environment.production)
    {
      return this.http.get<Code[]> (`/codes-by-category-no/${category}`, this.getHttpOptions());
    }

    return of([
    {
      code: 56,
      category: 32,
      userCode: "CA",
      description: "California"
    },
    {
      code: 65,
      category: 32,
      userCode: "NY",
      description: "New York"
    },
    {
      code: 2,
      category: 5,
      userCode: "PPO",
      description: "PPO"
    },
    {
      code: 3,
      category: 5,
      userCode: "VSP",
      description: "VSP"
    },
    {
      code: 335,
      category: 59,
      userCode: "01",
      description: "Self"
    },
    {
      code: 336,
      category: 59,
      userCode: "02",
      description: "Spouse"
    },
  ]);
  }

  getHttpOptions() {
    var headers_object = new HttpHeaders();
    headers_object.append('Content-Type', 'application/json');
    headers_object.append("Authorization", "Basic " + btoa("user123:password123"));
    headers_object.append("Access-Control-Allow-Origin", '*');
    const httpOptions = {
      headers: headers_object
    };
    return httpOptions;
  }

  getHttpOptionsFor(contentType: string) {
    var headers_object = new HttpHeaders();
    headers_object.append('Content-Type', contentType);
    headers_object.append("Authorization", "Basic " + btoa("user123:password123"));
    headers_object.append("Access-Control-Allow-Origin", '*');
    const httpOptions = {
      headers: headers_object
    };
    return httpOptions;
  }
}
