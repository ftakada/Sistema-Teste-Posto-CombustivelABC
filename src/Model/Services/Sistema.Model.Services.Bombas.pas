unit Sistema.Model.Services.Bombas;

interface

uses
  Data.DB,
  Sistema.Model.Services.Interfaces,
  Sistema.Model.Entities.Bombas,
  Sistema.Model.DAO.Interfaces,
  Sistema.Model.DAO.Factory,
  System.SysUtils;

type
  TModelServicesBombas = class(TInterfacedObject, iModelServicesEntities<TBombas>)
  private
    FBombas: iModelDAO<TBombas>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelServicesEntities<TBombas>;
    function NewObject: TBombas;
    function Current: TBombas;
    function UpdateObject: iModelServicesEntities<TBombas>;
    function Insert: iModelServicesEntities<TBombas>;
    function Update: iModelServicesEntities<TBombas>;
    function Delete: iModelServicesEntities<TBombas>;
    function Listar : iModelServicesEntities<TBombas>;
    function ListarPorId(AId: Integer): iModelServicesEntities<TBombas>;
    function ListarPorWhere(AWhere: string): iModelServicesEntities<TBombas>;
    function DataSource(ADatasource: TDataSource): iModelServicesEntities<TBombas>;
    function OnChange(AOnChange: TProc<TDataSource>): iModelServicesEntities<TBombas>;
  end;


implementation

{ TModelServicesBombas }

constructor TModelServicesBombas.Create;
begin
  FBombas := TModelDAOFactory<TBombas>.New.DAO;
end;

function TModelServicesBombas.Current: TBombas;
begin
  Result := FBombas.Current;
end;

function TModelServicesBombas.DataSource(ADatasource: TDataSource): iModelServicesEntities<TBombas>;
begin
  Result := Self;
  FBombas.DataSource(ADatasource);
end;

function TModelServicesBombas.Delete: iModelServicesEntities<TBombas>;
begin
  Result := Self;
  FBombas.Delete;
end;

destructor TModelServicesBombas.Destroy;
begin

  inherited;
end;

function TModelServicesBombas.Insert: iModelServicesEntities<TBombas>;
begin
  Result := Self;
  FBombas.Insert;
end;

function TModelServicesBombas.Listar: iModelServicesEntities<TBombas>;
begin
  Result := Self;
  FBombas.Listar;
end;

function TModelServicesBombas.ListarPorId(AId: Integer): iModelServicesEntities<TBombas>;
begin
  Result := Self;
  FBombas.ListarPorId(AId);
end;

function TModelServicesBombas.ListarPorWhere(AWhere: string): iModelServicesEntities<TBombas>;
begin
  Result := Self;
  FBombas.ListarPorWhere(AWhere);
end;

class function TModelServicesBombas.New: iModelServicesEntities<TBombas>;
begin
  Result := Self.Create;
end;

function TModelServicesBombas.NewObject: TBombas;
begin
  Result := FBombas.NewObject;
end;

function TModelServicesBombas.OnChange(AOnChange: TProc<TDataSource>): iModelServicesEntities<TBombas>;
begin
  Result := Self;
  FBombas.OnChange(AOnChange);
end;

function TModelServicesBombas.Update: iModelServicesEntities<TBombas>;
begin
  Result := Self;
  FBombas.Update;;
end;

function TModelServicesBombas.UpdateObject: iModelServicesEntities<TBombas>;
begin
  Result := Self;
  FBombas.UpdateObject;
end;

end.
