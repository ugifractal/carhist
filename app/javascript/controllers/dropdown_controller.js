import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['menu']

  connect() {
    console.log('dropdown connected')
  }

  toggle(e) {
    if (this.menuTarget.classList.contains('hidden')) {
      this.menuTarget.classList.remove('hidden')
    } else {
      this.menuTarget.classList.add('hidden')
    }
  }
}