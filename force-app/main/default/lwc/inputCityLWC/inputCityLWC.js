/**
 * Created by oleksiitromsa on 11.02.2021.
 */

import { LightningElement } from "lwc";

export default class InputCityLwc extends LightningElement {
  city = "Lviv";

  onCityChange(event) {
    this.city = event.target.value;
  }
}
