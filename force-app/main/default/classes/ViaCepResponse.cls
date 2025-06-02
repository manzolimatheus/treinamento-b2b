public with sharing class ViaCepResponse {
    public String cep;
    public String logradouro;
    public String complemento;
    public String unidade;
    public String bairro;
    public String localidade;
    public String uf;
    public String estado;
    public String regiao;
    public String ibge;
    public String gia;
    public String ddd;
    public String siafi;

    public static ViaCepResponse parseResponse(String response) {
        return (ViaCepResponse) System.JSON.deserialize(response, ViaCepResponse.class);
    }
}