program BluMob_APP;

uses
  System.StartUpCopy,
  FMX.Forms,
  UFraLogin in 'Views\UFraLogin.pas' {fralogin},
  UFraCatraca in 'Views\UFraCatraca.pas' {fraCatraca},
  UEntity.Cartao in '..\backend\model\entity\UEntity.Cartao.pas',
  UEntity.Tipo in '..\backend\model\entity\UEntity.Tipo.pas',
  UEntity.Usuario in '..\backend\model\entity\UEntity.Usuario.pas',
  UService.Cartao in 'services\UService.Cartao.pas',
  UService.Base in 'services\UService.Base.pas',
  UUtils.Constants in 'utils\UUtils.Constants.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfralogin, fralogin);
  Application.Run;
end.
