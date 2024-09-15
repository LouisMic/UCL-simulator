import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="update-rankings"
export default class extends Controller {
  update(event) {
    const input = event.currentTarget
    const form = input.closest("form")
    const formData = new FormData(form)

    fetch(form.action, {
      method: "PATCH",
      headers: {
        'X-CSRF-Token': document.querySelector("meta[name='csrf-token']").getAttribute("content"),
        'Accept': 'application/javascript'
      },
      body: formData
    })
      .then(response => response.text())
      .then((data) => {
        console.log(data)
        document.querySelector('.table-container').innerHTML = data
      })
  }
}
