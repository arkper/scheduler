import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PatientListComponent } from './patient-list/patient-list.component';
import { SigninSheetComponent } from './signin-sheet/signin-sheet.component';

const routes: Routes = [
  {path: 'patient-list', component: PatientListComponent},
  {path: 'signin-sheet', component: SigninSheetComponent},
  { path: '',
    redirectTo: '/patient-list',
    pathMatch: 'full'
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
