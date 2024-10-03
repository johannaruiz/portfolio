import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "name", "email", "message", "phone", "company"];

  reset(event) {
    setTimeout(() => {
      if ( event.detail.success && !this.hasErrors()){
        this.clearSuccess();
      } else {
        this.clearFailure();
      }
    }, 200)
  }
  hasErrors() {
    return document.querySelectorAll(".field_with_errors").length > 0 ||
          document.querySelectorAll(".error").length > 0;
  }
  clearSuccess(){
    setTimeout(() => {
      document.querySelector('.flash-notice').remove();
    }, 1500)
  }
  clearFailure(){
    setTimeout(() => {
      document.querySelector('.flash-error').remove();
    }, 1500)
  }
}