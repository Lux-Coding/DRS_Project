import { Component, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { QuadraticFieldComponent } from '../../components/quadratic-field/quadratic-field.component';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Subscription, interval, switchMap } from 'rxjs';
import { NodeListComponent } from '../../components/node-list/node-list.component';

@Component({
  selector: 'app-node-page',
  standalone: true,
  imports: [NodeListComponent, QuadraticFieldComponent, HttpClientModule],
  templateUrl: './node-page.component.html',
  styleUrl: './node-page.component.css'
})
export class NodePageComponent implements OnInit, OnDestroy{
  // export class AppComponent {
  
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
      this.subscription = interval(200).pipe(
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
  