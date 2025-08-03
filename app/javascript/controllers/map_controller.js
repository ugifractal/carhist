import { Controller } from "@hotwired/stimulus"
import maplibregl from "maplibre-gl"
import "maplibre-gl/dist/maplibre-gl.css"

export default class extends Controller {
  static values = {
    latitude: Number,
    longitude: Number
  }

  connect() {
    if (!this.hasLatitudeValue || !this.hasLongitudeValue) {
      console.warn("Latitude or longitude missing")
      return
    }

    console.log("Map controller connected with coords:", this.latitudeValue, this.longitudeValue)

    const map = new maplibregl.Map({
      container: this.element,
      style: 'https://demotiles.maplibre.org/style.json',
      center: [-74.5, 40],
      // center: [this.longitudeValue, this.latitudeValue],
      zoom: 14
    })

    new maplibregl.Marker()
      //.setLngLat([this.longitudeValue, this.latitudeValue])
      .setLngLat([-74.5, 40])
      .addTo(map)
  }
}
