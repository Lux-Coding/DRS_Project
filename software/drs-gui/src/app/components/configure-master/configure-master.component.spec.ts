import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ConfigureMasterComponent } from './configure-master.component';

describe('ConfigureMasterComponent', () => {
  let component: ConfigureMasterComponent;
  let fixture: ComponentFixture<ConfigureMasterComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ConfigureMasterComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(ConfigureMasterComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
