import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/satellite-streets-v12"
    })

    // this.#centerMapOnLondon()
    this.#addMarkersToMap()
    this.#fitMapToMarkers()

    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }))
  }

  #centerMapOnLondon() {
    // Set the center to London's coordinates and adjust the zoom level
    this.map.flyTo({
      center: [-0.1278, 51.5074], // London's longitude and latitude
      zoom: 10, // Zoom level adjusted to show a good amount of detail
      essential: true // this animation is considered essential with respect to prefers-reduced-motion
    });
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      // const roundedDayRate = Math.round(marker.info_window_html);
      // marker.info_window = `£${roundedDayRate}`

      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 12, duration: 0 })
  }
}
