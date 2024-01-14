import { DatePipe } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { MatSnackBar, MatSnackBarRef, TextOnlySnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';
import { Store } from '@ngrx/store';
import { OfficeApiService } from 'src/app/services/office-api.service';
import { AppState } from 'src/app/store/reducers';
import { BaseFormComponent } from '../base-form/base-form.component';

@Component({
  selector: 'app-eye-glasses-form',
  templateUrl: './eye-glasses-form.component.html',
  styleUrls: ['./eye-glasses-form.component.scss']
})
export class EyeGlassesFormComponent extends BaseFormComponent implements OnInit {
  constructor(
    override router: Router, 
    override apiService: OfficeApiService,
    override snackBar: MatSnackBar,
    override datepipe: DatePipe,
    override store: Store<AppState>) {
      super(router, apiService, snackBar, datepipe, store);
  }

  override formType: string = "eye-glasses";

  override data: {[k: string]: any} = {
    firstName: this.patient?.firstName,
    lastName: this.patient?.lastName,
    dob: this.getDob(),
    ssn: this.patient?.ssNo,
    headaches: false,
    dizziness: false,
    bifocals: false,
    rxchange: false,
    loss: false,
    breakage: false,
    theft: false,
    newrx: false,
    allergic: false,
    willpay: false,
    preadjusted: false,
    dispensed: false,
    unintentionalloss: false,
    pickedup: false,
    date: this.getDate()
  }

}
