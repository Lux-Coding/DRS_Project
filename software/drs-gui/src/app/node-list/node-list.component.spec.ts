import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NodeListComponent } from './node-list.component';

describe('NodeListComponent', () => {
  let component: NodeListComponent;
  let fixture: ComponentFixture<NodeListComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [NodeListComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(NodeListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
