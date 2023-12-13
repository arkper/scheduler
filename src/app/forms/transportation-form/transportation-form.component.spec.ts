import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TransportationFormComponent } from './transportation-form.component';

describe('TransportationComponent', () => {
  let component: TransportationFormComponent;
  let fixture: ComponentFixture<TransportationFormComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [TransportationFormComponent]
    });
    fixture = TestBed.createComponent(TransportationFormComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
