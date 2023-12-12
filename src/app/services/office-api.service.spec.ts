import { TestBed } from '@angular/core/testing';

import { OfficeApiService } from './office-api.service';

describe('OfficeApiService', () => {
  let service: OfficeApiService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(OfficeApiService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
