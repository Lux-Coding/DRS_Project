import { Component } from '@angular/core';
import { ConfigureMasterComponent } from '../../components/configure-master/configure-master.component';
import { ConfigureNodeListComponent } from '../../components/configure-node-list/configure-node-list.component';

@Component({
  selector: 'app-configuration-page',
  standalone: true,
  imports: [ConfigureNodeListComponent, ConfigureMasterComponent],
  templateUrl: './configuration-page.component.html',
  styleUrl: './configuration-page.component.css'
})
export class ConfigurationPageComponent {

}
