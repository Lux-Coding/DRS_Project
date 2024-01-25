import { Component, Input } from '@angular/core';
import { MatCardModule } from '@angular/material/card';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { FormsModule } from '@angular/forms';
import { MatSelectModule } from '@angular/material/select';
import { Node } from '../../models/node.model';


@Component({
  selector: 'app-configure-node',
  standalone: true,
  imports: [MatCardModule, FormsModule, MatFormFieldModule, MatInputModule, MatSelectModule],
  templateUrl: './configure-node.component.html',
  styleUrl: './configure-node.component.css'
})
export class ConfigureNodeComponent {
  @Input() node: Node;

  updateNodeName(event: Event): void {
    const input = event.target as HTMLInputElement | null;
    if (input) {
      this.node.name = input.value;
    }
  }

  updateNodeIP(event: Event): void {
    const input = event.target as HTMLInputElement | null;
    if (input) {
      this.node.ip = input.value;
    }
  }

  updateNodePosition(event: Event): void {
    const input = event.target as HTMLInputElement | null;
    if (input) {
      console.log(input.value)
      // this.node.name = input.value;
    }
  }
  onPositionChange(): void {
    console.log('Selected position:', this.node.position);
    
    // Additional logic for when the position changes...
  }

}
