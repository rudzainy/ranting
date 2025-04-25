import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
  static values = { url: String }

  connect() {
    this.sortable = Sortable.create(this.element, {
      handle: ".drag-handle",
      animation: 150,
      onEnd: this.end.bind(this)
    })
  }

  end() {
    const ids = Array.from(this.element.children).map(el => el.dataset.id)
    fetch(this.urlValue, {
      method: "PATCH",
      credentials: "include",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content
      },
      body: JSON.stringify({ order: ids })
    })
  }
}
