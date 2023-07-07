codeunit 50151 "Http Client" implements IHttpClient
{
    procedure Send(RequestMessage: HttpRequestMessage; var ResponseMessage: Interface IHttpResponseMessage): Boolean
    var
        MyHttpClient: HttpClient;
        MyHttpResponseMessage: HttpResponseMessage;
        HttpResponseMessageCodeunit: Codeunit "Http Response Message";
    begin
        if MyHttpClient.Send(RequestMessage, MyHttpResponseMessage) then;
        HttpResponseMessageCodeunit.Init(MyHttpResponseMessage);
        ResponseMessage := HttpResponseMessageCodeunit;
    end;
}