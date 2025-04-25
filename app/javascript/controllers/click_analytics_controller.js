import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { linkId: Number }

  track(event) {
    // click feedback
    const el = event.currentTarget
    el.classList.add('bg-gray-100')
    setTimeout(() => el.classList.remove('bg-gray-100'), 200)

    // non-blocking analytics
    fetch('/analytics/clicks', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector("meta[name='csrf-token']").content
      },
      body: JSON.stringify({ link_id: this.linkIdValue })
    }).catch(error => console.error('Click analytics error:', error))
  }
}
