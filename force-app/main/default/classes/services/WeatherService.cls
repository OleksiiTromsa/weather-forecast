/**
 * Created by oleksiitromsa on 25.01.2021.
 */

public class WeatherService {
    public static Weather__c createWeather(String city) {
        HttpResponse response = WeatherCallout.getWeatherCallout(city);
        Weather__c weather = WeatherMapper.httpResponseToWeather(response);
        insert weather;
        return weather;
    }

    public static Weather__c getLatestWeather(String city) {
        Weather__c weather = WeatherSelector.getLatestWeather(city);
        return weather;
    }
}
