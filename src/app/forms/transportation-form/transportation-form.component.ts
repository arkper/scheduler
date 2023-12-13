import { Component } from '@angular/core';

@Component({
  selector: 'app-transportation-form',
  templateUrl: './transportation-form.component.html',
  styleUrls: ['./transportation-form.component.scss']
})
export class TransportationFormComponent {
  physPhone: string = "";
  physLicense: string = "";
  mmisID: string = "";


  changeDoc() {
    const selectBox = document.getElementById("@physName") as HTMLSelectElement;
    
    if (selectBox.value == 'Michelle Cevallos') {
        this.physPhone = "(718) 336-1060";
        this.physLicense = "004950";
        this.mmisID = "TBD";
    } else if (selectBox.value == 'Effie Tatakis') {
      this.physPhone = "(718) 336-1060";
      this.physLicense = "";
      this.mmisID = "TBD";
    } else {
      this.physPhone = "(718) 336-1060";
      this.physLicense = "00936425";
      this.mmisID = "004505";
    }
  }

}
