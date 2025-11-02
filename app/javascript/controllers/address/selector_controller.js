import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['regency', 'district', 'village']

  connect() {
    console.log('address--selector connected')
  }

  async loadRegencies(e) {
    e.preventDefault()
    const response = await fetch(`/provinces/${e.currentTarget.value}/regencies`, {
      method: "GET"
    })
    const json = await response.json()

    this.regencyTarget.innerHTML = ''
    this.regencyTarget.appendChild(document.createElement("option"))
    json.regencies.forEach(opt => {
      const option = document.createElement("option")
      option.value = opt.id
      option.textContent = opt.name
      this.regencyTarget.appendChild(option)
    })
  }

  async loadDistricts(e) {
    e.preventDefault()
    const response = await fetch(`/provinces/${e.currentTarget.value}/districts`, {
      method: "GET"
    })
    const json = await response.json()

    this.districtTarget.innerHTML = ''
    this.districtTarget.appendChild(document.createElement("option"))
    json.districts.forEach(opt => {
      const option = document.createElement("option")
      option.value = opt.id
      option.textContent = opt.name
      this.districtTarget.appendChild(option)
    })
  }

  async loadVillages(e) {
    e.preventDefault()
    const response = await fetch(`/provinces/${e.currentTarget.value}/villages`, {
      method: "GET"
    })
    const json = await response.json()

    this.villageTarget.innerHTML = ''
    this.villageTarget.appendChild(document.createElement("option"))
    json.villages.forEach(opt => {
      const option = document.createElement("option")
      option.value = opt.id
      option.textContent = opt.name
      this.villageTarget.appendChild(option)
    })
  }
}