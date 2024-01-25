import { Component, Input, OnInit } from '@angular/core';
import { NodeComponent } from "../node/node.component";
import { NgFor, NgForOf } from "@angular/common";
import { Node } from '../../models/node.model';

@Component({
  selector: 'app-node-list',
  standalone: true,
  imports: [
    NodeComponent,
    NgFor
  ],
  templateUrl: './node-list.component.html',
  styleUrl: './node-list.component.css'
})
export class NodeListComponent implements OnInit {

  @Input() nodes: Node[] = [];

  constructor() { }

  ngOnInit(): void {
  }

}
