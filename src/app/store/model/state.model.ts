import { Patient, Document } from "./patient.model";

export interface State {
  readonly patients: Patient[];
  readonly document: Document;
}