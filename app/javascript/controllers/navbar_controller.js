import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "hamburger", "closeIcon"]

  toggle() {
    this.menuTarget.classList.toggle("hidden")
    this.hamburgerTarget.classList.toggle("hidden")
    this.hamburgerTarget.classList.toggle("block")
    this.closeIconTarget.classList.toggle("hidden")
    this.closeIconTarget.classList.toggle("block")
  }

  // Fechar menu quando clicar fora
  connect() {
    document.addEventListener('click', this.handleClickOutside.bind(this))
  }

  disconnect() {
    document.removeEventListener('click', this.handleClickOutside.bind(this))
  }

  handleClickOutside(event) {
    if (!this.element.contains(event.target) && !this.menuTarget.classList.contains("hidden")) {
      this.close()
    }
  }

  close() {
    this.menuTarget.classList.add("hidden")
    this.hamburgerTarget.classList.add("block")
    this.hamburgerTarget.classList.remove("hidden")
    this.closeIconTarget.classList.add("hidden")
    this.closeIconTarget.classList.remove("block")
  }
}

// app/javascript/controllers/dropdown_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  toggle() {
    this.menuTarget.classList.toggle("hidden")
  }

  // Fechar dropdown quando clicar fora
  connect() {
    document.addEventListener('click', this.handleClickOutside.bind(this))
  }

  disconnect() {
    document.removeEventListener('click', this.handleClickOutside.bind(this))
  }

  handleClickOutside(event) {
    if (!this.element.contains(event.target) && !this.menuTarget.classList.contains("hidden")) {
      this.close()
    }
  }

  close() {
    this.menuTarget.classList.add("hidden")
  }
}