import { Component, Input, OnInit } from '@angular/core';
import { CellClickedEvent, ColDef, GridApi, GridOptions } from 'ag-grid-community';
import { Observable } from 'rxjs';
import { Router } from '@angular/router';
import { OfficeApiService } from '../services/office-api.service';
import { Patient, Document, EMPTY_DOCUMENT, DocType } from '../store/model/patient.model';
import { Store } from '@ngrx/store';
import { AppState } from '../store/reducers';
import { DocumentActionType } from '../store/actions/document.action';
import { DatePipe } from '@angular/common';
import { MatSnackBar, MatSnackBarRef, TextOnlySnackBar } from '@angular/material/snack-bar';

@Component({
  selector: 'app-patient-doc',
  templateUrl: './patient-doc.component.html',
  styleUrls: ['./patient-doc.component.scss'],
})
export class PatientDocComponent  implements OnInit {
  @Input() title: string = "";
  @Input() category: string = "EDoc";
  doc: Document | null = null;
  patient: Patient | null = null;

  constructor(
    private apiService: OfficeApiService,
    private datepipe: DatePipe,
    private snackBar: MatSnackBar,     
    private store: Store<AppState>,
    private router: Router) {
      this.store.select(state => state.selectedPatient.patients)
        .subscribe((selectedPatients) => this.handlePatient(selectedPatients[0]));
    }

  selectedDocType!: DocType;
  docTypes!: DocType[];

  public docRowData$!: Observable<Document[]>;

  docColumnDefs: ColDef[] = [
    { field: 'formType', flex: 50, sortable: true, filter: 'agTextColumnFilter'},
    { field: 'recordedOn', flex: 50, sortable: true, filter: 'agDateColumnFilter', cellRenderer: (value: any) => this.datepipe.transform(value.data['recordedOn'])},
    { field: 'expiresOn', flex: 50, sortable: true, filter: 'agDateColumnFilter', cellRenderer: (value: any) => this.datepipe.transform(value.data['expiresOn'])}
  ];

  private gridApi: GridApi | null = null;

  ngOnInit() {
    this.docTypes = this.apiService.getDocTypes(this.category);
    this.selectedDocType = this.docTypes[0];
  }

  onGridReady({ api }: { api: GridApi }) {
    this.gridApi = api;
    this.gridApi.sizeColumnsToFit({
      defaultMinWidth: 30
    })
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
  
  viewDoc() {
    if (!this.doc) {
      return;
    }

    this.router.navigateByUrl('/doc-viewer');
  }

  handlePatient(patient: Patient){
    if (patient != null){
      this.patient = patient;
    }
    this.refreshPatientDocs();
  }

  refreshPatientDocs()
  {
    if (this.patient !== null)
    {
      console.log("Getting docs for patient: " + this.patient.patientNo);
      this.docRowData$ = this.apiService.getDocs(this.patient.patientNo, this.category);
    }
  }

  addNewDoc()
  {
    if (this.patient === null)
    {
      alert('Please select a patient first!');
      return;
    }

    this.store.dispatch({
      type: DocumentActionType.SELECT_DOCUMENT,
      payload: EMPTY_DOCUMENT
    });

    console.log("Creating new " + this.selectedDocType.desc);
   
    const requestData = {
      patientNo: this.patient.patientNo,
      docType: this.selectedDocType.id
    };

    this.apiService.requestSignature(requestData)
      .subscribe({
        next: data => {this.handleResponse(data)},
        error: e => {console.log(e); this.displayFailure()}
      });

    // this.router.navigateByUrl(`/${this.selectedDocType.id}-form`, {state: {patient: this.patient}});
  }

  handleResponse(response: string){
    if (response === "ok"){
      // display success
      this.openSnackBar("Success!", "X");
    }
    this.openSnackBar("Failure - " + response, "X");
  }

  displaySuccess() {
    this.openSnackBar("Success!", "X");
  }

  displayFailure() {
    this.openSnackBar("Failure!", "X");
  }

  openSnackBar(message: string, type: string) { 
    this.snackBar.open(message, type, {duration: 2000}); 
  }
}
