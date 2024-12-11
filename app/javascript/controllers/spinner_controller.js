import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="spinner"
export default class extends Controller {
  connect() {
    document.addEventListener('turbo:submit-end', () => {
      this.show();
    });
  }

  show() {
    document.getElementById("spinner").classList.toggle("hidden");
  }
}
