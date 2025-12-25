import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PatientPrefComponent } from './patient-pref.component';

describe('PatientPrefComponent', () => {
  let component: PatientPrefComponent;
  let fixture: ComponentFixture<PatientPrefComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [PatientPrefComponent]
    });
    fixture = TestBed.createComponent(PatientPrefComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
