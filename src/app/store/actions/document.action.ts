import { Action } from '@ngrx/store';
import { Document } from '../model/patient.model';

export enum DocumentActionType {
    SELECT_DOCUMENT = '[DOCUMENT] Document selected',
}
  
export class DocumentSelectedAction implements Action {
  readonly type = DocumentActionType.SELECT_DOCUMENT;

  constructor(public payload: Document) {}
}

export type DocumentAction = DocumentSelectedAction;