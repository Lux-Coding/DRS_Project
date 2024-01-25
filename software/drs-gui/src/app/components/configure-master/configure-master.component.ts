import { Component, Input } from '@angular/core';
import { MatCardModule } from '@angular/material/card';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { FormsModule } from '@angular/forms';
import {MatButtonModule} from '@angular/material/button';

@Component({
  selector: 'app-configure-master',
  standalone: true,
  imports: [MatCardModule, FormsModule, MatFormFieldModule, MatInputModule,MatButtonModule],
  templateUrl: './configure-master.component.html',
  styleUrl: './configure-master.component.css'
})
export class ConfigureMasterComponent {
  @Input() apiUrl: string;

  updateApi(event: Event): void {
    const input = event.target as HTMLInputElement | null;
    if (input) {
      this.apiUrl = input.value;
    }
  }
}
