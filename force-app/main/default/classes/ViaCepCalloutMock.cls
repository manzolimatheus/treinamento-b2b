global class ViaCepCalloutMock implements HttpCalloutMock {
    public Boolean isError;

    public ViaCepCalloutMock(Boolean isError) {
        this.isError = isError;
    }

    private HttpResponse generateError() {
        HttpResponse response = new HttpResponse();

        response.setStatusCode(500);
        response.setHeader('Content-Type', 'text/html');
        response.setBody('Internal server error');

        return response;
    }

    private HttpResponse generateSuccess() {
        HttpResponse response = new HttpResponse();

        response.setStatusCode(200);
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"cep":"01001-000","logradouro":"Praça da Sé","complemento":"lado ímpar","unidade":"","bairro":"Sé","localidade":"São Paulo","uf":"SP","estado":"São Paulo","regiao":"Sudeste","ibge":"3550308","gia":"1004","ddd":"11","siafi":"7107"}');

        return response;
    }

    global HttpResponse respond(HttpRequest request) {
        HttpResponse response = new HttpResponse();

        if (this.isError) return this.generateError();

        return this.generateSuccess();
    }
}