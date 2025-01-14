unit UFraLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit;

type
  Tfralogin = class(TForm)
    lytPrincipal: TLayout;
    lytBluMopLogo: TLayout;
    imgBlumopLogo: TImage;
    RectPrincipal: TRectangle;
    lblSaldo: TLabel;
    rectAutenticar: TRectangle;
    lytBotoes: TLayout;
    lytLogoOnibus: TLayout;
    imgOnibus: TImage;
    RectConsulta: TRectangle;
    EdtNumero: TEdit;
    Label1: TLabel;
    procedure rectAutenticarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Autenticar;
  public
    { Public declarations }
  end;

var
  fralogin: Tfralogin;

implementation

{$R *.fmx}

uses
  UFraCatraca, UService.Cartao;

procedure Tfralogin.Autenticar;
var
  xNumero: String;
  xServico: TServiceCartao;
begin
    if EdtNumero.Text = EmptyStr then
      raise Exception.Create('Informe o numero do cart�o');

    xNumero := EdtNumero.Text;
  try
      xServico := TServiceCartao.ObterInstancia;
      xServico.RegistrarLog('Cartao criado');
      xServico.ObterRegistro(xNumero);

    if not Assigned(fraCatraca) then
      fraCatraca := TfraCatraca.Create(application);

    fraCatraca.Show();
    Application.MainForm := fraCatraca;
  except
    On E: exception do
      raise Exception.Create('Cartao n�o encontrado: ' + E.Message);
  end;
end;

procedure Tfralogin.rectAutenticarClick(Sender: TObject);
begin
  Self.Autenticar;
end;

end.
