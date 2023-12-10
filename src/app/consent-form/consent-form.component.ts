import { DatePipe } from '@angular/common';
import { Component, Input } from '@angular/core';
import { Router } from '@angular/router';
import { OfficeApiService } from '../office-api.service';
import {MatSnackBar, MatSnackBarRef, TextOnlySnackBar} from '@angular/material/snack-bar';
import { Patient } from '../patient-list/patient-model';

@Component({
  selector: 'app-consent-form',
  templateUrl: './consent-form.component.html',
  styleUrls: ['./consent-form.component.scss']
})
export class ConsentFormComponent {
  patient: Patient | null = null;
  date: string | null;
  signature: string = "";
  snackBarRef: MatSnackBarRef<TextOnlySnackBar> | null = null;

  constructor(
    private router: Router, 
    private datepipe: DatePipe, 
    private apiService: OfficeApiService, 
    private snackBar: MatSnackBar) {
    this.patient = this.router.getCurrentNavigation()?.extras.state?.['patient'];
    
    this.date = this.datepipe.transform(new Date(), 'MM/dd/yyyy');
  }

  fileName: string = "";

  ngOnInit() {
  }

  onSigned(event: any)
  {
    this.signature = event;

    var data = {data: [{
      patientNo: this.patient?.patientNo, 
      patientName: this.getName(), 
      signature: this.signature}]};

    this.apiService.submitDocument(data, "consent")
      .subscribe({
        next: (data) => this.fileName = data,
        error: (e) => this.displayFailure(),
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

  getName(): string {
    return this.patient?.firstName + ' ' + this.patient?.lastName;
  }
}
