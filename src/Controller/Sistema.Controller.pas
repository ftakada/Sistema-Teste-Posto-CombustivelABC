unit Sistema.Controller;

interface

uses
  Sistema.Model.Services.Interfaces,
  Sistema.Controller.Interfaces, Sistema.Model.Services.Factory;


type

  TController = class(TInterfacedObject,iController)
    private
      FServices : iModelServicesFactory;
    public
    constructor Create;
    destructor Destroy; override;
    class function New : iController;
    function Services : iModelServicesFactory;
  end;

implementation



{ TController }

constructor TController.Create;
begin

end;

destructor TController.Destroy;
begin

  inherited;
end;

class function TController.New: iController;
begin
  Result := Self.Create;
end;

function TController.Services: iModelServicesFactory;
begin
  if not Assigned(FServices) then
    FServices := TModelServicesFactory.New;
  Result := FServices;
end;

end.
