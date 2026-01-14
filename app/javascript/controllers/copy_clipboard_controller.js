import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['textfield', 'indicator']

  connect() {
    console.log('copy-clipboard connected')
  }

  async copy(e) {
    e.preventDefault()
    await navigator.clipboard.writeText(this.textfieldTarget.value)
    this.indicatorTarget.innerHTML = "Copied"
  }
}
