unit Sistema.Controller.Interfaces;

interface

uses
  Sistema.Model.Services.Interfaces;


type

  iController = interface
  ['{2FC5C4D3-65E1-4E54-BE2E-99E9319B4FA3}']
    function Services : iModelServicesFactory;
  end;

implementation

end.
