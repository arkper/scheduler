import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CorListComponent } from './cor-list.component';

describe('CorListComponent', () => {
  let component: CorListComponent;
  let fixture: ComponentFixture<CorListComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [CorListComponent]
    });
    fixture = TestBed.createComponent(CorListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
