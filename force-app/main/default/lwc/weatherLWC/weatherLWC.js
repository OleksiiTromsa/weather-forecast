/**
 * Created by oleksiitromsa on 29.01.2021.
 */

import { LightningElement } from "lwc";
import createWeather from "@salesforce/apex/WeatherController.createWeather";

export default class WeatherLwc extends LightningElement {
  error;
  weather;
  wind;
  temperature;
  pressure;
  dt;
  city;

  getWeatherForecast() {
    let inputCity = this.template.querySelector("lightning-input");

    createWeather({ city: inputCity.value })
      .then((data) => {
        this.city = inputCity.value;
        this.weather = data;
        this.wind = data.Wind_Speed__c;
        this.temperature = Math.round(data.Temperature__c);
        this.pressure = data.Pressure__c;
        this.dt = new Date(Date.now()).toDateString();
      })
      .catch((error) => {
        alert("Wrong city");
      });
  }
}
