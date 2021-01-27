/**
 * Created by oleksiitromsa on 25.01.2021.
 */

public class WeatherCallout {

    public static HttpResponse makeGetCallout(String city) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        String endPoint = 'http://api.openweathermap.org/data/2.5/weather?q=' + city
                + '&appid=c840127ab41a64ffc77361a9d11b3ab3';
        request.setEndpoint(endPoint);
        HttpResponse response = http.send(request);

        if (response.getStatusCode() != 200) {
            throw new CalloutException('No forecast for city ' + city);
        }

        WeatherDto dto = (WeatherDto) JSON.deserialize(response.getBody(), WeatherDto.class);
        Weather__c weather = WeatherMapper.dtoToWeather(dto);
        insert weather;
        return response;
    }
}
