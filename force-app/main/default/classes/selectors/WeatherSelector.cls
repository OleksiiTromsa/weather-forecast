/**
 * Created by oleksiitromsa on 10.02.2021.
 */

public with sharing class WeatherSelector {
    public static Weather__c getLatestWeather(String city) {
        return [SELECT Temperature__c, Humidity__c, Wind_Speed__c, Pressure__c, Datetime__c, City_Name__c
                FROM Weather__c WHERE City_Name__c = :city
                ORDER BY Datetime__c DESC
                LIMIT 1];
    }
}
