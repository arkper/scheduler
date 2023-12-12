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

export const EMPTY_DOCUMENT: Document = {
  formType: '',
  recordedOn: '',
  expiresOn: '',
  docLink: ''
};