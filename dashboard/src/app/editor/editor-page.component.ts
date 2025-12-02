import { Component, signal, computed } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-editor-page',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './editor-page.html',
})
export class EditorPageComponent {
  text = signal<string>('');

  markdown = computed(() => {
    return this.text()
      .replace(/^### (.*$)/gim, '<h3>$1</h3>')
      .replace(/^## (.*$)/gim, '<h2>$1</h2>')
      .replace(/^# (.*$)/gim, '<h1>$1</h1>')
      .replace(/\*\*(.*)\*\*/gim, '<b>$1</b>')
      .replace(/\*(.*)\*/gim, '<i>$1</i>')
      .replace(/\n/g, '<br>');
  });
}
