import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['label'];
  static values = {
  }

  get inputsElement() {
    return this.element.querySelectorAll('input[type="checkbox"]');
  }

  connect() {
    if (!this.inputsElement.length)
      return;

    this.inputsElement.forEach((input) => {
      input.addEventListener('change', this.updateText.bind(this));
    });

    this.updateText();
  }

  updateText() {
    if (!this.labelTarget)
      return;

    let count = 0;
    this.inputsElement.forEach((input) => {
      if (input.checked) {
        count++;
      }
    });

    this.labelTarget.textContent = count;
  }
}
