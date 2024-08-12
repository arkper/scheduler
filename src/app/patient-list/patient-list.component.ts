import { Component } from '@angular/core';
import { CellClickedEvent, ColDef, GridApi, GridOptions } from 'ag-grid-community';
import { OfficeApiService } from '../services/office-api.service';
import { Patient, Document, EMPTY_DOCUMENT } from '../store/model/patient.model';
import { Store } from '@ngrx/store';
import { PatientActionType } from '../store/actions/patient.action';
import { AppState } from '../store/reducers';
import { DatePipe } from '@angular/common';
import { _isNumberValue } from '@angular/cdk/coercion';

@Component({
  selector: 'app-patient-list',
  templateUrl: './patient-list.component.html',
  styleUrls: ['./patient-list.component.scss']
})
export class PatientListComponent {
  patient: Patient | null = null;
  doc: Document | null = null;
  patientNo: string = "";

  firstName: string = "";
  lastName: string = "";

  gridData: any[] = [];
  
  constructor(
    private apiService: OfficeApiService, 
    private store: Store<AppState>,
    private datepipe: DatePipe) {
    this.store.select(state => state.selectedPatient.patients)
      .subscribe((selectedPatients) => {this.onPatientSelectionChanged(selectedPatients)});
  }

  gridOptions: GridOptions = {
    rowHeight: 30,
    columnDefs : [
        { field: "patientNo", flex: 25, sortable: true, filter: 'agNumberColumnFilter'},
        { field: 'lastName', flex: 50, sortable: true, filter: 'agTextColumnFilter'},
        { field: 'firstName', flex: 50, sortable: true, filter: 'agTextColumnFilter'},
        { field: 'birthDate', flex: 50, sortable: true, filter: 'agDateColumnFilter', cellRenderer: (value: any) => this.datepipe.transform(value.data['birthDate'])}        
    ]
  }

  public defaultColDef: ColDef = {
    sortable: true,
    filter: true,
  };

  private gridApi: GridApi | null = null;

  onPatientSelectionChanged(currentSelection: Patient[])
  {
    let current = currentSelection?.at(0);
    if (this.patient?.patientNo === current?.patientNo){
      return;
    }

    console.log(current);

    if (current !== undefined && current?.patientNo !== 0) {
      this.patient = current;
      this.patientNo = this.patient.patientNo.toString();
      this.firstName = this.patient.firstName;
      this.lastName = this.patient.lastName;
    } else {
      this.firstName = "";
      this.lastName = "";
    }
    this.executeSearch();
  }

  executeSearch()
  {
    const lastNamePattern = this.lastName === ''? 'any' : this.lastName;
    const firstNamePattern = this.firstName === ''? 'any' : this.firstName;

    this.gridData = [];
    if (this.patientNo && _isNumberValue(this.patientNo)){
      this.apiService.getPatientsById(this.patientNo)
      .subscribe({
        next: data => this.gridData = [data],
        error: err => console.log(err),
        complete: () => console.log('Loaded patient: ' + this.gridData.length)
      });
      return;
    }
    this.apiService.getPatientsByName(lastNamePattern, firstNamePattern)
      .subscribe({
        next: rows => this.gridData = rows,
        error: err => console.log(err),
        complete: () => console.log('Loaded rows: ' + this.gridData.length)
      });
  }

  onGridReady({ api }: { api: GridApi }) {
    this.gridApi = api;
    this.gridApi.sizeColumnsToFit({
      defaultMinWidth: 30
    })
  }

  onRowDataUpdated({ api }: { api: GridApi }) {
    this.selectFirst();
  }

  onCellClicked( e: CellClickedEvent): void {
    this.refresh(e.data);
    //this.patient = e.data;
    e.node.setSelected(true);
  }

  refresh(patient: Patient | null){
    this.store.dispatch({
      type: PatientActionType.SELECT_PATIENT,
      payload: patient == null? this.patient : patient
    });
  }

  /**
   * This is added to remove all requests from the request queue
   */
  clearQueue() {
    this.apiService.clearQueue().subscribe();
  }

  clearSelection(): void {
    this.gridApi?.deselectAll();
    this.patientNo = "";
    this.lastName = "";
    this.firstName = "";
    this.executeSearch();
  }

  externalFilterChanged(event: any){
    this.patientNo = (document.getElementById("patientId") as HTMLInputElement).value; 
    this.lastName = (document.getElementById("lastName") as HTMLInputElement).value;
    this.firstName = (document.getElementById("firstName") as HTMLInputElement).value;
    this.executeSearch();
  }

  selectFirst() {
    // console.log(this.gridApi?.getRowNode("0"))
    this.gridOptions.api?.forEachNode(node => {
      // console.log('Node: ' + node.rowIndex);
      if (node.rowIndex === 0) {
        this.patient = node.data;
        // console.log(node.data);
        node.setSelected(true);
        this.store.dispatch({
          type: PatientActionType.SELECT_PATIENT,
          payload: this.patient
        });
      }
    });
  }
}
