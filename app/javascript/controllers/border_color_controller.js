import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    elementSelector: {
      type: String,
      default: ".card",
    },
  }

  get mainElement() {
    return (this.elementSelectorValue && this.element.querySelector(this.elementSelectorValue)) || this.element;
  }

  get borderColor() {
    let color = this.mainElement.dataset?.borderColor;
    if (!color) {
      color = this.element.dataset?.borderColor;
      if (!color)
        color = this.mainElement.querySelector("[data-border-color]")?.style?.backgroundColor;
    }
    return color;
  }

  get headerElement() {
    return this.mainElement.querySelector(".card-header");
  }

  get footerElement() {
    return this.mainElement.querySelector(".card-footer");
  }

  connect() {
    this.setBorderColor();
  }

  setBorderColor() {
    const color = this.borderColor;
    if (!color) return;

    this.mainElement.style.borderColor = color;
    this.headerElement.style.borderBottomColor = color;
    this.footerElement.style.borderTopColor = color;
  }
}
