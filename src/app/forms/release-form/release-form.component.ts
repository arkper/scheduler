import { Component, OnInit } from '@angular/core';
import { MatSnackBar, MatSnackBarRef, TextOnlySnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';
import { OfficeApiService } from '../../services/office-api.service';
import { DatePipe } from '@angular/common';
import { Store } from '@ngrx/store';
import { AppState } from '../../store/reducers';
import { BaseFormComponent } from '../base-form/base-form.component';

@Component({
  selector: 'app-release-form',
  templateUrl: './release-form.component.html',
  styleUrls: ['./release-form.component.scss']
})
export class ReleaseFormComponent extends BaseFormComponent implements OnInit {  
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
