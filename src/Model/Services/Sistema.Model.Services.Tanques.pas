unit Sistema.Model.Services.Tanques;

interface

uses
  Data.DB,
  Sistema.Model.Services.Interfaces,
  Sistema.Model.Entities.Tanques,
  Sistema.Model.DAO.Interfaces,
  Sistema.Model.DAO.Factory,
  System.SysUtils;

type
  TModelServicesTanques = class(TInterfacedObject, iModelServicesEntities<TTanques>)
  private
    FTanques: iModelDAO<TTanques>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelServicesEntities<TTanques>;
    function NewObject: TTanques;
    function Current: TTanques;
    function UpdateObject: iModelServicesEntities<TTanques>;
    function Insert: iModelServicesEntities<TTanques>;
    function Update: iModelServicesEntities<TTanques>;
    function Delete: iModelServicesEntities<TTanques>;
    function Listar : iModelServicesEntities<TTanques>;
    function ListarPorId(AId: Integer): iModelServicesEntities<TTanques>;
    function ListarPorWhere(AWhere: string): iModelServicesEntities<TTanques>;
    function DataSource(ADatasource: TDataSource): iModelServicesEntities<TTanques>;
    function OnChange(AOnChange: TProc<TDataSource>): iModelServicesEntities<TTanques>;
  end;


implementation


{ TModelServicesTanques }

constructor TModelServicesTanques.Create;
begin
  FTanques := TModelDAOFactory<TTanques>.New.DAO;
end;

function TModelServicesTanques.Current: TTanques;
begin
  Result := FTanques.Current;
end;

function TModelServicesTanques.DataSource(ADatasource: TDataSource): iModelServicesEntities<TTanques>;
begin
  Result := Self;
  FTanques.DataSource(ADatasource);
end;

function TModelServicesTanques.Delete: iModelServicesEntities<TTanques>;
begin
  Result := Self;
  FTanques.Delete;
end;

destructor TModelServicesTanques.Destroy;
begin

  inherited;
end;

function TModelServicesTanques.Insert: iModelServicesEntities<TTanques>;
begin
  Result := Self;
  FTanques.Insert;
end;

function TModelServicesTanques.Listar: iModelServicesEntities<TTanques>;
begin
  Result := Self;
  FTanques.Listar;
end;

function TModelServicesTanques.ListarPorId(AId: Integer): iModelServicesEntities<TTanques>;
begin
  Result := Self;
  FTanques.ListarPorId(AId);
end;

function TModelServicesTanques.ListarPorWhere(AWhere: string): iModelServicesEntities<TTanques>;
begin
  Result := Self;
  FTanques.ListarPorWhere(AWhere);
end;

class function TModelServicesTanques.New: iModelServicesEntities<TTanques>;
begin
  Result := Self.Create;
end;

function TModelServicesTanques.NewObject: TTanques;
begin
  Result := FTanques.NewObject;
end;

function TModelServicesTanques.OnChange(AOnChange: TProc<TDataSource>): iModelServicesEntities<TTanques>;
begin
  Result := Self;
  FTanques.OnChange(AOnChange);
end;

function TModelServicesTanques.Update: iModelServicesEntities<TTanques>;
begin
  Result := Self;
  FTanques.Update;;
end;

function TModelServicesTanques.UpdateObject: iModelServicesEntities<TTanques>;
begin
  Result := Self;
  FTanques.UpdateObject;
end;

end.
