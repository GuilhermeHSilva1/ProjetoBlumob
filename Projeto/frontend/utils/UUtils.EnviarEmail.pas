unit UUtils.EnviarEmail;

interface

type
  TUtilEmail = class
    private

    public
      class procedure EnviarEmail(aDestinatario, aAssunto, aMensagem: String);
  end;

implementation

uses
  IdSMTP,
  IdMessage,
  IdSSLOpenSSL,
  IdExplicitTLSClientServerBase,
  UUtils.Constants,
  System.SysUtils;

{ TUtilEmail }

class procedure TUtilEmail.EnviarEmail(aDestinatario, aAssunto, aMensagem: String);
var
  xSMTP: TIdSMTP;
  xMessage: TIdMessage;
  xSocketSSL : TIdSSLIOHandlerSocketOpenSSL;
begin

  try
    xSMTP := TIdSMTP.Create;
    xMessage := TIdMessage.Create;
    xSocketSSL := TIdSSLIOHandlerSocketOpenSSL.Create;

    xSocketSSL.SSLOptions.Mode := sslmClient;
    xSocketSSL.SSLOptions.Method := sslvTLSv1_2;

    xSocketSSL.Host := SMTP;
    xSocketSSL.Port := PORTA;

    xSMTP.IOHandler := xSocketSSL;
    xSMTP.Host := SMTP;
    xSMTP.Port := PORTA;
    xSMTP.AuthType := satDefault;
    xSMTP.Username := EMAIL;
    xSMTP.Password := PASSWORD;
    xSMTP.UseTLS := utUseExplicitTLS;

    xMessage.From.Address := aDestinatario;
    xMessage.Recipients.Add;
    xMessage.Recipients.Items[0].Address := aDestinatario;
    xMessage.Subject := aAssunto;
    xMessage.Body.Add(aMensagem);

    try
      xSMTP.Connect;
      xSMTP.Send(xMessage);
    except on E: Exception do
      raise Exception.Create('Erro ao enviar email: ' + E.Message);
    end;

  finally
    FreeAndNil(xSMTP);
    FreeAndNil(xMessage);
    FreeAndNil(xSocketSSL);
  end;
end;

end.
