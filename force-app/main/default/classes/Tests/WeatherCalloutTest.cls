/**
 * Created by oleksiitromsa on 26.01.2021.
 */

@IsTest
private class WeatherCall {

    @IsTest
    static void testGetCalloutFullJsonOk() {
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetWeatherCalloutStaticFullJson');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        Test.setMock(HttpCalloutMock.class, mock);

        HttpResponse result = WeatherCallout.makeGetCallout('London');

        System.assertNotEquals(null, result,'The callout returned a null response.');
        System.assertEquals(200, result.getStatusCode(), 'The status code is not 200.');
        System.assertEquals('application/json;charset=UTF-8',
                result.getHeader('Content-Type'),
                'The content type value is not expected.');
    }

    @IsTest
    static void testGetCalloutPartJsonOk() {
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetWeatherCalloutStaticPartJson');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        Test.setMock(HttpCalloutMock.class, mock);

        HttpResponse result = WeatherCallout.makeGetCallout('London');

        System.assertNotEquals(null, result,'The callout returned a null response.');
        System.assertEquals(200, result.getStatusCode(), 'The status code is not 200.');
        System.assertEquals('application/json;charset=UTF-8',
                result.getHeader('Content-Type'),
                'The content type value is not expected.');
    }

    @IsTest
    static void testGetCalloutFailStatusCode() {
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetWeatherCalloutStaticFullJson');
        mock.setStatusCode(404);
        Test.setMock(HttpCalloutMock.class, mock);

        String errorMessage = '';
        try {
            HttpResponse result = WeatherCallout.makeGetCallout('London');
        } catch (CalloutException e) {
            errorMessage = e.getMessage();
        }
        System.assertEquals('No forecast for city London', errorMessage);
    }
}
