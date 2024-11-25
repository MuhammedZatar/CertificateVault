import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("Hello, Stimulus!");
  }

  static targets = ["token", "button"];

  toggle() {
    if (this.tokenTarget.classList.contains("hidden")) {
      this.tokenTarget.classList.remove("hidden");
      this.buttonTarget.textContent = "Hide Token";
    } else {
      this.tokenTarget.classList.add("hidden");
      this.buttonTarget.textContent = "Show Token";
    }
  }
}
