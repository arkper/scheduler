import { Action } from '@ngrx/store';
import { Patient } from '../model/patient.model';

export enum PatientActionType {
  SELECT_PATIENT = '[PATIENT] Patient selected',
}

export class PatientSelectedAction implements Action {
  readonly type = PatientActionType.SELECT_PATIENT;

  constructor(public payload: Patient) {}
}
export type PatientAction = PatientSelectedAction;