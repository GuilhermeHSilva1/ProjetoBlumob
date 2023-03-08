unit UDAO.Intf;

interface

uses
  System.JSON;

type
  IDAO = interface
    function ProcurarPorID(const aIdentificador: Integer): TJSONObject;
    procedure AtualizarTabela(const aIdentificador: Integer; aValor: Double);
  end;

implementation

end.
