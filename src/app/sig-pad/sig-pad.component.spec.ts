import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SigPadComponent } from './sig-pad.component';

describe('SigPadComponent', () => {
  let component: SigPadComponent;
  let fixture: ComponentFixture<SigPadComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [SigPadComponent]
    });
    fixture = TestBed.createComponent(SigPadComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
