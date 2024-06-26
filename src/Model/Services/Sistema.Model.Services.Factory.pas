unit Sistema.Model.Services.Factory;

interface

uses
  Sistema.Model.Services.Interfaces,
  Sistema.Model.Entities.Tanques,
  Sistema.Model.Entities.Bombas,
  Sistema.Model.Entities.Abastecimentos,
  Sistema.Model.Services.Tanques,
  Sistema.Model.Services.Abastecimentos,
  Sistema.Model.Services.Bombas;
type
  TModelServicesFactory = class(TInterfacedObject, iModelServicesFactory)
  private
    FTanques: iModelServicesEntities<TTanques>;
    FBombas:iModelServicesEntities<TBombas>;
    FAbastecimentos: iModelServicesEntities<TAbastecimentos>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelServicesFactory;
    function Tanques: iModelServicesEntities<TTanques>;
    function Bombas:iModelServicesEntities<TBombas>;
    function Abastecimentos: iModelServicesEntities<TAbastecimentos>;
  end;
implementation

{ TModelServicesFactory }

constructor TModelServicesFactory.Create;
begin

end;

destructor TModelServicesFactory.Destroy;
begin

  inherited;
end;

class function TModelServicesFactory.New: iModelServicesFactory;
begin
  Result := Self.Create;
end;

function TModelServicesFactory.Tanques: iModelServicesEntities<TTanques>;
begin
  if not Assigned(FTanques) then
    FTanques := TModelServicesTanques.New;
  Result := FTanques;
end;

function TModelServicesFactory.Abastecimentos: iModelServicesEntities<TAbastecimentos>;
begin
  if not Assigned(FAbastecimentos) then
    FAbastecimentos := TModelServicesAbastecimentos.New;
  Result := FAbastecimentos;
end;

function TModelServicesFactory.Bombas: iModelServicesEntities<TBombas>;
begin
  if not Assigned(FBombas) then
    FBombas := TModelServicesBombas.New;
  Result := FBombas;
end;

end.
