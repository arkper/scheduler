import { Component, OnInit } from '@angular/core';
import { MatSnackBar, MatSnackBarRef, TextOnlySnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';
import { OfficeApiService } from '../../services/office-api.service';
import { Company, Document, Patient, PatientInsurance } from '../../store/model/patient.model';
import { DatePipe } from '@angular/common';
import { Store } from '@ngrx/store';
import { AppState } from '../../store/reducers';
import { DocumentActionType } from '../../store/actions/document.action';
import { BaseFormComponent } from '../base-form/base-form.component';

@Component({
  selector: 'app-release-form',
  templateUrl: './release-form.component.html',
  styleUrls: ['./release-form.component.scss']
})
export class ReleaseFormComponent extends BaseFormComponent implements OnInit {  
  company: Company | undefined = this.apiService.getCompany();

  constructor(
    override router: Router, 
    override apiService: OfficeApiService,
    override snackBar: MatSnackBar,
    override datepipe: DatePipe,
    override store: Store<AppState>) {
      super(router, apiService, snackBar, datepipe, store);
  }

  override formType = "release";

  override data = {
    company: this.company?.name,
    companyAddress: this.company?.address?.address1,
    companyCity: this.company?.address?.city,
    companyState: this.company?.address?.state,
    companyZip: this.company?.address?.zip,
    companyPhone: this.company?.address?.phone1,
    sexMale: this.patient?.sex,
    address: this.patient?.address?.address1,
    city: this.patient?.address?.city,
    state: this.getState(),
    zip: this.patient?.address?.zip,
    phone: this.patient?.address?.phone1,
    dob: this.patient?.birthDate,
    ssn: this.patient?.ssNo,
    carrier: this.getCarrier(),
    insuredSelf: this.getRelationship() === "Self",
    insuredSpouse: this.getRelationship() === "Spouse",
    insuredChild: this.getRelationship() === "Child",
    memberId: this.getMemeberId(),
    memberName: this.getName(), 
    memberDob: this.patient?.birthDate,
    pcp: false,
    ophthalmologist: false,
    relativeFriend: false,
    radio: false,
    internet: false,
    noreferral: false
  }

  getState(): string {
    return this.apiService.getState(this.patient?.address?.stateNo) ?? "";
  }

  getCarrier(): string {
    const insurenceCode: number | undefined = this.patient?.patientInsurances?.at(0)?.insuranceNo;

    return this.apiService.getCarrier(insurenceCode) ?? "";
  }

  getRelationship(): string {
    const relationshipNo: number | undefined = this.patient?.patientInsurances?.at(0)?.relationToInsuredNo;
    return this.apiService.getRelationship(relationshipNo) ?? "";
  }

  getMemeberId(): string {
    return this.patient?.patientInsurances?.at(0)?.insuredId ?? "";
  }

  getCompanyName(): string {
    return this.company?.name ?? "";
  }
}
