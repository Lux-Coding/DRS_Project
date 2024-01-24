import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ConfigureNodeListComponent } from './configure-node-list.component';

describe('ConfigureNodeListComponent', () => {
  let component: ConfigureNodeListComponent;
  let fixture: ComponentFixture<ConfigureNodeListComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ConfigureNodeListComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(ConfigureNodeListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
