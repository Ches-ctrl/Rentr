
import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  static targets = ["start", "end"]
  static values = { booked: Array }
  connect() {
    console.log(this.bookedValue);
    flatpickr(this.startTarget, {
      dateFormat: "Y-m-d",
      altInput: true,
      altFormat: "F j, Y",
      minDate: new Date().toISOString().substring(0, 10),
      disable: this.bookedValue,
      mode: "range",
    }
    )
  }
  update() {
    if (this.startTarget.value.includes("to")) {
      const endDate = this.startTarget.value.split(" to ")[1];
      this.endTarget.value = endDate
    }
  }
}
