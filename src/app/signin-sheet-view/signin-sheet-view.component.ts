import { Component } from '@angular/core';
import { GridApi, GridOptions } from 'ag-grid-community';
import { OfficeApiService } from '../services/office-api.service';
import { DatePipe } from '@angular/common';

@Component({
  selector: 'app-signin-sheet-view',
  templateUrl: './signin-sheet-view.component.html',
  styleUrls: ['./signin-sheet-view.component.scss']
})
export class SigninSheetViewComponent {
  constructor(private apiService: OfficeApiService, private datepipe: DatePipe) {
    this.apiService.getSigninRecords()
      .subscribe({next: data => {
        console.log(data);
        this.gridData = data;
        this.autoSize();
      }});
  }
  gridData: any[] = [];

  private gridApi: GridApi | null = null;

  gridOptions: GridOptions = {
    rowHeight: 40,
    columnDefs : [
        { field: "visitorName", flex: 100},
        { field: 'dateTimeIn', flex: 100, cellRenderer: (value: any) => this.datepipe.transform(value.data['dateTimeIn'], "MM/dd/yyyy hh:mm")},
        { field: 'toBeSeenBy', flex: 100},        
        { field: 'signinImage', flex: 100, cellRenderer: (value: any) => `<img style="height: 40px; width: 100px" src="${value.data['signinImage']}"/>` }        
    ]};

  onGridReady({ api }: { api: GridApi }) {
    this.gridApi = api;
    this.autoSize();
  }

  autoSize() {
    this.gridApi?.sizeColumnsToFit({
      defaultMinWidth: 30
    })
  }
  
}
