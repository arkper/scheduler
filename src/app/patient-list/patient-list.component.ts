import { Component } from '@angular/core';
import { CellClickedEvent, ColDef, GridApi, GridOptions } from 'ag-grid-community';
import { Observable } from 'rxjs';
import { Router } from '@angular/router';
import { OfficeApiService } from '../services/office-api.service';
import { Patient, Document, EMPTY_DOCUMENT } from '../store/model/patient.model';
import { Store } from '@ngrx/store';
import { PatientActionType } from '../store/actions/patient.action';
import { AppState } from '../store/reducers';
import { DocumentActionType } from '../store/actions/document.action';
import { DatePipe } from '@angular/common';


@Component({
  selector: 'app-patient-list',
  templateUrl: './patient-list.component.html',
  styleUrls: ['./patient-list.component.scss']
})
export class PatientListComponent {
  patient: Patient | null = null;
  doc: Document | null = null;

  firstName: string = "";
  lastName: string = "";

  gridData: any[] = [];
  
  constructor(
    private apiService: OfficeApiService, 
    private router: Router, 
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

  docColumnDefs: ColDef[] = [
    { field: 'formType', flex: 50, sortable: true, filter: 'agTextColumnFilter'},
    { field: 'recordedOn', flex: 50, sortable: true, filter: 'agDateColumnFilter', cellRenderer: (value: any) => this.datepipe.transform(value.data['recordedOn'])},
    { field: 'expiresOn', flex: 50, sortable: true, filter: 'agDateColumnFilter', cellRenderer: (value: any) => this.datepipe.transform(value.data['expiresOn'])}
  ];

  public defaultColDef: ColDef = {
    sortable: true,
    filter: true,
  };

  public docRowData$!: Observable<Document[]>;
  public hippaRowData$!: Observable<Document[]>;
  
  private gridApi: GridApi | null = null;

  onPatientSelectionChanged(currentSelection: Patient[])
  {
    let current = currentSelection?.at(0);
    console.log(current);

    if (current !== undefined && current?.patientNo !== 0) {
      this.patient = current;
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
    this.store.dispatch({
      type: PatientActionType.SELECT_PATIENT,
      payload: e.data
    });
    //this.patient = e.data;
    e.node.setSelected(true);
    //this.refreshPatientDocs();
  }

  refreshPatientDocs()
  {
    if (this.patient !== null)
    {
      console.log("Getting docs for patient: " + this.patient.patientNo);
      this.docRowData$ = this.apiService.getEdocs(this.patient.patientNo);
      this.hippaRowData$ = this.apiService.getHipaaDocs(this.patient.patientNo);
    }
  }

  clearSelection(): void {
    this.gridApi?.deselectAll();
    this.lastName = "";
    this.firstName = "";
    this.executeSearch();
  }

  externalFilterChanged(event: any){
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
        this.refreshPatientDocs();
      }
    });
    // console.log("Current patient:");
    // console.log(this.patient);
  }

  addNewDoc(formType: string) {
    if (this.patient === null)
    {
      alert('Please select a patient first!');
      return;
    }

    this.store.dispatch({
      type: PatientActionType.SELECT_PATIENT,
      payload: this.patient
    });

    this.store.dispatch({
      type: DocumentActionType.SELECT_DOCUMENT,
      payload: EMPTY_DOCUMENT
    });

    console.log("Creating new " + formType);
    this.router.navigateByUrl(`/${formType}-form`, {state: {patient: this.patient}});
  }

  addNewEDoc()
  {
    const formType = (document.getElementById("edocSelect") as HTMLSelectElement).value;
    this.addNewDoc(formType);
  }

  addNewHipaaDoc()
  {
    const formType = (document.getElementById("hipaaDocSelect") as HTMLSelectElement).value;
    this.addNewDoc(formType);
  }

  viewDoc() {
    if (!this.doc) {
      return;
    }

    this.router.navigateByUrl('/doc-viewer');
  }

  onDocCellClicked( e: CellClickedEvent): void {
    this.doc = e.data;
    this.store.dispatch(
      {
        type: DocumentActionType.SELECT_DOCUMENT,
        payload: this.doc
      }
    )
  }

  onDocCellDoubleClicked( e: CellClickedEvent): void {
    this.viewDoc();
  }
}
