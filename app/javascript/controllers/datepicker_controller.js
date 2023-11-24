
import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  static targets = ["start", "end", "total", "days", "cost"]
  static values = {
    booked: Array,
    rate: Number
  }
  connect() {
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
      const startDate = this.startTarget.value.split(" to ")[0];
      this.endTarget.value = endDate;
      this.daysTarget.innerText = `Number of days: ${(new Date(endDate) - new Date(startDate)) / (1000 * 60 * 60 * 24)}`;
      console.log(this.rateValue);
      this.costTarget.innerText = `Cost per day: £${this.rateValue}`;
      this.totalTarget.innerText = `Total: £${((new Date(endDate) - new Date(startDate)) / (1000 * 60 * 60 * 24)) * this.rateValue}`;
    }
  }
}
