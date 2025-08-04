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
      //style: 'https://demotiles.maplibre.org/style.json',
      style: 'https://raw.githubusercontent.com/go2garret/maps/main/src/assets/json/openStreetMap.json',
      center: [this.longitudeValue, this.latitudeValue],
      zoom: 14
    })

    new maplibregl.Marker()
      .setLngLat([this.longitudeValue, this.latitudeValue])
      .addTo(map)
  }
}
