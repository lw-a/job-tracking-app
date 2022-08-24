import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-task"
export default class extends Controller {
  static targets = ["tasks", "form"]

  add(event) {
    event.preventDefault()
  
    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {
          console.log(this.tasksTarget)
          this.tasksTarget.outerHTML = data;
      })
  }
}