unit Sistema.Model.Services.Calculos;

interface

uses
  Sistema.Model.Services.Interfaces;

type
  TModelServicesCalculos = class(TInterfacedObject, iModelServicesCalculos)
  private

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelServicesCalculos;
    function CalcularImposto(AValorAbastecido: Currency; APorcentagemImposto: Currency): Currency;
  end;


implementation

function TModelServicesCalculos.CalcularImposto(AValorAbastecido, APorcentagemImposto: Currency): Currency;
var
  LVarlorImpostoCalculado: Currency;
begin
  LVarlorImpostoCalculado := 0.00;
  if AValorAbastecido > 0 then
     LVarlorImpostoCalculado := AValorAbastecido * (APorcentagemImposto / 100);
  Result := LVarlorImpostoCalculado;
end;

constructor TModelServicesCalculos.Create;
begin

end;

destructor TModelServicesCalculos.Destroy;
begin

  inherited;
end;

class function TModelServicesCalculos.New: iModelServicesCalculos;
begin
  Result := Self.Create;
end;

end.
