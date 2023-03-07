unit UDAO.Intf;

interface

uses
  System.JSON;

type
  IDAO = interface
    function ProcurarPorID(const aIdentificador: Integer): TJSONObject;
  end;

implementation

end.
