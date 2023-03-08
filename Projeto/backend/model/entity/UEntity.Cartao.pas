unit UEntity.Cartao;

interface

uses
  System.JSON,
  UEntity.Usuario,
  UEntity.Tipo;

type
  TCartao = class
    private
      FID: Integer;
      FNumCartao: Integer;
      FSaldo: Double;
      FTipo: TTipo;
      FUsuario: TUsuario;
      FJSON: TJSONObject;
    function GetSaldo: Double;
    procedure SetSaldo(const Value: Double);

    public
      constructor Create(aJSON: String); overload;
      destructor Destroy;

      property Saldo: Double read GetSaldo write SetSaldo;
  end;

implementation

uses
  System.SysUtils, FireDAC.comp.Client, DataSet.Serialize;

{ TCartao }

constructor TCartao.Create(aJSON: String);
var
  xMemTable: TFDMemTable;
begin
  xMemTable := TFDMemTable.Create(nil);
  try
    xMemTable.LoadFromJSON(aJSON);

    FSaldo := xMemTable.FieldByName('saldo').AsFloat;
    FNumCartao := xMemTable.FieldByName('numcartao').AsInteger;
  finally
    FreeAndNil(xMemTable);
  end;
end;

destructor TCartao.Destroy;
begin
  FreeAndNil(FTipo);
  FreeAndNil(FUsuario);
  FreeAndNil(FJSON);
end;

function TCartao.GetSaldo: Double;
begin
  Result := FSaldo;
end;

procedure TCartao.SetSaldo(const Value: Double);
begin
  FSaldo := Value;
end;

end.
