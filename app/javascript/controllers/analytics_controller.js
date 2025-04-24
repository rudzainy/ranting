import { Controller } from "@hotwired/stimulus"
import Chart from "chart.js/auto"

export default class extends Controller {
  static values = { username: String }
  static targets = ["chart"]

  connect() {
    fetch(`/api/analytics/${this.usernameValue}`)
      .then(res => res.json())
      .then(data => this.renderChart(data))
  }

  renderChart(data) {
    const labels = data.map(d => d.title)
    const clicks = data.map(d => d.clicks)

    new Chart(this.chartTarget.getContext('2d'), {
      type: 'bar',
      data: {
        labels,
        datasets: [{
          label: 'Clicks',
          data: clicks,
          backgroundColor: 'rgba(59, 130, 246, 0.5)',
          borderColor: 'rgba(59, 130, 246, 1)',
          borderWidth: 1
        }]
      },
      options: {
        scales: {
          y: { beginAtZero: true }
        }
      }
    })
  }
}
