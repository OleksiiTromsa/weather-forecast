/**
 * Created by oleksiitromsa on 29.01.2021.
 */

public with sharing class WeatherController {
    @AuraEnabled
    public static Weather__c createWeather(String city) {
        Weather__c weather = WeatherService.createWeather(city);
        return weather;
    }

    @AuraEnabled(Cacheable=true)
    public static Weather__c getWeather(String city) {
        return WeatherService.getLatestWeather(city);
    }
}
