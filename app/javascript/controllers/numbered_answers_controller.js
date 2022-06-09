// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "output" ]

  connect() {
    let numbers = ["a) ", "b) ", "c) ", "d) "];
    let labels = document.querySelectorAll("label") || document.querySelectorAll("li");

    console.log('I am here');

    labels.forEach((label) => {
      let index_option = Array.prototype.indexOf.call(labels, label);

      if (index_option <= 3) {
        let number = numbers[index_option]
        label.innerHTML = number +  label.innerHTML
      } else if(index_option <= 7) {
        let number = numbers[index_option - 4]
        label.innerHTML = number +  label.innerHTML
      } else if(index_option <= 11) {
        let number = numbers[index_option - 4*2]
        label.innerHTML = number +  label.innerHTML
      } else {
        let number = numbers[index_option - 4*3]
        label.innerHTML = number +  label.innerHTML
      }
    });
  }
}
