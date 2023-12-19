import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SigninSheetViewComponent } from './signin-sheet-view.component';

describe('SigninSheetViewComponent', () => {
  let component: SigninSheetViewComponent;
  let fixture: ComponentFixture<SigninSheetViewComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [SigninSheetViewComponent]
    });
    fixture = TestBed.createComponent(SigninSheetViewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
