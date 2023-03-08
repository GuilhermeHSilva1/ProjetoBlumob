unit UEntity.Tipo;

interface

type
  TTipo = class
    private
      FTipo: String;
      FValorPassagem : Double;
    function GetValorPassagem: Double;
    public
      property ValorPassagem: Double read GetValorPassagem;
      Constructor Create(aValor: Double; aTipo: String);
  end;

implementation

{ TTipo }

constructor TTipo.Create(aValor: Double; aTipo: String);
begin
  FValorPassagem := aValor;
  FTipo := aTipo;
end;

function TTipo.GetValorPassagem: Double;
begin
  Result := FValorPassagem;
end;

end.
