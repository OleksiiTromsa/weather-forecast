/**
 * Created by oleksiitromsa on 05.02.2021.
 */

public with sharing class OpenWeatherApiKeySelector {
    public static Open_Weather_API_Key__mdt getActiveApiKey() {
        return [SELECT Key__c FROM Open_Weather_API_Key__mdt WHERE Active__c = TRUE];
    }
}
