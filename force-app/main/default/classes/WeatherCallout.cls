/**
 * Created by oleksiitromsa on 25.01.2021.
 */

public class WeatherCallout {

    public static Weather__c makeGetCallout(String city) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        Open_Weather_API_Key__mdt apiKey = [SELECT Key__c FROM Open_Weather_API_Key__mdt WHERE Is_Active__c = true];
        String endPoint = 'http://api.openweathermap.org/data/2.5/weather?q=' + city
                + '&appid=' + apiKey.Key__c;
        request.setEndpoint(endPoint);
        HttpResponse response = http.send(request);

        if (response.getStatusCode() != 200) {
            throw new CalloutException('No forecast for city ' + city);
        }

        WeatherDto dto = (WeatherDto) JSON.deserialize(response.getBody(), WeatherDto.class);
        Weather__c weather = WeatherMapper.dtoToWeather(dto);
        insert weather;
        return weather;
    }
}
