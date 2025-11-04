import { Controller } from '@hotwired/stimulus'
import * as Turbo from "@hotwired/turbo"

export default class extends Controller {

  static values = {
    url: String,
    initialSort: String,
    initialDir: String,
    pdfUrl: String
  }

  static targets = ["search", "category", "orderType", "startDate", "endDate", "suretaxStatus"]

  connect() {
    console.log('maintenace--filter connected')
    this.sortBy = this.initialSortValue
    this.direction = this.initialDirValue
    this.page = 1
  }

  changeSort(e) {
    e.stopPropagation()
    e.preventDefault()
    if (e.currentTarget.dataset.sort == this.sortBy) {
      if (this.direction == 'asc') {
        this.direction = 'desc'
      } else {
        this.direction = 'asc'
      }
    } else {
      this.direction = 'asc'
      this.sortBy = e.currentTarget.dataset.sort
    }
    this.apply()
  }

  changeFilter(e) {
    e.stopPropagation()
    e.preventDefault()
    this.page = 1
    this.apply()
  }

  changePage(e) {
    e.stopPropagation()
    e.preventDefault()
    this.page = e.detail.page
    this.apply()
  }

  async generatePdf(e) {
    e.preventDefault()

    let url = this.pdfUrlValue
      .replace('--ordering', this.sortBy)
      .replace('--direction', this.direction)

    if (this.hasSearchTarget) {
      url = url.replace('--keyword', this.searchTarget.value)
    }else {
      url = url.replace('--keyword', '')
    }

    if (this.hasCategoryTarget) {
      url = url.replace('--categories', this.categoryTargets.filter( x => x.checked ).map(x => x.value))
    }else{
      url = url.replace('--categories', '')
    }

    const meta = document.querySelector('meta[name="csrf-token"]')
    let token = (meta == null)? '' : meta.getAttribute('content')
    const response = await fetch(url, {
      method: 'POST',
      credentials: 'include',
      headers: {
        'X-CSRF-Token': token,
        'Accept': 'text/vnd.turbo-stream.html'
      },
    })
    const text = await response.text()
    Turbo.renderStreamMessage(text)
  }

  clearFilter() {
    this.page = 1
    if (this.hasSearchTarget) {
      this.searchTarget.value = ''
    }
    if (this.hasCategoriesTarget){
      this.processingStatusTarget.value = ''
    }

    if (this.hasOrderTypeTarget) {
      this.orderTypeTarget.value = ''
    }

    if (this.hasStartDateTarget) {
      this.startDateTarget.value = ''
    }

    if (this.hasEndDateTarget) {
      this.endDateTarget.value = ''
    }
    if (this.hasSuretaxStatusTarget) {
      this.suretaxStatusTarget.value = ''
    }
    this.apply()
  }

  async apply() {
    let url = this.urlValue
      .replace('--ordering', this.sortBy)
      .replace('--direction', this.direction)
      .replace('--paging', this.page)

    if (this.hasSearchTarget) {
      url = url.replace('--keyword', this.searchTarget.value)
    }else {
      url = url.replace('--keyword', '')
    }

    if (this.hasCategoryTarget) {
      url = url.replace('--categories', this.categoryTargets.filter( x => x.checked ).map(x => x.value))
    }else{
      url = url.replace('--categories', '')
    }

    if (this.hasOrderTypeTarget) {
      url = url.replace('--order-type', this.orderTypeTarget.value)
    }else{
      url = url.replace('--order-type', '')
    }

    if (this.hasStartDateTarget) {
      url = url.replace('--start-date', this.startDateTarget.value)
    }else{
      url = url.replace('--start-date', '')
    }

    if (this.hasEndDateTarget) {
      url = url.replace('--end-date', this.endDateTarget.value)
    }else{
      url = url.replace('--end-date', '')
    }

    if (this.hasSuretaxStatusTarget) {
      url = url.replace('--suretax-status', this.suretaxStatusTarget.value)
    }else{
      url = url.replace('--suretax-status', '')
    }

    const meta = document.querySelector('meta[name="csrf-token"]')
    let token = (meta == null)? '' : meta.getAttribute('content')
    const response = await fetch(url, {
      method: 'GET',
      credentials: 'include',
      headers: {
        'X-CSRF-Token': token,
        'Accept': 'text/vnd.turbo-stream.html'
      },
    })
    const text = await response.text()
    Turbo.renderStreamMessage(text)
  }
}