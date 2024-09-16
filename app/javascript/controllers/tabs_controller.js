import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tabs"
export default class extends Controller {
  activate(event) {
    event.preventDefault()
    this.reinitialize_tab()
    this.reinitialize_button()
    event.currentTarget.setAttribute('aria-selected', 'true')
    event.currentTarget.classList.add('italic')
    const matchday = event.currentTarget.getAttribute('aria-controls')
    document.getElementById(matchday).classList.remove('hidden')
  }

  reinitialize_tab() {
    const matchdays = document.querySelectorAll('[role="tabpanel"]')
    matchdays.forEach(function (el){
      if (!el.classList.contains("hidden")) {
        el.classList.add("hidden");
      }
      });
  }

  reinitialize_button() {
    const buttons = document.querySelectorAll('[role="tab"]')
    buttons.forEach(function (el){
      if (el.getAttribute('aria-selected') == 'true') {
        el.setAttribute('aria-selected', 'false')
        el.classList.remove('italic')
      }
    });
  }

}
