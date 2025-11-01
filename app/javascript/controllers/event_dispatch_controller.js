import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  connect() {
    console.log('event-dispatch connected')
  }

  sendEvent(e) {
    console.log('send event')
    console.log(e)
    e.preventDefault()
    e.stopPropagation()
    let eventName = e.currentTarget.getAttribute('data-event-name')
    let eventParam = e.currentTarget.getAttribute('data-event-param')

    let event = new CustomEvent(eventName, {
      detail: JSON.parse(eventParam)
    })
    window.dispatchEvent(event)
  }
}