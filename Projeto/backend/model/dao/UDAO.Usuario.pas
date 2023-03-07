unit UDAO.Usuario;

interface

uses
  UDAO.Base;

type
  TDAOUsuario = class(TDAOBase)
    public
      constructor Create;
  end;

implementation

{ TDAOUsuario }

constructor TDAOUsuario.Create;
begin
  FTabela := 'usuario';
  FCondicao := 'id';
end;

end.
