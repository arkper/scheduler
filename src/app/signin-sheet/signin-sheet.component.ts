import { Component, ViewChild } from '@angular/core';
import { CellClickedEvent, GridApi, GridOptions } from 'ag-grid-community';
import { OfficeApiService } from '../services/office-api.service';
import { Appointment, Patient, Provider } from '../store/model/patient.model';
import { SigPadComponent } from '../sig-pad/sig-pad.component';
import { Subject } from 'rxjs';
import { MatSnackBar, MatSnackBarRef, TextOnlySnackBar } from '@angular/material/snack-bar';
import { DatePipe } from '@angular/common';

@Component({
  selector: 'app-signin-sheet',
  templateUrl: './signin-sheet.component.html',
  styleUrls: ['./signin-sheet.component.scss']
})
export class SigninSheetComponent {
  isPatient: Boolean = true;
  patient: Patient | null = null;
  appointment: Appointment | null = null;
  firstName: string = "";
  lastName: string = "";
  signature: string = "";
  date: string  = new Date().toLocaleDateString();
  providers!: Provider[];
  provider!: string;

  constructor(
    private apiService: OfficeApiService, 
    private snackBar: MatSnackBar,
    private datepipe: DatePipe){
    this.providers = apiService.providers;
    this.provider = this.providers.at(0)?.providerName ?? "";
  }

  resetRequest: Subject<boolean> = new Subject();
  snackBarRef: MatSnackBarRef<TextOnlySnackBar> | null = null;

  gridData: any[] = [];

  gridData1: any[] = [];

  private gridApi: GridApi | null = null;

  gridOptions: GridOptions = {
    rowHeight: 40,
    columnDefs : [
        { field: "patientNo", flex: 25, sortable: true, filter: 'agNumberColumnFilter'},
        { field: 'lastName', flex: 50, sortable: true, filter: 'agTextColumnFilter'},
        { field: 'firstName', flex: 50, sortable: true, filter: 'agTextColumnFilter'},
        { field: 'birthDate', flex: 50, sortable: true, filter: 'agDateColumnFilter', cellRenderer: (value: any) => this.datepipe.transform(value.data['birthDate'])}        
    ]};
    gridOptions1: GridOptions = {
      rowHeight: 40,
      columnDefs : [
          { field: "apptName", flex: 100, sortable: true, filter: 'agTextColumnFilter'},
          { field: 'apptDate', flex: 100, sortable: true, filter: 'agDateColumnFilter', cellRenderer: (value: any) => this.datepipe.transform(value.data['apptDate'])},
          { field: 'apptStartTime', flex: 50, sortable: true, filter: 'agTextColumnFilter'},
          { field: 'provider', flex: 100, sortable: true, filter: 'agTextColumnFilter'}        
      ]};
  
  clearSelection() {
    this.lastName = '';
    this.firstName = '';
  }

  switchMode() {
    this.isPatient = !this.isPatient;

    if (!this.isPatient) {
      this.patient = null;
    }
    this.resetRequest.next(true);
    this.clearSelection();
    this.provider = this.providers.at(0)?.providerName ?? "";
  }

  onGridReady({ api }: { api: GridApi }) {
    this.gridApi = api;
    this.gridApi.sizeColumnsToFit({
      defaultMinWidth: 30
    })
  }

  onCellClicked( e: CellClickedEvent): void {
    this.patient = e.data;
    e.node.setSelected(true);
    console.log(this.patient);
    this.firstName = this.patient!.firstName
    this.lastName = this.patient!.lastName;
    this.refreshPatientAppts();
  }

  onAppointmentCellClicked( e: CellClickedEvent): void {
    this.appointment = e.data;
    e.node.setSelected(true);
    console.log(this.appointment);
    this.provider = this.appointment!.provider;
  }

  refreshPatientAppts() {
    this.apiService.getPatientAppts(this.patient!!.patientNo)
    .subscribe({next: data => this.gridData1 = data});
  }

  requestSignature(){
    let requestData = {};

    if (this.isPatient && this.patient != null) {
      requestData = {
        docType: "signin",
        visitor: this.patient.firstName + ' ' + this.patient.lastName,
        doctor: this.provider,
        apptNo: this.appointment?.apptNo ?? null
      }
    } else if (this.firstName && this.lastName) {
      requestData = {
        docType: "signin",
        visitor: this.firstName + ' ' + this.lastName,
        doctor: this.provider,
        apptNo: null
      }
    } else {
      return;
    }

    this.apiService.requestSignature(requestData)
    .subscribe({
      next: data => {console.log(data); this.clearSelection()},
      error: e => {console.log(e); this.displayFailure()},
      complete: () => this.displaySuccess()
    });
  }

  onSigned(event: any) {
    this.signature = event;
    console.log(this.isPatient)

    if (this.isPatient && this.patient != null) {
      this.apiService.saveSigninRecord({
        id: null, 
        visitorName: this.patient.firstName + ' ' + this.patient.lastName,
        dateTimeIn: null,
        dateTimeOut: null,
        toBeSeenBy: this.provider,
        signinImage: this.signature
      }).subscribe({
        next: data => console.log(data),
        error: err => this.displayFailure(),
        complete: () => this.updateAppt()})
      } else {
        this.apiService.saveSigninRecord({
          id: null, 
          visitorName: this.firstName + ' ' + this.lastName,
          dateTimeIn: null,
          dateTimeOut: null,
          toBeSeenBy: this.provider,
          signinImage: this.signature
      }).subscribe({
        next: data => console.log(data),
        error: err => this.displayFailure(),
        complete: () => this.displaySuccess()})
    }
  }

  updateAppt() {
    if (this.appointment) {
      console.log('Updating appointment: ' + this.appointment);
      this.apiService.updateAppointment(this.appointment)
        .subscribe({
          next: appt => console.log(appt),
          error: err => this.displayFailure(),
          complete: () => this.displaySuccess()});
      return;
    }
    this.displaySuccess()
  }

  onProviderChange(event: any) {
    this.provider = event.target.value;
    console.log(this.provider);
  }

  lastNameChanged(event: any) {
    this.lastName = event.target.value;
    this.executeSearch();
  }

  frstNameChanged(event: any) {
    this.firstName = event.target.value;
    this.executeSearch();
  }

  executeSearch()
  {
    const lastNamePattern = this.lastName === ''? 'any' : this.lastName;
    const firstNamePattern = this.firstName === ''? 'any' : this.firstName;

    this.gridData = [];
    this.apiService.getPatientsByName(lastNamePattern, firstNamePattern)
      .subscribe({
        next: rows => this.gridData = rows,
        error: err => console.log(err),
        complete: () => console.log('Loaded rows: ' + this.gridData.length)
      });
  }

  displaySuccess() {    
    this.openSnackBar("Success!", "X");
    this.resetRequest.next(true);
  }

  displayFailure() {
    this.openSnackBar("Failure!", "X");
  }

  openSnackBar(message: string, type: string) { 
    this.snackBarRef = this.snackBar.open(message, type, {duration: 2000}); 
  }
}
