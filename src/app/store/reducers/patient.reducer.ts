import { Patient } from '../model/patient.model'; 
import { PatientActionType, PatientAction } from '../actions/patient.action';
import { State } from '../model/state.model';
import { DocumentAction, DocumentActionType } from '../actions/document.action';
import { Action } from '@ngrx/store';

const initialState: State = {
  patients: [
    {
      patientNo: 0,
      firstName: "",
      lastName: "",
      address: null,
      salutation: null,
      birthDate: '',
      sex: 0,
      ssNo: '',
      patientInsurances: null
    }
  ],
  document: {
    formType: '',
    recordedOn: '',
    expiresOn: '',
    docLink: ''
  }
};

export function patientReducer(
  state: State = initialState,
  action: PatientAction
): State {
  switch (action.type) {
    case PatientActionType.SELECT_PATIENT:
      return {...state, 
        patients: [action.payload]
      };
  default:
      return state;
  }
}

export function documentReducer(
  state: State = initialState,
  action: DocumentAction
): State {
  switch (action.type) {
    case DocumentActionType.SELECT_DOCUMENT:
      return {...state, 
        document: action.payload
      };
  default:
      return state;
  }
}
