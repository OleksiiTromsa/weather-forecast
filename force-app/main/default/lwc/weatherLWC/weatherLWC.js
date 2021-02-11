/**
 * Created by oleksiitromsa on 29.01.2021.
 */

import { LightningElement, wire, api } from "lwc";
import createWeather from "@salesforce/apex/WeatherController.createWeather";
import getWeather from "@salesforce/apex/WeatherController.getWeather";
import staticWeatherImage from "@salesforce/resourceUrl/WeatherImage";

export default class WeatherLwc extends LightningElement {
  @api city;

  weatherData;
  lastUpdateDate;
  weatherImage = staticWeatherImage;

  @wire(getWeather, { city: "$city" })
  getWeather(response) {
    if (response.data) {
      this.weatherData = response.data;
      this.lastUpdateDate = this.weatherData.Datetime__c.substring(0, 10);
    }
  }

  refreshWeather() {
    createWeather({ city: this.city })
      .then((data) => {
        this.weatherData = data;
        this.lastUpdateDate = this.weatherData.Datetime__c.substring(0, 10);
      })
      .catch((error) => {
        alert("Check city name");
      });
  }
}
