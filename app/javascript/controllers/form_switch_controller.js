import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
	get inputElement() {
		return this.element.querySelector('input[type="checkbox"]');
	}

	get labelElement() {
		return this.element.querySelector('label.form-check-label');
	}

  connect() {
    this.trueText = this.element.getAttribute('data-true-text') || 'Yes';
		this.falseText = this.element.getAttribute('data-false-text') || 'No';

		if (this.inputElement) {
			this.inputElement.addEventListener('change', this.updateText.bind(this));
			this.updateText();
		}
  }
	
	updateText() {
		if (!this.labelElement)
			return;

		if (this.inputElement.checked)
			this.labelElement.textContent = this.trueText;
		else
			this.labelElement.textContent = this.falseText;
	}
}
