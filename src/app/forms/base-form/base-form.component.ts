import { DatePipe } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { MatSnackBar, MatSnackBarRef, TextOnlySnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';
import { Store } from '@ngrx/store';
import { OfficeApiService } from 'src/app/services/office-api.service';
import { DocumentActionType } from 'src/app/store/actions/document.action';
import { Patient } from 'src/app/store/model/patient.model';
import { AppState } from 'src/app/store/reducers';

@Component({
  selector: 'app-base-form',
  template: `<router-outlet></router-outlet>`
})
export class BaseFormComponent implements OnInit {
  patient: Patient | undefined = undefined;

  signature: string = "";

  fileName: string = "";

  data: {[k: string]: any} = {};

  date: string | null;

  formType: string = "";

  snackBarRef: MatSnackBarRef<TextOnlySnackBar> | null = null;

    constructor(public router: Router,
      public apiService: OfficeApiService,
      public snackBar: MatSnackBar,
      public datepipe: DatePipe,
      public store: Store<AppState>) { 
        this.store.select(state => state.selectedPatient.patients)
          .subscribe((selectedPatients) => {this.onPatientSelected(selectedPatients)});
        this.date = this.datepipe.transform(new Date(), 'MM/dd/yyyy');
      }
  
    ngOnInit(): void { }

    openPage(formName: string) {
      this.router.navigateByUrl(`/${formName}-form`);
    }

    onPatientSelected(selected: Patient[]) {
      if (selected?.length > 0) {
        this.patient = selected.at(0);
      }
    }
  
    onSigned(event: any) {
      this.signature = event;
  
      this.data['firstName'] = this.patient?.firstName;
      this.data['lastName'] = this.patient?.lastName;
      this.data['address'] = this.patient?.address?.address1;
      this.data['city'] = this.patient?.address?.city;
      this.data['state'] = this.getState();
      this.data['zip'] = this.patient?.address?.zip;
      this.data['phone'] = this.patient?.address?.phone1;
      this.data['dob'] = this.getDob();
      this.data['ssn'] = this.patient?.ssNo;
      this.data['sex'] = this.patient?.sex,
 
      this.data['signature'] = this.signature.substring(this.signature.indexOf(',') + 1);
  
      const formData = {
        patientNo: this.patient?.patientNo,
        formType: this.formType,
        data : this.data
      };
  
      console.log('Form Data:');
      console.log(formData);
  
      this.apiService.generateDocument(formData)
        .subscribe({
          next: (data) => {this.fileName = data},
          error: (e) => {console.log(e); this.displayFailure()},
          complete: () => this.displaySuccess()
        });
    } 
  
    displaySuccess() {
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
  
    getDob(): string
    {
      return this.datepipe.transform(this.patient?.birthDate, "MM/dd/yyyy") ?? "";
    }
    
    getDate(): string {
      return new Date().toLocaleDateString();
    }
  
    toggle(key: string) {
      this.data[key] = !this.data[key];
    }

    getName(): string {
      return this.patient?.firstName + ' ' + this.patient?.lastName;
    }     
    
    getState(): string {
      return this.apiService.getState(this.patient?.address?.stateNo) ?? "";
    }
}
