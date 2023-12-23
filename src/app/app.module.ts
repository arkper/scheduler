import { NgModule } from '@angular/core';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatListModule } from '@angular/material/list';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatToolbarModule } from '@angular/material/toolbar';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatRadioModule } from '@angular/material/radio';

import { AppComponent } from './app.component';
import { PatientListComponent } from './patient-list/patient-list.component';
import { RouterModule, Routes } from '@angular/router';
import { SigninSheetComponent } from './signin-sheet/signin-sheet.component';
import { HttpClientModule } from '@angular/common/http'
import { AgGridModule } from 'ag-grid-angular';
import { ConsentFormComponent } from './forms/consent-form/consent-form.component';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatNativeDateModule, MatOptionModule } from '@angular/material/core';
import { MatChipsModule } from '@angular/material/chips';
import { MatSelectModule } from '@angular/material/select';
import { FormsModule } from '@angular/forms';
import { MatInputModule } from '@angular/material/input';
import { DatePipe } from '@angular/common';
import { SigPadComponent } from './sig-pad/sig-pad.component';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ReleaseFormComponent } from './forms/release-form/release-form.component';
import { DocViewerComponent } from './doc-viewer/doc-viewer.component';
import { PdfViewerModule } from 'ng2-pdf-viewer';
import { StoreModule } from '@ngrx/store';
import { reducers } from './store/reducers';
import { EyeGlassesFormComponent } from './forms/eye-glasses-form/eye-glasses-form.component';
import { TransportationFormComponent } from './forms/transportation-form/transportation-form.component';
import { BaseFormComponent } from './forms/base-form/base-form.component';
import { SigninSheetViewComponent } from './signin-sheet-view/signin-sheet-view.component';
import { CorListComponent } from './cor-list/cor-list.component';
import { FileSaverModule } from 'ngx-filesaver';

const ROUTES: Routes = [
  {path: 'patient-list', component: PatientListComponent},
  {path: 'signin-sheet', component: SigninSheetComponent},
  {path: 'consent-form', component: ConsentFormComponent},
  {path: 'release-form', component: ReleaseFormComponent},
  {path: 'transportation-form', component: TransportationFormComponent},
  {path: 'signin', component: SigninSheetComponent},
  {path: 'signin-sheet-view', component: SigninSheetViewComponent},
  {path: 'eyeglasses-form', component: EyeGlassesFormComponent},
  {path: 'cor-list', component: CorListComponent},
  {path: 'doc-viewer', component: DocViewerComponent},
  { path: '',
    redirectTo: '/patient-list',
    pathMatch: 'full'
  },
];

@NgModule({
  declarations: [
    AppComponent,
    PatientListComponent,
    SigninSheetComponent,
    ConsentFormComponent,
    SigPadComponent,
    ReleaseFormComponent,
    DocViewerComponent,
    EyeGlassesFormComponent,
    TransportationFormComponent,
    BaseFormComponent,
    SigninSheetViewComponent,
    CorListComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    MatIconModule,
    MatButtonModule,
    MatToolbarModule,
    MatSidenavModule,
    MatListModule,
    MatFormFieldModule,
    MatOptionModule,
    MatChipsModule,
    MatSelectModule,
    FormsModule,
    MatInputModule,
    MatDatepickerModule, 
    MatNativeDateModule, 
    HttpClientModule,
    AgGridModule,
    RouterModule.forRoot(ROUTES),
    PdfViewerModule,
    MatRadioModule,
    StoreModule.forRoot(reducers),
    FileSaverModule
  ],
  providers: [DatePipe, MatSnackBar],
  bootstrap: [AppComponent]
})
export class AppModule { }
