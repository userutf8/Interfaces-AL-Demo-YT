codeunit 50152 "Http Response Message" implements IHttpResponseMessage
{
    var
        _httpResponseMessage: HttpResponseMessage;

    procedure Init(NewHttpResponseMessage: HttpResponseMessage)
    begin
        _httpResponseMessage := NewHttpResponseMessage;
    end;

    procedure IsBlockedByEnvironment(): Boolean
    begin
        exit(_httpResponseMessage.IsBlockedByEnvironment());
    end;

    procedure IsSuccessStatusCode(): Boolean
    begin
        exit(_httpResponseMessage.IsSuccessStatusCode());
    end;

    procedure HttpStatusCode(): Integer
    begin
        exit(_httpResponseMessage.HttpStatusCode());
    end;

    procedure ReasonPhrase(): Text
    begin
        exit(_httpResponseMessage.ReasonPhrase());
    end;

    procedure GetResponseBody(): JsonObject
    var
        ResponseJson: JsonObject;
        ResponseMessageContent: Text;
    begin
        _httpResponseMessage.Content.ReadAs(ResponseMessageContent);
        ResponseJson.ReadFrom(ResponseMessageContent);
        exit(ResponseJson);
    end;

    procedure GetResponseBodyAsText(): Text
    var
        ResponseMessageContent: Text;
    begin
        _httpResponseMessage.Content.ReadAs(ResponseMessageContent);
        exit(ResponseMessageContent);
    end;
}