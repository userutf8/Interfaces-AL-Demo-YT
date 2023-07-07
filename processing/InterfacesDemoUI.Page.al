page 50151 "Interfaces Demo UI"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Url; UrlText)
                {
                    ApplicationArea = All;
                    Caption = 'URL';
                    ExtendedDatatype = URL;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Normal request")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    InterfacesDemoProcessing: Codeunit "Interfaces Demo Processing";
                    HttpClientFactory: Codeunit "Http Client Factory";
                begin
                    InterfacesDemoProcessing.Init(HttpClientFactory);
                    InterfacesDemoProcessing.SendRequest(UrlText, 'GET');
                end;
            }
            action("Mock request")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    MockHttpClient: Codeunit "Mock Http Client";
                    MockHttpResponseMessage: Codeunit "Mock Http Response Message";
                    InterfacesDemoProcessing: Codeunit "Interfaces Demo Processing";
                    HttpClientFactory: Codeunit "Http Client Factory";
                begin
                    HttpClientFactory.SetHttpClient(MockHttpClient);
                    HttpClientFactory.SetResponseMessage(MockHttpResponseMessage);

                    InterfacesDemoProcessing.Init(HttpClientFactory);
                    InterfacesDemoProcessing.SendRequest(UrlText, 'GET');
                end;
            }
        }

        area(Promoted)
        {
            actionref(ref1; "Normal request")
            {

            }
            actionref(Ref2; "Mock request")
            {

            }
        }
    }

    trigger OnInit()
    begin
        UrlText := 'https://www.google.com/search?q=real+days+tech+dayz';
    end;

    var
        UrlText: Text;
}