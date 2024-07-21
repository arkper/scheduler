import { Component } from '@angular/core';
import { OfficeApiService } from '../services/office-api.service';
import { DatePipe } from '@angular/common';
import { MatSnackBar } from '@angular/material/snack-bar';
import { CellClickedEvent, GridOptions } from 'ag-grid-community';
import { PaymentComissionsReportRequest, PaymentCommision, Provider } from '../store/model/patient.model';
import { saveAs } from 'file-saver';

@Component({
  selector: 'app-payment-comissions',
  templateUrl: './payment-comissions.component.html',
  styleUrls: ['./payment-comissions.component.scss']
})
export class PaymentComissionsComponent {
  constructor(private apiService: OfficeApiService, private datepipe: DatePipe, private snackBar: MatSnackBar){
    this.apiService.getInsurances()
      .subscribe({next: data => this.insurances = data});
    this.apiService.getProviders()
      .subscribe({next: data => this.providers = data});
  }

  payment: PaymentCommision = this.initPayment();

  fromPaymentPeriod: Date = this.subtractMonths(new Date(), 1);
  toPaymentPeriod: Date = this.subtractMonths(new Date(), 0);
  selectedInsurances: string[] = [];
  insurances!: [{insuranceNo: number, insuranceName: string}];

  selectedProvider: string = "";
  providers!: Provider[];

  gridData: any[] = [];
  rowCount: number = 0;

  gridOptions: GridOptions = {
    rowHeight: 30,
    columnDefs : [
        { field: "id", flex: 25, sortable: true, filter: 'agNumberColumnFilter'},
        { field: 'paymentDate', flex: 50, sortable: true, filter: 'agDateColumnFilter',  cellRenderer: (value: any) => this.datepipe.transform(value.data['paymentDate'])},
        { field: 'paymentAmount', flex: 50, sortable: true, filter: 'agTextColumnFilter'},
        { field: 'insurance', flex: 50, sortable: true, filter: 'agNumberColumnFilter'},        
        { field: 'provider', flex: 50, sortable: true, filter: 'agTextColumnFilter'},
    ]
  }

  onRowDataUpdated(_: any) {
    this.rowCount = this.gridData.length;
  }

  subtractMonths(date: Date, months: number) {
    date.setMonth(date.getMonth() - months);
    return date;
  }

  run() {
    this.initPayment();
    this.apiService.getPaymentComissions(this.createRequest())
      .subscribe({next: rows => this.gridData = rows})
  }

  add()
  {
    this.payment = this.initPayment();
  }
  
  onCellClicked( e: CellClickedEvent): void {
    // this.refresh(e.data);
    this.payment = e.data;
    console.debug('Payment', this.payment);
    e.node.setSelected(true);
  }

  download() {
    this.apiService.downloadComissionsReport(this.createRequest())
      .subscribe({
        next: blob => saveAs(blob, "PaymentCommissions.pdf"),
        error: err => this.displayFailure(),
        complete: () => this.displaySuccess()});
  }

  createRequest(): PaymentComissionsReportRequest {
    let request: PaymentComissionsReportRequest = {
      fromPaymentPeriod: this.datepipe.transform(this.fromPaymentPeriod, 'yyyy-MM-dd') ?? "",
      toPaymentPeriod: this.datepipe.transform(this.toPaymentPeriod, 'yyyy-MM-dd') ?? "",
      insurances: this.selectedInsurances,
      provider: this.selectedProvider
    }
    console.log(request);
    return request;
  }

  displaySuccess() {
    this.openSnackBar("Success!", "X");
    this.run();
  }

  displayFailure() {
    this.openSnackBar("Failure!", "X");
    this.run();
  }

  openSnackBar(message: string, type: string) { 
    this.snackBar.open(message, type, {duration: 2000}); 
  }

  initPayment(): PaymentCommision {
    return {id: 0, paymentDate: new Date(), paymentAmount: 0.0, insurance: "", provider: ""};
  }

  save(){
    if (!this.isValid()) {
      return;
    }

    this.apiService.savePayment(this.payment)
    .subscribe({
      next: _ => this.displaySuccess(),
      complete: () => this.displaySuccess(),
      error: _ => this.displayFailure()
    });
    this.run();
  }

  isValid(): Boolean {
    if (!this.payment.insurance){
      alert("Insurance must be specified!");
      return false;
    }
    if (!this.payment.provider) {
      alert("Provider must be specified!");
      return false;
    }
    if (isNaN(this.payment.paymentAmount) || this.payment.paymentAmount == 0.0) {
      alert("Valid payment amount must be specified!");
      return false;
    }
    return true;
  }

  cancel(){
    this.payment = this.initPayment();
  }

  delete(){
  if (this.payment.id == 0)
  {
    return;
  }
  this.apiService.deletePayment(this.payment.id)
    .subscribe({
      next: _ => this.displaySuccess(),
      complete: () => this.displaySuccess(),
      error: e => {console.log('Error', e); this.displayFailure();}
    });
  }
}
