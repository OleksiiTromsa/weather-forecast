/**
 * Created by oleksiitromsa on 05.02.2021.
 */

public with sharing class WeatherCallout {
    public static HttpResponse getWeatherCallout(String city) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        Open_Weather_API_Key__mdt apiKey = OpenWeatherApiKeySelector.getActiveApiKey();
        String endPoint = 'http://api.openweathermap.org/data/2.5/weather?q=' + city
                + '&appid=' + apiKey.Key__c;
        request.setEndpoint(endPoint);
        HttpResponse response = http.send(request);

        if (response.getStatusCode() != 200) {
            throw new CalloutException('No forecast for city ' + city);
        }

        return response;
    }
}
