import { Component, Input } from '@angular/core';
import { Node } from '../../models/node.model';
import { ConfigureNodeComponent } from '../configure-node/configure-node.component';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-configure-node-list',
  standalone: true,
  imports: [ConfigureNodeComponent, CommonModule, FormsModule],
  templateUrl: './configure-node-list.component.html',
  styleUrl: './configure-node-list.component.css'
})
export class ConfigureNodeListComponent {
  nodes: Node[] = [
    { name: 'Receiver 1', ip: '192.168.1.0', status: 'Active', rcvCounter: 10, lastToa: 1600000000, position: 0 },
    { name: 'Receiver 2', ip: '192.168.1.0', status: 'Inactive', rcvCounter: 15, lastToa: 1600000100, position: 1 },
    { name: 'Receiver 3', ip: '192.168.1.0', status: 'Active', rcvCounter: 5, lastToa: 1600000200, position: 2 },
    { name: 'Receiver 4', ip: '192.168.1.0', status: 'Inactive', rcvCounter: 20, lastToa: 1600000300, position: 3 }
  ];
}
