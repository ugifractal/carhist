import Chart from 'chart.js/auto'

import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['canvas']
  static values = {
    url: String,
    title: String
  }

  connect() {
    console.log('graph connected')

    const f = async ()=>{
      const graphData = await this.fetchData()
      new Chart(this.canvasTarget, {
        type: 'line',
        data: {
          labels: graphData.map(row => row.created_at_in_zone),
          datasets: [
            {
              label: this.titleValue,
              data: graphData.map(row => row.ect_voltage)
            }
          ]
        }
      })
    }

    f()


  }

  async fetchData() {
    const meta = document.querySelector('meta[name="csrf-token"]')
    let token = (meta == null)? '' : meta.getAttribute('content')

    const response = await fetch(this.urlValue, {
      method: "GET",
      credentials: 'include',
      headers: {
        'X-CSRF-Token': token,
        'Content-Type': 'application/json'
      }
    })
    const json = await response.json()

    return json
  }
}