import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SigninSheetComponent } from './signin-sheet.component';

describe('SigninSheetComponent', () => {
  let component: SigninSheetComponent;
  let fixture: ComponentFixture<SigninSheetComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [SigninSheetComponent]
    });
    fixture = TestBed.createComponent(SigninSheetComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
