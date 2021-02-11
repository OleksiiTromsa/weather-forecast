/**
 * Created by oleksiitromsa on 29.01.2021.
 */

import { LightningElement, wire, api } from "lwc";
import createWeather from "@salesforce/apex/WeatherController.createWeather";
import getWeather from "@salesforce/apex/WeatherController.getWeather";
import staticWeatherImage from "@salesforce/resourceUrl/WeatherImage";

export default class Weather extends LightningElement {
  @api city;

  weatherImage = staticWeatherImage;

  @wire(getWeather, { city: '$city' })
  weatherData;

  refreshWeather() {
    createWeather({ city: this.city })
      .then((data) => {
        this.weatherData = {data};
      })
      .catch((error) => {
        alert("Check city name");
      });
  }
}
