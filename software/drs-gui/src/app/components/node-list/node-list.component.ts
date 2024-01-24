import { Component, Input, OnInit } from '@angular/core';
import { NodeComponent } from "../node/node.component";
import { NgForOf } from "@angular/common";
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
    { name: 'Receiver 1', ip: '192.168.1.0', status: 'Active', rcvCounter: 10, lastToa: 1600000000, position: 0 },
    { name: 'Receiver 2', ip: '192.168.1.0', status: 'Inactive', rcvCounter: 15, lastToa: 1600000100, position: 1 },
    { name: 'Receiver 3', ip: '192.168.1.0', status: 'Active', rcvCounter: 5, lastToa: 1600000200, position: 2 },
    { name: 'Receiver 4', ip: '192.168.1.0', status: 'Inactive', rcvCounter: 20, lastToa: 1600000300, position: 3 }
  ];

  constructor() { }

  ngOnInit(): void {
  }

}
