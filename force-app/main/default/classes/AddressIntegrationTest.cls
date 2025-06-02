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
        
        try {
            AddressIntegration integration = new AddressIntegration('13333333');
            System.assert(false, 'This code should not be executed.');
        } catch (Exception e) {
            System.assertEquals('Integration fail', e.getMessage());
        }

    }
}