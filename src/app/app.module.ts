import { NgModule } from '@angular/core';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatListModule } from '@angular/material/list';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatToolbarModule } from '@angular/material/toolbar';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { AppComponent } from './app.component';
import { PatientListComponent } from './patient-list/patient-list.component';
import { RouterModule, Routes } from '@angular/router';
import { SigninSheetComponent } from './signin-sheet/signin-sheet.component';
import { HttpClientModule } from '@angular/common/http'
import { AgGridModule } from 'ag-grid-angular';
import { ConsentFormComponent } from './consent-form/consent-form.component';
import {MatFormFieldModule} from '@angular/material/form-field';
import { DatePipe } from '@angular/common';
import { SigPadComponent } from './sig-pad/sig-pad.component';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ReleaseFormComponent } from './release-form/release-form.component';
import { DocViewerComponent } from './doc-viewer/doc-viewer.component';
import { PdfViewerModule } from 'ng2-pdf-viewer';

const ROUTES: Routes = [
  {path: 'patient-list', component: PatientListComponent},
  {path: 'signin-sheet', component: SigninSheetComponent},
  {path: 'consent-form', component: ConsentFormComponent},
  {path: 'release-form', component: ReleaseFormComponent},
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
    DocViewerComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    MatIconModule,
    MatButtonModule,
    MatToolbarModule,
    MatSidenavModule,
    MatListModule,
    HttpClientModule,
    AgGridModule,
    RouterModule.forRoot(ROUTES),
    MatFormFieldModule,
    PdfViewerModule
  ],
  providers: [DatePipe, MatSnackBar],
  bootstrap: [AppComponent]
})
export class AppModule { }
