import {Component, Input, OnInit} from '@angular/core';
import {MatCardModule} from "@angular/material/card";
import {MatListModule} from "@angular/material/list";

@Component({
  selector: 'app-node',
  standalone: true,
  imports: [
    MatCardModule,
    MatListModule
  ],
  templateUrl: './node.component.html',
  styleUrl: './node.component.css'
})
export class NodeComponent implements OnInit{

  @Input() name: string;
  @Input() status: string;
  @Input() rcvCounter: number;
  @Input() lastToa: number;

  constructor() { }

  ngOnInit(): void {
  }
}
