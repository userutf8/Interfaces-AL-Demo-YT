interface IHttpClient
{
    procedure Send(RequestMessage: HttpRequestMessage; var ResponseMessage: Interface IHttpResponseMessage): Boolean;
}