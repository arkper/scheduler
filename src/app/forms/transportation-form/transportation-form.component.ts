import { Component, OnInit } from '@angular/core';
import { BaseFormComponent } from '../base-form/base-form.component';
import { Router } from '@angular/router';
import { OfficeApiService } from 'src/app/services/office-api.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import { DatePipe } from '@angular/common';
import { Store } from '@ngrx/store';
import { AppState } from 'src/app/store/reducers';

@Component({
  selector: 'app-transportation-form',
  templateUrl: './transportation-form.component.html',
  styleUrls: ['./transportation-form.component.scss']
})
export class TransportationFormComponent extends BaseFormComponent implements OnInit {
  constructor(
    override router: Router, 
    override apiService: OfficeApiService,
    override snackBar: MatSnackBar,
    override datepipe: DatePipe,
    override store: Store<AppState>) {
      super(router, apiService, snackBar, datepipe, store);
  }
  
  override formType: string = "transportation";
  
  override data: {[k: string]: any} = {
    firstName: this.patient?.firstName,
    lastName: this.patient?.lastName,
    address1: this.patient?.address?.address1,
    city: this.patient?.address?.city,
    state: this.getState(),
    zip: this.patient?.address?.zip,
    phone1: this.patient?.address?.phone1,
    dob: this.getDob(),
    ssn: this.patient?.ssNo,
    sex: this.patient?.sex,  
    date: this.getDate(),
    diagnosis1: "",
    diagnosis2: "",
    diagnosis3: "",
    diagnosis4: "",
    diagnosis5: "",
    diagnosis6: "",
    justification: "",
    scooter: false,
    assist: false,
    family: false,
    cmma: false,
    cmma_justification: "",
    equipment: false,
    monitoring: false,
    medical_reasons: false,
    psychiatric_reasons: false,
    oxygen: false,
    withinCMMA: false,
    outsideCMMA: false,
    mode_livery: false,
    mode_ambulette: false,
    mode_nonemergency: false,
    fromMM: "",
    fromDD: "",
    fromYYYY: "",
    toMM: "",
    toDD: "",
    toYYYY: "",
    physPhone: "",
    physLicense: "",
    mmisID: "02641",
    facName: "Modern Optical",
    facAddress: "453 Kings Hwy, Brooklyn, NY 11223",
    helperName: "",
    helperTitle: "",
    helperPhone: "",
    medicaidNo: ""
  }

  changeDoc() {
    const selectBox = document.getElementById("physName") as HTMLSelectElement;
    this.data['physName'] = selectBox.value;
    if (selectBox.value == 'Michelle Cevallos') {
      this.data['physPhone'] = "(718) 336-1060";
      this.data['physLicense'] = "004950";
      this.data['mmisID'] = "TBD";
    } else if (selectBox.value == 'Effie Tatakis') {
      this.data['physPhone'] = "(718) 336-1060";
      this.data['physLicense'] = "";
      this.data['mmisID'] = "TBD";
    } else {
      this.data['physPhone'] = "(718) 336-1060";
      this.data['physLicense'] = "00936425";
      this.data['mmisID'] = "004505";
    }
  }

  update(event: Event) {
    let key = (event.target as HTMLInputElement).id;
    let value = (event.target as HTMLInputElement).value;

    this.data[key] = value;
  }
}
