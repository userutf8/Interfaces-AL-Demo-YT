codeunit 50156 "Interfaces Demo Processing"
{
    var
        _httpClient: Interface IHttpClient;
        _httpResponseMessage: Interface IHttpResponseMessage;

    procedure Init(var HttpClientFactory: Codeunit "Http Client Factory")
    begin
        _httpClient := HttpClientFactory.GetHttpClient();
        _httpResponseMessage := HttpClientFactory.GetResponseMessage();
    end;

    procedure SendRequest(Url: Text; Method: Text)
    var
        MyHttpRequestMessage: HttpRequestMessage;
    begin
        if Url = '' then
            Error('Url is empty');

        MyHttpRequestMessage.SetRequestUri(Url);
        MyHttpRequestMessage.Method := Method;
        _httpClient.Send(MyHttpRequestMessage, _httpResponseMessage);
        if _httpResponseMessage.IsSuccessStatusCode() then
            Message(_httpResponseMessage.GetResponseBodyAsText())
        else
            Message('Status code: %1', _httpResponseMessage.HttpStatusCode());
    end;

}