import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ["button"]
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
    this.buttonTarget.disabled = true
    let originalText = this.buttonTarget.textContent
    this.buttonTarget.textContent = "Calling AI..."

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
    const data = JSON.parse(json.output)
    Object.keys(data).forEach(key => {
      if (document.getElementById(`car_model_${key}`)){
        const input = document.getElementById(`car_model_${key}`)
        input.value = data[key]
      }
    })

    this.buttonTarget.disabled = false
    this.buttonTarget.textContent = originalText
  }
}