import { Injectable } from '@angular/core';
import { Node } from '../models/node.model';

@Injectable({
  providedIn: 'root'
})
export class DataService {

  private nodes: Node[] = [
    { name: 'Receiver 1', ip: '192.168.1.0', status: 'Active', rcvCounter: 10, lastToa: 1600000000, position: 0 },
    { name: 'Receiver 2', ip: '192.168.1.0', status: 'Inactive', rcvCounter: 15, lastToa: 1600000100, position: 1 },
    { name: 'Receiver 3', ip: '192.168.1.0', status: 'Active', rcvCounter: 5, lastToa: 1600000200, position: 2 },
    { name: 'Receiver 4', ip: '192.168.1.0', status: 'Inactive', rcvCounter: 20, lastToa: 1600000300, position: 3 }
  ];
  
  constructor() { }

  getNodes(): Node[] {
    return this.nodes;
  }
  
  addNode(node: Node): void {
    this.nodes.push(node);
  }

  updateNode(index: number, newNode: Node): void {
    if (index >= 0 && index < this.nodes.length) {
      this.nodes[index] = newNode;
    }
  }
}
