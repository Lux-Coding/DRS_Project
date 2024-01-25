import { Component, OnDestroy, OnInit } from '@angular/core';
import { ConfigureMasterComponent } from '../../components/configure-master/configure-master.component';
import { ConfigureNodeListComponent } from '../../components/configure-node-list/configure-node-list.component';
import { DataService } from '../../services/data.service';
import { Node } from '../../models/node.model';

@Component({
  selector: 'app-configuration-page',
  standalone: true,
  imports: [ConfigureNodeListComponent, ConfigureMasterComponent],
  templateUrl: './configuration-page.component.html',
  styleUrl: './configuration-page.component.css'
})
export class ConfigurationPageComponent implements OnInit, OnDestroy {

  nodes: Node[];
  apiUrl: string = '';

  constructor(private nodeService: DataService) { }

  ngOnInit() {
    this.nodes = this.nodeService.getNodes();
    this.apiUrl = this.nodeService.getApi();
  }

  ngOnDestroy() {
   
  }


}
