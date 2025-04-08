import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["link", "button_icon"]
  static ACTIVE_TEXT_CLASS = "text-bg-light"

  connect() {
    const savedTheme = localStorage.getItem("theme");

    if (savedTheme) {
      this.applyTheme(savedTheme);
    } else {
      this.applyTheme("auto");
    }
  }

  changeTheme(event) {
    event.preventDefault();
    if (!event.target.dataset)
      return;

    if (event.target.classList.contains(this.constructor.ACTIVE_TEXT_CLASS))
      return;

    const themeName = event.target.dataset.theme;

    localStorage.setItem("theme", themeName);
    this.applyTheme(themeName);
  }

  setElementActiveClass(currentTheme) {
    this.linkTargets.forEach((link) => {
      link.classList.remove(this.constructor.ACTIVE_TEXT_CLASS);
      link.classList.add("text-light");
    });

    const activeLink = this.linkTargets.find((link) => link.dataset.theme === currentTheme);

    if (activeLink) {
      activeLink.classList.add(this.constructor.ACTIVE_TEXT_CLASS);
      activeLink.classList.remove("text-light");

      this.setButtonIcon(activeLink);
    }
  }

  setButtonIcon(activeLink) {
    if (!this.button_iconTarget || !activeLink)
      return;

    let currentIcon = null;
    this.button_iconTarget.classList.forEach(className => {
      if (className.startsWith("bi-")) {
        currentIcon = className;
        return;
      }
    });

    if (currentIcon)
      this.button_iconTarget.classList.remove(currentIcon);

    const icon = activeLink.querySelector("i");
    let iconClass = null;
    icon.classList.forEach(className => {
      if (className.startsWith("bi-")) {
        iconClass = className;
        return;
      }
    });

    if (iconClass)
      this.button_iconTarget.classList.add(iconClass);
  }

  applyTheme(themeName) {
    document.documentElement.setAttribute("data-bs-theme", themeName);

    this.setElementActiveClass(themeName);
  }
}
