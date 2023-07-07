codeunit 50153 "Mock Http Client" implements IHttpClient
{
    procedure Send(RequestMessage: HttpRequestMessage; var ResponseMessage: Interface IHttpResponseMessage): Boolean
    var
        MockHttpResponseMessage: Codeunit "Mock Http Response Message";
    begin
        MockResponseMessage(RequestMessage, MockHttpResponseMessage);
        ResponseMessage := MockHttpResponseMessage;
    end;

    local procedure MockResponseMessage(Requestmessage: HttpRequestMessage; var MockHttpResponseMessage: Codeunit "Mock Http Response Message")
    begin
        // Your parser logic is here
        // ...
        // I just simply send code 200:
        MockHttpResponseMessage.Init(false, true, 200, '', '{"status": "all good!"}');
    end;

}