// app/javascript/controllers/inline_edit_controller.js
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["groupName", "editForm"]
  static values = { groupId: Number }

  edit(event) {
    event.preventDefault()
    this.groupNameTarget.classList.add('hidden')
    this.editFormTarget.classList.remove('hidden')
    this.editFormTarget.querySelector('input').focus()
  }

  cancel(event) {
    event.preventDefault()
    this.groupNameTarget.classList.remove('hidden')
    this.editFormTarget.classList.add('hidden')
  }
}
