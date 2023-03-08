unit UService.Base;

interface

uses
  REST.Client,
  REST.Types,
  SYstem.JSON;

type
  TServiceBase = class
    protected
      FRESTClient: TRESTClient;
      FRESTRequest: TRESTRequest;
      FRESTResponse: TRESTResponse;

      procedure ObterRegistro(const aId: String); virtual; abstract;

      constructor Create; virtual;
    public
      destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils;

{ TServiceBase }

constructor TServiceBase.Create;
begin
  FRESTClient := TRESTClient.Create(nil);
  FRESTRequest := TRESTRequest.Create(nil);
  FRESTResponse := TRESTResponse.Create(nil);

  FRESTRequest.Accept := 'application/json';
  FRESTRequest.Client := FRESTClient;
  FRESTRequest.Response := FRESTResponse;
  FRESTRequest.Params.Clear;
end;

destructor TServiceBase.Destroy;
begin
  FreeAndNil(FRESTClient);
  FreeAndNil(FRESTRequest);
  FreeAndNil(FRESTResponse);

  inherited;
end;

end.