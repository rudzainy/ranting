import { Controller } from "@hotwired/stimulus"
import { Modal } from 'flowbite'

export default class extends Controller {
  connect() {
    const options = {
      placement: 'center',
      backdrop: 'dynamic',
      backdropClasses: 'bg-gray-900/50 dark:bg-gray-900/80 fixed inset-0 z-40',
      closable: true
    }

    this.modal = new Modal(this.element)
  }

  disconnect() {
    // Clean up when the element is removed
    this.modal = null
  }
}