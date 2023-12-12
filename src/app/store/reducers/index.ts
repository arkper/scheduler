import { State } from '../model/state.model';
import { documentReducer, patientReducer } from './patient.reducer';
import { ActionReducerMap } from '@ngrx/store';


export const rootReducer = {};

export interface AppState {
    selectedPatient: State;
    selectedDocument: State;
};

export const reducers: ActionReducerMap<AppState, any> = {
    selectedPatient: patientReducer,
    selectedDocument: documentReducer
};