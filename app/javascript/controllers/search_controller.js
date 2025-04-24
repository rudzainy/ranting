import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "results"]

  perform() {
    const query = this.inputTarget.value.trim()
    if (!query) {
      this.resultsTarget.innerHTML = ""
      return
    }
    fetch(`/api/search?query=${encodeURIComponent(query)}`)
      .then(res => res.json())
      .then(data => {
        this.resultsTarget.innerHTML = this.renderResults(data)
      })
  }

  renderResults(data) {
    if (data.length === 0) {
      return "<p class='text-gray-500'>No results found.</p>"
    }
    return data
      .map(item => `
        <div class="p-3 bg-white border border-gray-200 rounded shadow-sm flex justify-between">
          <div>
            <a href="/${item.username}" class="font-medium text-blue-600 hover:underline">@${item.username}</a>
            <span class="mx-2">/</span>
            <a href="${item.url}" target="_blank" rel="noopener" class="text-gray-800 hover:underline">${item.title}</a>
          </div>
        </div>
      `)
      .join("")
  }
}
