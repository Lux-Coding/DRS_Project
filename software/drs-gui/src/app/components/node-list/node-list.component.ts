import {Component, Input, OnInit} from '@angular/core';
import {NodeComponent} from "../node/node.component";
import {NgForOf} from "@angular/common";
import { Node } from '../../models/node.model';

@Component({
  selector: 'app-node-list',
  standalone: true,
  imports: [
    NodeComponent,
    NgForOf
  ],
  templateUrl: './node-list.component.html',
  styleUrl: './node-list.component.css'
})
export class NodeListComponent implements OnInit {

  @Input() nodes: Node[] = [
      { name: 'Receiver 1', status: 'Active', rcvCounter: 10, lastToa: 1600000000 },
      { name: 'Receiver 2', status: 'Inactive', rcvCounter: 15, lastToa: 1600000100 },
      { name: 'Receiver 3', status: 'Active', rcvCounter: 5, lastToa: 1600000200 },
      { name: 'Receiver 4', status: 'Inactive', rcvCounter: 20, lastToa: 1600000300 }
  ];

  constructor() { }

  ngOnInit(): void {
  }

}
