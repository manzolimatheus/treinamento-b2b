public with sharing class AddressIntegration {
    public String url;
    public ViaCepResponse result;

    public class AddressIntegrationException extends Exception {}
    
    public AddressIntegration(String zipCode) {
        this.url = 'https://viacep.com.br/ws/' + zipCode + '/json/';
        this.result = getAddressData();
        System.debug(this.result);
    }
    
    
    public ViaCepResponse getAddressData() {
        Http http = new Http();
        
        HttpRequest request = new HttpRequest();
        request.setEndpoint(this.url);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        String data = response.getBody();
        
        if (response.getStatusCode() != 200) {
            throw new AddressIntegrationException('Integration fail');
        }
        
        ViaCepResponse parsedData = ViaCepResponse.parseResponse(data);
        
        return parsedData;
    }
}