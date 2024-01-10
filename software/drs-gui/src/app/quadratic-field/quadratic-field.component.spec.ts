import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QuadraticFieldComponent } from './quadratic-field.component';

describe('QuadraticFieldComponent', () => {
  let component: QuadraticFieldComponent;
  let fixture: ComponentFixture<QuadraticFieldComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [QuadraticFieldComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(QuadraticFieldComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
