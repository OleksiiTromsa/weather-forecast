/**
 * Created by oleksiitromsa on 29.01.2021.
 */

import { LightningElement, wire } from "lwc";
// import getWeather from '@salesforce/apex/WeatherController.getWeather';
import getWeatherAndInsertToDB from "@salesforce/apex/WeatherController.getWeatherAndInsertToDB";

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

    getWeatherAndInsertToDB({ city: inputCity.value })
      .then((data) => {
        this.city = inputCity.value;
        this.weather = data;
        this.wind = data.Wind_Speed__c;
        this.temperature = Math.round(data.Temperature__c - 273.15);
        this.pressure = data.Pressure__c;
        this.dt = new Date(Date.now()).toDateString();
      })
      .catch((error) => {
        alert("Wrong city");
      });
  }

  // @wire(getWeather)
  // wiredWeather({data, error}) {
  //   console.log('we got weather');
  //   //console.log(this.data);
  //   if (data) {
  //     console.log('data not null');
  //    // this.data = data;
  //     console.log(data);
  //     console.log(data.Wind_Speed__c);
  //     this.wind = data.Wind_Speed__c;
  //     let res = Object.assign([], data) ;
  //     console.log(res.Wind_Speed__c);
  //
  //     //console.log(parsedData);
  //
  //     //console.log(wind);
  //   }
  //   else if (error) {
  //     this.error = error;
  //     console.log(error);
  //   }
  // }
}
