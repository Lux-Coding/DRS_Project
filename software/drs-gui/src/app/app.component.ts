import {Component, OnDestroy, OnInit, ViewChild} from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterOutlet } from '@angular/router';
import {NodeListComponent} from "./components/node-list/node-list.component";
import {QuadraticFieldComponent} from "./components/quadratic-field/quadratic-field.component";
import {interval, Subscription, switchMap} from "rxjs";
import {HttpClient, HttpClientModule} from "@angular/common/http";

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule, RouterOutlet, NodeListComponent, QuadraticFieldComponent, HttpClientModule],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent implements OnInit, OnDestroy{
// export class AppComponent {

  title = 'Distributed Sound Positioning';

  @ViewChild(QuadraticFieldComponent)
  private quadraticFieldComponent!: QuadraticFieldComponent;


  private subscription!: Subscription;
  private apiUrl: string = 'http://localhost:5000/pos';  // Replace with your full URL


  constructor(private http: HttpClient) {}

  ngOnInit() {
    this.startPolling();
  }

  ngOnDestroy() {
    this.subscription.unsubscribe(); // Important to prevent memory leaks
  }
  placePoint() {
    // Example coordinates
    this.quadraticFieldComponent.setPoint(this.getRandomInt(), this.getRandomInt());
  }

  private getRandomInt() : number{
    return Math.floor(Math.random() * 100);
  }

  startPolling() {
    // this.subscription = interval(200).pipe(
    //   switchMap(() => this.http.get<{ x: number, y: number }>('your-api-endpoint'))
    // ).subscribe({
    //   next: (response) => {
    //     this.quadraticFieldComponent.setPoint(response.x, response.y);
    //   },
    //   error: (error) => {
    //     console.error('Error fetching coordinates:', error);
    //   }
    // });
    this.subscription = interval(200).pipe(
      //switchMap(() => this.http.get<[ x: number, y: number ]>(this.apiUrl))
      switchMap(() => this.http.get<number[]>( this.apiUrl))
    ).subscribe({
      next: (response) => {
        this.quadraticFieldComponent.setPoint(response[0]/2 * 100, response[1]/ 2 * 100);
        // Print coordinates to the console
        console.log('Received coordinates:', response[0], response[1]);
      },
      error: (error) => {
        console.error('Error fetching coordinates:', error);
      }
    });
  }
}
