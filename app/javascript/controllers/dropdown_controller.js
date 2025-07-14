import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['drop']

  connect() {
    console.log('dropdown connected')
  }

  toggle(e) {
    if (this.dropTarget.classList.contains('hidden')) {
      this.dropTarget.classList.remove('hidden')
    } else {
      this.dropTarget.classList.add('hidden')
    }
  }

  hide() {
    this.dropTarget.classList.add('hidden')
  }
}