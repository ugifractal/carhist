import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    latitude: Number,
    longitude: Number
  }

  connect() {
    if (!this.hasLatitudeValue || !this.hasLongitudeValue) return

    const map = new maplibregl.Map({
      container: this.element.id,
      style: 'https://demotiles.maplibre.org/style.json',
      center: [this.longitudeValue, this.latitudeValue],
      zoom: 14
    })

    new maplibregl.Marker()
      .setLngLat([this.longitudeValue, this.latitudeValue])
      .addTo(map)
  }
}
