@isTest
private class AddressIntegrationTest {

    @isTest
    static void addressIntegrationResultShouldBeOK() {
        Test.setMock(HttpCalloutMock.class, new ViaCepCalloutMock(false));
        AddressIntegration integration = new AddressIntegration('13333333');

        System.assert.isNotNull(integration.result);
        System.assert.isNotNull(integration.result.cep);
    }

    @isTest
    static void addressIntegrationResultShouldBeNull() {
        Test.setMock(HttpCalloutMock.class, new ViaCepCalloutMock(true));
        AddressIntegration integration = new AddressIntegration('13333333');

        System.assert.isNull(integration.result.cep);
    }
}