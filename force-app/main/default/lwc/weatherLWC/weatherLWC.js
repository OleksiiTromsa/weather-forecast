/**
 * Created by oleksiitromsa on 29.01.2021.
 */

import { LightningElement, api } from "lwc";
import createWeather from "@salesforce/apex/WeatherController.createWeather";
import staticWeatherImage from "@salesforce/resourceUrl/WeatherImage";

export default class WeatherLwc extends LightningElement {
  @api city;
  weatherData;
  weatherImage = staticWeatherImage;

  connectedCallback() {
    createWeather({ city: this.city })
      .then((data) => {
        this.weatherData = data;
        console.log(data);
      })
      .catch((error) => {
        alert("Check city name");
      });
  }
}
