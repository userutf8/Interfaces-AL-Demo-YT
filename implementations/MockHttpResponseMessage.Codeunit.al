codeunit 50154 "Mock Http Response Message" implements IHttpResponseMessage
{
    var
        _isBlockedByEnvironment: Boolean;
        _isSuccessStatusCode: Boolean;
        _httpStatusCode: Integer;
        _reasonPhrase: Text;
        _responseBody: Text;

    procedure Init(NewIsBlockedByEnvironment: Boolean; NewIsSuccessStatusCode: Boolean; NewHttpStatusCode: Integer;
                   NewReasonPhrase: Text; NewResponseBody: Text)
    begin
        _isBlockedByEnvironment := NewIsBlockedByEnvironment;
        _isSuccessStatusCode := NewIsSuccessStatusCode;
        _httpStatusCode := NewHttpStatusCode;
        _reasonPhrase := NewReasonPhrase;
        _responseBody := NewResponseBody;
    end;

    procedure IsBlockedByEnvironment(): Boolean
    begin
        exit(_isBlockedByEnvironment);
    end;

    procedure IsSuccessStatusCode(): Boolean
    begin
        exit(_isSuccessStatusCode);
    end;

    procedure HttpStatusCode(): Integer
    begin
        exit(_httpStatusCode);
    end;

    procedure ReasonPhrase(): Text
    begin
        exit(_reasonPhrase);
    end;

    procedure GetResponseBody(): JsonObject
    var
        ResponseJson: JsonObject;
    begin
        ResponseJson.ReadFrom(_responseBody);
        exit(ResponseJson);
    end;

    procedure GetResponseBodyAsText(): Text
    begin
        exit(_responseBody);
    end;
}