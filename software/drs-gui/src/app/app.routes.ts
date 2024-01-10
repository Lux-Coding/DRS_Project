import {RouterModule, Routes} from '@angular/router';
import {NodePageComponent} from "./node-page/node-page.component";
import {ConfigurationPageComponent} from "./configuration-page/configuration-page.component";
import {NgModule} from "@angular/core";

export const routes: Routes = [
  { path: 'node-page', component: NodePageComponent },
  { path: 'configuration-page', component: ConfigurationPageComponent },
  // { path: '', redirectTo: '/nodes', pathMatch: 'full' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
