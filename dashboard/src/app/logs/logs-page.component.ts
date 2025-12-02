import { Component, signal, effect } from '@angular/core';
import { NgFor } from '@angular/common';

@Component({
  selector: 'app-logs-page',
  standalone: true,
  imports: [NgFor],
  templateUrl: './logs-page.html',
  styleUrls: ['./logs-page.css']
})
export class LogsPageComponent {

  logs = signal<string[]>([]);
  private counter = 0;

  constructor() {
    // Generate logs every 2 seconds
    effect(() => {
      setInterval(() => {
        this.counter++;
        this.logs.update(list => [
          ...list,
          `[${new Date().toLocaleTimeString()}] Log event #${this.counter}`
        ]);

        this.scrollToBottom();
      }, 2000);
    });
  }

  scrollToBottom() {
    const el = document.getElementById('log-box');
    if (el) {
      el.scrollTop = el.scrollHeight;
    }
  }
}
