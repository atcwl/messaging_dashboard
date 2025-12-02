import { Component, signal, computed } from '@angular/core';
import { NgFor } from '@angular/common';

interface Ticket {
  id: number;
  subject: string;
  status: 'open' | 'pending' | 'closed';
  created: string;
}

@Component({
  selector: 'app-tickets-page',
  standalone: true,
  imports: [NgFor],
  templateUrl: './tickets-page.html',
})
export class TicketsPageComponent {

  filter = signal<'all' | 'open' | 'pending' | 'closed'>('all');

  tickets = signal<Ticket[]>([
    { id: 1, subject: 'Login issue', status: 'open', created: '2025-12-01' },
    { id: 2, subject: 'Billing question', status: 'pending', created: '2025-12-01' },
    { id: 3, subject: 'Bug report', status: 'closed', created: '2025-12-01' },
  ]);

  filteredTickets = computed(() => {
    if (this.filter() === 'all') return this.tickets();
    return this.tickets().filter(t => t.status === this.filter());
  });

  setFilter(type: 'all' | 'open' | 'pending' | 'closed') {
    this.filter.set(type);
  }
}
