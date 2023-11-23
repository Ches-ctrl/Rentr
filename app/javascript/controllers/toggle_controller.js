import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["mapColumn", "carsColumn"];

  toggleMap() {
    let mapColumnClassList = this.mapColumnTarget.classList;
    let carsColumnClassList = this.carsColumnTarget.classList;
    let carCards = this.carsColumnTarget.querySelectorAll('.row > div');

    if (mapColumnClassList.contains('col-md-6')) {
      // Hide the map column
      mapColumnClassList.replace('col-md-6', 'd-none');
      // Expand the cars column
      carsColumnClassList.replace('col-md-6', 'col-12');
      // Update the car card columns to 4 across
      carCards.forEach(card => {
        card.classList.replace('col-xl-6', 'col-xl-3');
      });
    } else {
      // Show the map column
      mapColumnClassList.replace('d-none', 'col-md-6');
      // Shrink the cars column
      carsColumnClassList.replace('col-12', 'col-md-6');
      // Update the car card columns back to 2 across on XL screens
      carCards.forEach(card => {
        card.classList.replace('col-xl-3', 'col-xl-6');
      });
    }
  }
}
