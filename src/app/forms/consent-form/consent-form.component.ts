import { DatePipe } from '@angular/common';
import { Component, Input } from '@angular/core';
import { Router } from '@angular/router';
import { OfficeApiService } from '../../services/office-api.service';
import {MatSnackBar, MatSnackBarRef, TextOnlySnackBar} from '@angular/material/snack-bar';
import { Document, Patient } from '../../store/model/patient.model';
import { Store } from '@ngrx/store';
import { AppState } from 'src/app/store/reducers';
import { DocumentActionType } from 'src/app/store/actions/document.action';

@Component({
  selector: 'app-consent-form',
  templateUrl: './consent-form.component.html',
  styleUrls: ['./consent-form.component.scss']
})
export class ConsentFormComponent {
  patient: Patient | undefined = undefined;
  date: string | null;
  signature: string = "";
  snackBarRef: MatSnackBarRef<TextOnlySnackBar> | null = null;
  fileName: string = "";

  constructor(
    private router: Router, 
    private datepipe: DatePipe, 
    private apiService: OfficeApiService, 
    private snackBar: MatSnackBar,
    private store: Store<AppState>) {
    this.store.select(state => state.selectedPatient.patients)
        .subscribe((selectedPatients) => {this.onPatientSelected(selectedPatients)});

    this.date = this.datepipe.transform(new Date(), 'MM/dd/yyyy');
  }

  onPatientSelected(selected: Patient[]) {
    if (selected?.length > 0) {
      this.patient = selected.at(0);
    }
  }

  onSigned(event: any)
  {
    this.signature = event;

    var data = {data: [{
      patientNo: this.patient?.patientNo, 
      patientName: this.getName(), 
      signature: this.signature}]};

    this.apiService.submitDocument(data, "consent")
      .subscribe({
        next: (data) => this.fileName = data,
        error: (e) => this.displayFailure(),
        complete: () => this.displaySuccess()
      });
  }

  displaySuccess(){
    this.openSnackBar("Success!", "X");
    this.snackBarRef?.afterDismissed().subscribe(() => {
      this.store.dispatch({
        type: DocumentActionType.SELECT_DOCUMENT,
        payload: {
          docLink: this.fileName
        }
      });
      this.router.navigateByUrl('/doc-viewer', {state: {fileName: this.fileName}});
    });
  }

  displayFailure() {
    this.openSnackBar("Failure!", "X");
    this.snackBarRef?.afterDismissed().subscribe(() => {
      this.router.navigateByUrl('/patient-list', {state: {patient: this.patient}});
    });
  }

  openSnackBar(message: string, type: string) { 
    this.snackBarRef = this.snackBar.open(message, type, {duration: 2000}); 
  }

  getName(): string {
    return this.patient?.firstName + ' ' + this.patient?.lastName;
  }
}
