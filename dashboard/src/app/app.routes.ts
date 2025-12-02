import { Routes } from '@angular/router';
import { DashboardComponent } from './dashboard/dashboard.component';
import { TicketsPageComponent } from './tickets/tickets-page.component';
import { EditorPageComponent } from './editor/editor-page.component';
import { LogsPageComponent } from './logs/logs-page.component';

export const routes: Routes = [
  {
    path: '',
    component: DashboardComponent,
    children: [
      { path: '', redirectTo: 'tickets', pathMatch: 'full' },
      { path: 'tickets', component: TicketsPageComponent },
      { path: 'editor', component: EditorPageComponent },
      { path: 'logs', component: LogsPageComponent },
    ],
  },
];
