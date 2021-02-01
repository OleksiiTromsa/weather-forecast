/**
 * Created by oleksiitromsa on 29.01.2021.
 */

public with sharing class WeatherController {
    @AuraEnabled
    public static Weather__c getWeatherAndInsertToDB(String city) {
        return WeatherCallout.makeGetCallout(city);
    }

//    @AuraEnabled(Cacheable=true)
//    public static Weather__c getWeather() {
//        String city = 'London';
//        WeatherCallout.makeGetCallout(city);
//        Weather__c weather = [SELECT City_Name__c, Datetime__c, Temperature__c, Wind_Speed__c, Pressure__c
//                              FROM Weather__c WHERE City_Name__c = :city LIMIT 1];
//        //AND Datetime__c = :Date.today()
//        return weather;
//    }
}
