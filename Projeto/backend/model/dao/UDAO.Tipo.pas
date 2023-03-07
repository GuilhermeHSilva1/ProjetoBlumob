unit UDAO.Tipo;

interface

uses
  UDAO.Base;

type
  TDAOTipo = class(TDAOBase)
    public
      constructor Create;
  end;

implementation

{ TDAOTipo }

constructor TDAOTipo.Create;
begin
  FTabela := 'tipo';
  FCondicao := 'id';
end;

end.
