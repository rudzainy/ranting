// app/javascript/controllers/inline_edit_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["groupName", "editForm"]

  edit(event) {
    event.preventDefault()
    this.groupNameTarget.classList.add('hidden')
    this.editFormTarget.classList.remove('hidden')
    const field = this.editFormTarget.querySelector('input, textarea')
    if (field) field.focus()
  }

  cancel(event) {
    event.preventDefault()
    this.groupNameTarget.classList.remove('hidden')
    this.editFormTarget.classList.add('hidden')
  }
}
