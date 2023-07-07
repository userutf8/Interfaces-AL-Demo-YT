codeunit 50155 "Http Client Factory"
{
    var
        _httpClient: Interface IHttpClient;
        _httpClientIsSet: Boolean;
        _httpResponseMessage: Interface IHttpResponseMessage;
        _httpResponseMessageIsSet: Boolean;

    procedure GetHttpClient(): Interface IHttpClient
    begin
        if _httpClientIsSet then
            exit(_httpClient);

        SetDefaultHttpClient();
        exit(_httpClient);
    end;

    procedure GetResponseMessage(): Interface IHttpResponseMessage
    begin
        if _httpResponseMessageIsSet then
            exit(_httpResponseMessage);

        SetDefaultResponseMessage();
        exit(_httpResponseMessage);
    end;

    procedure SetDefaultHttpClient()
    var
        DefaultHttpClient: Codeunit "Http Client";
    begin
        SetHttpClient(DefaultHttpClient);
    end;

    procedure SetDefaultResponseMessage()
    var
        DefaultResponseMessage: Codeunit "Http Response Message";
    begin
        SetResponseMessage(DefaultResponseMessage);
    end;

    procedure SetHttpClient(NewHttpClient: Interface IHttpClient)
    begin
        _httpClient := NewHttpClient;
        _httpClientIsSet := true;
    end;

    procedure SetResponseMessage(NewHttpResponseMessage: Interface IHttpResponseMessage)
    begin
        _httpResponseMessage := NewHttpResponseMessage;
        _httpResponseMessageIsSet := true;
    end;

}