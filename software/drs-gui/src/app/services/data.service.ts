import { Injectable } from '@angular/core';
import { Node } from '../models/node.model';
import { Coordinate } from '../models/coordinate.model';

@Injectable({
  providedIn: 'root'
})
export class DataService {

  private nodes: Node[] = [
    { name: 'Receiver 1', ip: '192.168.1.0', status: 'Active', rcvCounter: 10, lastToa: 1600000000, position: -1 },
    { name: 'Receiver 2', ip: '192.168.1.0', status: 'Inactive', rcvCounter: 15, lastToa: 1600000100, position: -1 },
    { name: 'Receiver 3', ip: '192.168.1.0', status: 'Active', rcvCounter: 5, lastToa: 1600000200, position: -1 },
    { name: 'Receiver 4', ip: '192.168.1.0', status: 'Inactive', rcvCounter: 20, lastToa: 1600000300, position: -1 }
  ];
  
  // private apiUrl: string = 'http://localhost:5000/pos';
  private apiUrl: string = 'http://localhost:5000';

  private point: Coordinate = { x: 25, y: 25 };

  constructor() { }


  getPoint(): Coordinate {
    return this.point;
  }

  updateCoordinate(newPoint: Coordinate ){
    this.point = newPoint;
  }

  getApi(): string {
    return this.apiUrl;
  }

  updateApi(newApiUrl: string ){
    this.apiUrl = newApiUrl;
  }

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
