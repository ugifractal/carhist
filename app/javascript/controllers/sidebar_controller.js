import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['menu', "openIcon", "closeIcon"]

  connect() {
    console.log('sidebar connected')
  }

  toggle(e) {
    if (this.menuTarget.classList.contains('hidden')) {
      this.menuTarget.classList.remove('hidden')
      this.openIconTarget.classList.add("hidden")
      this.closeIconTarget.classList.remove("hidden")
    } else {
      this.menuTarget.classList.add('hidden')
      this.openIconTarget.classList.remove("hidden")
      this.closeIconTarget.classList.add("hidden")
    }
  }
}