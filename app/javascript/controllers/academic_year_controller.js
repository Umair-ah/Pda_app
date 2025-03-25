import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="academic-year"
export default class extends Controller {
  connect(){
    console.log("isnide")
  }
  updateYear(event) {
    let date = new Date(event.target.value);
    let year = date.getFullYear();

    if (!isNaN(year)) {
      let nextYear = (year + 1).toString().slice(-2); // Get last two digits of next year
      let formattedYear = `${year.toString().slice(-2)}-${nextYear}`;
      event.target.value = formattedYear;
      console.log(formattedYear)
    }
  }
}
