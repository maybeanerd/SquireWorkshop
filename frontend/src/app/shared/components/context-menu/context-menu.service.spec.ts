import {inject, TestBed} from '@angular/core/testing';
import {ContextMenuService} from './context-menu.service';


xdescribe('ContextMenuService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [ContextMenuService]
    });
  });

  it('should be created', inject([ContextMenuService], (service: ContextMenuService) => {
    expect(service).toBeTruthy();
  }));
});
