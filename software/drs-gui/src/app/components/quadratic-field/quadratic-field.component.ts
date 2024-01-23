import { Component } from '@angular/core';
import {NgIf, NgStyle} from "@angular/common";

@Component({
  selector: 'app-quadratic-field',
  standalone: true,
  imports: [
    NgStyle,
    NgIf
  ],
  templateUrl: './quadratic-field.component.html',
  styleUrl: './quadratic-field.component.css'
})
export class QuadraticFieldComponent {
  point: { x: number, y: number } = { x: 0, y: 0 };

  setPoint(x: number, y: number): void {
    // this.point = { x, y };
    this.point = { x, y };
  }
}
