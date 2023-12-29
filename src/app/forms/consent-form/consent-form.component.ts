import { DatePipe } from '@angular/common';
import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { OfficeApiService } from '../../services/office-api.service';
import { MatSnackBar, MatSnackBarRef, TextOnlySnackBar } from '@angular/material/snack-bar';
import { Document, Patient } from '../../store/model/patient.model';
import { Store } from '@ngrx/store';
import { AppState } from 'src/app/store/reducers';
import { DocumentActionType } from 'src/app/store/actions/document.action';
import { BaseFormComponent } from '../base-form/base-form.component';

@Component({
  selector: 'app-consent-form',
  templateUrl: './consent-form.component.html',
  styleUrls: ['./consent-form.component.scss']
})
export class ConsentFormComponent extends BaseFormComponent implements OnInit {
  constructor(
    override router: Router, 
    override datepipe: DatePipe, 
    override apiService: OfficeApiService, 
    override snackBar: MatSnackBar,
    override store: Store<AppState>) {
      super(router, apiService, snackBar, datepipe, store);
  }
  override formType = "consent";
  override data = {
    firstName: this.patient?.firstName,
    lastName: this.patient?.lastName,
    address: this.patient?.address?.address1,
    city: this.patient?.address?.city,
    state: this.getState(),
    zip: this.patient?.address?.zip,
    phone: this.patient?.address?.phone1,
    dob: this.getDob(),
    ssn: this.patient?.ssNo,
    sex: this.patient?.sex,  
    company: this.company?.name,
    companyAddress: this.company?.address?.address1,
    companyCity: this.company?.address?.city,
    companyState: this.company?.address?.state,
    companyZip: this.company?.address?.zip,
    companyPhone: this.company?.address?.phone1,
    patientName: this.patient?.firstName + " " + this.patient?.lastName
  }
}
