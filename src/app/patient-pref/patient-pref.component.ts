import { Component, EventEmitter, Inject, Input, Output } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { Patient, PatientPreferences } from '../store/model/patient.model';
import { OfficeApiService } from '../services/office-api.service';


@Component({
  selector: 'app-patient-pref',
  templateUrl: './patient-pref.component.html',
  styleUrls: ['./patient-pref.component.scss']
})
export class PatientPrefComponent {
  @Input() patient: Patient | null = null;
  patientPrefs: PatientPreferences | null = null;
  language = 'English';
  languages = ['English', 'Russian', 'Spanish'];
  unsubscribe = false;

  constructor(
    private apiService: OfficeApiService, 
    public dialogRef: MatDialogRef<PatientPrefComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any) {
      this.patient = this.data.patient;
      if (this.patient)
      {
        this.apiService.getPatinetPreferences(this.patient.patientNo)
          .subscribe((prefs) => {this.patientPrefs = prefs});
      }
    }

  getName(): string {
    return this.patient?.firstName + " " + this.patient?.lastName;
  }

  doSave(): void {
    console.log('Language:', this.language);
    console.log('Unsubscribe:', this.unsubscribe);
    if (!this.patientPrefs && this.patient)
    {
      this.patientPrefs = {
        patientPreferenceNo: null, 
        patientNo: this.patient.patientNo, 
        lastName: this.patient.lastName, 
        firstName: this.patient.firstName,
        language: 'English',
        unsubscribe: false 
       };
    }
    
    if (this.patientPrefs)
    {
      this.patientPrefs.language = this.language;
      this.patientPrefs.unsubscribe = this.unsubscribe;
    }
  
    console.log('PatientPreference:', this.patientPrefs);
    this.apiService.saveUserPreferences(this.patientPrefs).subscribe();
	  this.dialogRef.close();
  }

  doCancel() {
    this.dialogRef.close();
  }
}
