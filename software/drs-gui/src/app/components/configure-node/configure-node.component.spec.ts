import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ConfigureNodeComponent } from './configure-node.component';

describe('ConfigureNodeComponent', () => {
  let component: ConfigureNodeComponent;
  let fixture: ComponentFixture<ConfigureNodeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ConfigureNodeComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(ConfigureNodeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
