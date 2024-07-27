import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PaymentComissionsComponent } from './payment-comissions.component';

describe('PaymentComissionsComponent', () => {
  let component: PaymentComissionsComponent;
  let fixture: ComponentFixture<PaymentComissionsComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [PaymentComissionsComponent]
    });
    fixture = TestBed.createComponent(PaymentComissionsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
