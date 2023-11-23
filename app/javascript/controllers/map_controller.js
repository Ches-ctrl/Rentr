import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

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
      console.log(this.markersValue)
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    console.log(this.markersValue);
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 12, duration: 0 })
  }
}
