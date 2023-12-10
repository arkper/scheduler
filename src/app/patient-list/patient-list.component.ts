import { Component } from '@angular/core';
import { CellClickedEvent, ColDef, GridApi, GridOptions } from 'ag-grid-community';
import { Observable } from 'rxjs';
import { Router } from '@angular/router';
import { OfficeApiService } from '../office-api.service';
import { settings } from './patient-list.settings';
import { Patient, Document } from './patient-model';


@Component({
  selector: 'app-patient-list',
  templateUrl: './patient-list.component.html',
  styleUrls: ['./patient-list.component.scss']
})
export class PatientListComponent {
  public docColumnDefs: ColDef[] = [
    { field: 'formType', flex: 50},
    { field: 'recordedOn', flex: 50},
    { field: 'expiresOn', flex: 50}
  ];

  patient: Patient | null = null;
  doc: Document | null = null;

  firstName: string = "";
  lastName: string = "";

  gridData: any[] = [];
  
  public defaultColDef: ColDef = {
    sortable: true,
    filter: true,
  };

  public docRowData$!: Observable<Document[]>;
  public hippaRowData$!: Observable<Document[]>;

  gridOptions: GridOptions = settings;
  private gridApi: GridApi | null = null;

  constructor(private apiService: OfficeApiService, private router: Router) {
    this.patient = this.router.getCurrentNavigation()?.extras.state?.['patient'];

    if (this.patient == null) {
      this.firstName = "";
      this.lastName = "";
    }
    else {
      this.firstName = this.patient.firstName;
      this.lastName = this.patient.lastName;
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
        complete: () => console.log(this.gridData)
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
    this.patient = e.data;
    console.log(this.patient);
    this.refreshPatientDocs();
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
  
  addNewEDoc()
  {
    if (this.patient === null)
    {
      alert('Please select a patient first!');
      return;
    }
    const formType = (document.getElementById("edocSelect") as HTMLSelectElement).value;
    console.log("Creating new " + formType);
    this.router.navigateByUrl(`/${formType}-form`, {state: {patient: this.patient}});
  }

  addNewHipaaDoc()
  {
    if (this.patient === null)
    {
      alert('Please select a patient first!');
      return;
    }
    const formType = (document.getElementById("hipaaDocSelect") as HTMLSelectElement).value;
    console.log("Creating new " + formType);
    console.log(this.patient);
    this.router.navigateByUrl(`/${formType}-form`, {state: {patient: this.patient}});
  }

  viewDoc() {
    if (!this.doc) {
      return;
    }

    const fileName = this.doc?.docLink.substring(this.doc?.docLink.lastIndexOf("/") + 1);
    this.router.navigateByUrl('/doc-viewer', {state: {fileName: fileName}});
  }

  onDocCellClicked( e: CellClickedEvent): void {
    this.doc = e.data;
  }

  onDocCellDoubleClicked( e: CellClickedEvent): void {
    // const docLink: string = e.data.docLink;
    // const fileName: string = docLink.substring(docLink.lastIndexOf("/"));
    // this.router.navigateByUrl('/doc-viewer', {state: {fileName: fileName}});
    this.viewDoc();
  }
}
