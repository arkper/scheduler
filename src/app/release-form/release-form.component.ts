import { Component } from '@angular/core';
import { MatSnackBar, MatSnackBarRef, TextOnlySnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';
import { OfficeApiService } from '../office-api.service';
import { Company, Patient, PatientInsurance } from '../patient-list/patient-model';
import { DatePipe } from '@angular/common';

@Component({
  selector: 'app-release-form',
  templateUrl: './release-form.component.html',
  styleUrls: ['./release-form.component.scss']
})
export class ReleaseFormComponent {  
  constructor(
    private router: Router, 
    private apiService: OfficeApiService,
    private snackBar: MatSnackBar,
    private datepipe: DatePipe) {
      this.patient = this.router.getCurrentNavigation()?.extras.state?.['patient'];
      this.apiService.getCompany()
        .subscribe({next: c => this.company = c});
    }

  patient: Patient | null = null;
  company: Company | null = null;
  fileName: string = "";

  snackBarRef: MatSnackBarRef<TextOnlySnackBar> | null = null;
  patientNo: number = 111;

  pcp: boolean = false;
  ophthalmologist: boolean = false;
  relativeFriend: boolean = false;
  radio: boolean = false;
  internet: boolean = false;
  noreferral: boolean = false;

  signature: string = "";

  getDate(): string {
    return new Date().toLocaleDateString();
  }

  onSigned(event: any)
  {
    this.signature = event;

    const data = {data: [
      {
        company: this.company?.name,
        companyAddress: this.company?.address?.address1,
        companyCity: this.company?.address?.city,
        companyState: this.company?.address?.state,
        companyZip: this.company?.address?.zip,
        companyPhone: this.company?.address?.phone1,
        patientNo: this.patientNo, 
        patientName: this.getName(), 
        sexMale: this.patient?.sex,
        signature: this.signature,
        firstName: this.patient?.firstName,
        lastName: this.patient?.lastName,
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
        pcp: this.pcp,
        ophthalmologist: this.ophthalmologist,
        relativeFriend: this.relativeFriend,
        radio: this.radio,
        internet: this.internet,
        noreferral: this.noreferral
      }
    ]};

    console.log(data);

    this.apiService.submitDocument(data, "release")
      .subscribe({
        next: (data) => {this.fileName = data},
        error: (e) => {console.log(e); this.displayFailure()},
        complete: () => this.displaySuccess()
      });
  }

  displaySuccess(){
    this.openSnackBar("Success!", "X");
    this.snackBarRef?.afterDismissed().subscribe(() => {
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
    this.snackBarRef = this.snackBar.open(message, type, {duration: 3000}); 
  }

  getName(): string
  {
    return this.patient?.firstName + " " + this.patient?.lastName;
  }

  getDob(): string
  {
    return this.datepipe.transform(this.patient?.birthDate, "MM/dd/yyyy") ?? "";
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
}
