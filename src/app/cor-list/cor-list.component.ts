import { DatePipe } from '@angular/common';
import { Component } from '@angular/core';
import { GridOptions } from 'ag-grid-community';
import { OfficeApiService } from '../services/office-api.service';
import { CorrespondenceReportRequest } from '../store/model/patient.model';
import { GridApi } from '@ag-grid-community/all-modules';
import { saveAs } from 'file-saver';
import { MatSnackBar } from '@angular/material/snack-bar';

@Component({
  selector: 'app-cor-list',
  templateUrl: './cor-list.component.html',
  styleUrls: ['./cor-list.component.scss'],
})
export class CorListComponent {
  constructor(private apiService: OfficeApiService, private datepipe: DatePipe, private snackBar: MatSnackBar){
    this.apiService.getInsurances()
      .subscribe({next: data => this.insurances = data});
  }

  gridOptions: GridOptions = {
    rowHeight: 30,
    columnDefs : [
        { field: "patientNo", flex: 25, sortable: true, filter: 'agNumberColumnFilter'},
        { field: 'lastName', flex: 50, sortable: true, filter: 'agTextColumnFilter'},
        { field: 'firstName', flex: 50, sortable: true, filter: 'agTextColumnFilter'},
        { field: 'age', flex: 50, sortable: true, filter: 'agNumberColumnFilter'},        
        { field: 'lastExamDate', flex: 50, sortable: true, filter: 'agDateColumnFilter',  cellRenderer: (value: any) => this.datepipe.transform(value.data['lastExamDate'])},
        { field: 'insuranceName', flex: 75, sortable: true, filter: 'agTextColumnFilter'}        
    ]
  }

  gridData: any[] = [];
  rowCount: number = 0;

  fromBirthDate: Date = this.subtractYears(new Date(), 45);
  toBirthDate: Date = this.subtractYears(new Date(), 5);
  fromLastExamDate: Date = this.subtractYears(new Date(), 1);
  toLastExamDate: Date = new Date();
  fromRecallDate: Date | null = null;
  toRecallDate: Date | null = null;
  recallType: number = 0;
  recallTypes: any[] = [{id: 0, desc: "Any"}, {id: 2, desc: "12 Month Adult"}, {id: 4, desc: "Medicare"}, {id:3, desc: "Recall"}];
  selectedInsurances: number[] = [];
  insurances!: [{insuranceNo: number, insuranceName: string}];

  onGridReady({ api }: { api: GridApi }) {
    api.sizeColumnsToFit();
  }

  onRowDataUpdated(_: any) {
    this.rowCount = this.gridData.length;
  }

  run() {
    this.apiService.getCorrespondenceReport(this.createRequest())
      .subscribe({next: rows => this.gridData = rows})
  }

  download() {
    this.apiService.downloadReport(this.createRequest())
      .subscribe({
        next: blob => saveAs(blob, "CorrespondenceReport.xls"),
        error: err => this.displayFailure(),
        complete: () => this.displaySuccess()});
  }

  createRequest(): CorrespondenceReportRequest {
    let request: CorrespondenceReportRequest = {
      fromBirthDate: this.datepipe.transform(this.fromBirthDate, 'yyyy-MM-dd') ?? "",
      toBirthDate: this.datepipe.transform(this.toBirthDate, 'yyyy-MM-dd') ?? "",
      fromLastExamDate: this.datepipe.transform(this.fromLastExamDate, 'yyyy-MM-dd') ?? "",
      toLastExamDate: this.datepipe.transform(this.toLastExamDate, 'yyyy-MM-dd') ?? "",
      fromRecallDate: this.datepipe.transform(this.fromRecallDate, 'yyyy-MM-dd') ?? null,
      toRecallDate: this.datepipe.transform(this.toRecallDate, 'yyyy-MM-dd') ?? null,
      insurances: this.selectedInsurances,
      recallType: this.recallType
    }
    console.log(request);
    return request;
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

  subtractYears(date: Date, years: number) {
    date.setFullYear(date.getFullYear() - years);
    return date;
  }
}

