/**
 * Created by oleksiitromsa on 25.01.2021.
 */

public with sharing class WeatherMapper {
    public static Weather__c dtoToWeather(WeatherDto dto) {
        Weather__c weather = new Weather__c();

        if (dto.coord != null) {
            weather.Latitude__c = dto.coord.lat;
            weather.longitude__c = dto.coord.lon;
        }
        if (dto.weather != null) {
            weather.Weather_Id__c = dto.weather.get(0).id;
            weather.Weather_Main__c = dto.weather.get(0).main;
            weather.Weather_Description__c = dto.weather.get(0).description;
            weather.Weather_Icon__c = dto.weather.get(0).icon;
        }
        if (dto.main != null) {
            weather.Temperature__c = dto.main.temp;
            weather.Feels_Like__c = dto.main.feels_like;
            weather.Temp_Max__c = dto.main.temp_max;
            weather.Temp_Min__c = dto.main.temp_min;
            weather.Pressure__c = dto.main.pressure;
            weather.Humidity__c = dto.main.humidity;
        }
        if (dto.wind != null) {
            weather.Wind_Speed__c = dto.wind.speed;
            weather.Wind_Deg__c = dto.wind.deg;
        }
        if (dto.clouds != null) {
            weather.Clouds_All__c = dto.clouds.all;
        }
        if (dto.dt != null) {
            weather.Datetime__c = Datetime.newInstance(dto.dt * 1000);
        }
        if (dto.sys != null) {
            weather.Sys_Type__c = dto.sys.type;
            weather.Sys_Id__c = dto.sys.id;
            weather.Sys_Country__c = dto.sys.country;
            if (dto.sys.sunrise != null) {
                weather.Sunrize__c = Datetime.newInstance(dto.sys.sunrise * 1000);
            }
            if (dto.sys.sunset != null) {
                weather.Sunset__c = Datetime.newInstance(dto.sys.sunset * 1000);
            }
        }
        weather.Base__c = dto.base;
        weather.Visibility__c = dto.visibility;
        weather.Timezone__c = dto.timezone;
        weather.External_Id__c = dto.id;
        weather.City_Name__c = dto.name;
        weather.Cod__c = dto.cod;

        return weather;
    }
}
