export interface Address {
    addressNo: number,
    address1: string,
    address2: string | null,
    city: string,
    stateNo: number,
    state: string | null,
    zip: string,
    phone1: string,
    phone2: string | null
}

export interface PatientInsurance {
    patientInsuranceNo: number,
    insuranceNo: number,
    insuredNo: number,
    relationToInsuredNo: number,
    insuredId: string
}

export interface Patient {
    patientNo: number,
    lastName: string,
    firstName: string,
    address: Address | null,
    salutation: string | null,
    birthDate: string,
    sex: number,
    ssNo: string,
    patientInsurances: PatientInsurance[] | null
}

export interface Code {
  code: number,
  category: number,
  userCode: string,
  description: string    
}

export interface Company {
  name: string,
  address: Address,
}

export interface Document {
    formType: string,
    recordedOn: string,
    expiresOn: string,
    docLink: string
}

export interface Appointment {
  apptNo: number,
  apptName: string,
  apptDate: string,
  apptStartTime: string,
  provider: string
}

export interface SigninRecord {
  id: number | null,
  visitorName: string,
  dateTimeIn: string | null,
  dateTimeOut: string | null,
  signinImage: string,
  toBeSeenBy: string
}

export const EMPTY_DOCUMENT: Document = {
  formType: '',
  recordedOn: '',
  expiresOn: '',
  docLink: ''
};

export interface Provider {
  providerNo: number,
  providerFirstName: string,
  providerLastName: string,
  providerName: string
};

export interface CorrespondenceReportRequest {
  fromBirthDate: string,
  toBirthDate: string,
  fromLastExamDate: string,
  toLastExamDate: string,
  fromRecallDate: string | null,
  toRecallDate: string | null,
  insurances: number[] | null,
  recallType: number
}

export interface PaymentComissionsReportRequest {
  fromPaymentPeriod: string,
  toPaymentPeriod: string,
  insurances: string[] | null,
  provider: string,
  exemptions: string[],
}

export interface DocType {
  id: string,
  desc: string
}

export interface PaymentCommision {
  id: number,
  paymentDate: Date,
  paymentAmount: number,
  billingCode: string,
  insurance: string,
  provider: string, 
  patient: string,
}

export interface PatientPreferences {
  patientPreferenceNo: number | null,
  patientNo: number,
  lastName: string,
  firstName: string,
  language: string,
  unsubscribe: boolean,
}