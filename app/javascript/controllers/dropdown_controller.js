// app/javascript/controllers/dropdown_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  connect() {
    console.log("Dropdown controller connected")
    // Garantir que o dropdown está fechado no início
    this.close()
    
    // Adicionar listener para clicks fora
    document.addEventListener('click', this.handleClickOutside.bind(this))
  }

  disconnect() {
    document.removeEventListener('click', this.handleClickOutside.bind(this))
  }

  toggle() {
    console.log("Toggle dropdown called")
    
    if (this.menuTarget.classList.contains("hidden")) {
      this.open()
    } else {
      this.close()
    }
  }

  open() {
    console.log("Opening dropdown")
    this.menuTarget.classList.remove("hidden")
  }

  close() {
    console.log("Closing dropdown")
    this.menuTarget.classList.add("hidden")
  }

  // Fechar dropdown quando clicar fora
  handleClickOutside(event) {
    if (!this.element.contains(event.target) && !this.menuTarget.classList.contains("hidden")) {
      this.close()
    }
  }
}