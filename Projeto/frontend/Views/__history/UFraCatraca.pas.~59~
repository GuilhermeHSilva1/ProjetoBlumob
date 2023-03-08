unit UFraCatraca;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.StdCtrls, FMX.Controls.Presentation, UService.Cartao, UEntity.Cartao;

type
  TfraCatraca = class(TForm)
    lytPrincipal: TLayout;
    lytBluMopLogo: TLayout;
    imgBlumopLogo: TImage;
    RectPrincipal: TRectangle;
    rectCatraca: TRectangle;
    lytBotoes: TLayout;
    lblOutroCartao: TLabel;
    lytLogoOnibus: TLayout;
    imgOnibus: TImage;
    Label1: TLabel;
    lblSaldo: TLabel;
    procedure FormShow(Sender: TObject);
    procedure rectCatracaClick(Sender: TObject);
  private
    { Private declarations }
    FServico: TServiceCartao;
    procedure UsarCatraca;
  public
    { Public declarations }
  end;

var
  fraCatraca: TfraCatraca;

implementation

{$R *.fmx}

procedure TfraCatraca.FormShow(Sender: TObject);
begin
  FServico := TServiceCartao.Create;
  lblSaldo.Text := 'Saldo Atual: R$:' + FormatFloat('0.00', FServico.Cartao.Saldo);
end;

procedure TfraCatraca.rectCatracaClick(Sender: TObject);
begin
  Self.UsarCatraca;
end;

procedure TfraCatraca.UsarCatraca;
begin
    FServico.UsarCatraca;
    lblSaldo.Text := 'Saldo Atual: R$:' + FormatFloat('0.00', FServico.Cartao.Saldo);
end;

end.
