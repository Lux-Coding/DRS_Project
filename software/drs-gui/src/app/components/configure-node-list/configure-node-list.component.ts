import { Component, Input, OnInit } from '@angular/core';
import { Node } from '../../models/node.model';
import { ConfigureNodeComponent } from '../configure-node/configure-node.component';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { DataService } from '../../services/data.service';

@Component({
  selector: 'app-configure-node-list',
  standalone: true,
  imports: [ConfigureNodeComponent, CommonModule, FormsModule],
  templateUrl: './configure-node-list.component.html',
  styleUrl: './configure-node-list.component.css'
})
export class ConfigureNodeListComponent implements OnInit {
  nodes: Node[];
  
  constructor(private nodeService: DataService) { }

  ngOnInit(): void {
    this.nodes = this.nodeService.getNodes();
  }
}
