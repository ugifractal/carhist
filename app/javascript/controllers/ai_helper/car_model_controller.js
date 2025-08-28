import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static values = {
    url: String,
    model: String,
    year: String
  }
  connect() {
    console.log('ai-helper--car-model connected')
  }

  async fill(e){
    e.preventDefault()
    const meta = document.querySelector('meta[name="csrf-token"]')
    let token = (meta == null)? '' : meta.getAttribute('content')

    const response = await fetch(this.urlValue, {
      method: "POST",
      credentials: 'include',
      headers: {
        'X-CSRF-Token': token,
        'Accept': 'text/vnd.turbo-stream.html'
      },
      body: JSON.stringify({model: this.modelValue, year: this.yearValue})
    })
    const json = await response.json()

    const data = JSON.parse(json.text)
  }
}