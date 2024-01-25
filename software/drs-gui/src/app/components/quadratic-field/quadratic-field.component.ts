import { Component, OnInit } from '@angular/core';
import {NgIf, NgStyle} from "@angular/common";
import { Coordinate } from '../../models/coordinate.model';
import { DataService } from '../../services/data.service';

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
export class QuadraticFieldComponent implements OnInit {
  point: Coordinate;

  constructor(private dataService: DataService) { }

  ngOnInit(): void {
    this.point = this.dataService.getPoint();
  }

  setPoint(x: number, y: number): void {
    // this.point = { x, y };
    this.point = { x, y };
  }
}
