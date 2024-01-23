import {Component, OnDestroy, OnInit, ViewChild} from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink, RouterOutlet } from '@angular/router';
import {NodeListComponent} from "./components/node-list/node-list.component";
import {QuadraticFieldComponent} from "./components/quadratic-field/quadratic-field.component";
import {interval, Subscription, switchMap} from "rxjs";
import {HttpClient, HttpClientModule} from "@angular/common/http";

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule, RouterOutlet, NodeListComponent, QuadraticFieldComponent, HttpClientModule, RouterLink],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'Distributed Sound Positioning';
}