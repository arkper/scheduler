import { Component } from '@angular/core';
import { MatSnackBar, MatSnackBarRef, TextOnlySnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';
import { OfficeApiService } from '../../services/office-api.service';
import { Company, Document, Patient, PatientInsurance } from '../../store/model/patient.model';
import { DatePipe } from '@angular/common';
import { Store } from '@ngrx/store';
import { AppState } from '../../store/reducers';
import { DocumentActionType } from '../../store/actions/document.action';

@Component({
  selector: 'app-release-form',
  templateUrl: './release-form.component.html',
  styleUrls: ['./release-form.component.scss']
})
export class ReleaseFormComponent {  
  patient: Patient | undefined = undefined;
  company: Company | null = null;
  fileName: string = "";

  snackBarRef: MatSnackBarRef<TextOnlySnackBar> | null = null;

  pcp: boolean = false;
  ophthalmologist: boolean = false;
  relativeFriend: boolean = false;
  radio: boolean = false;
  internet: boolean = false;
  noreferral: boolean = false;

  signature: string = "";

  constructor(
    private router: Router, 
    private apiService: OfficeApiService,
    private snackBar: MatSnackBar,
    private datepipe: DatePipe,
    private store: Store<AppState>) {
      this.store.select(state => state.selectedPatient.patients)
        .subscribe((selectedPatients) => {this.onPatientSelected(selectedPatients)});

      this.apiService.getCompany()
        .subscribe({next: c => this.company = c});
  }

  onPatientSelected(selected: Patient[]) {
    if (selected?.length > 0) {
      this.patient = selected.at(0);
    }
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
        patientNo: this.patient?.patientNo, 
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

  getDate(): string {
    return new Date().toLocaleDateString();
  }

  getCompanyName(): string {
    return this.company?.name ?? "";
  }
}
