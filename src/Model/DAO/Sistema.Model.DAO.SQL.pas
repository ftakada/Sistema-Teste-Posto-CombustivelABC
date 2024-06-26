unit Sistema.Model.DAO.SQL;

interface
uses
  Data.DB,
  System.SysUtils,
  System.Generics.Collections,
  System.Classes,
  FireDAC.Comp.Client,
  Sistema.Model.Connection.Interfaces,
  Sistema.Model.DAO.Interfaces,
  Sistema.Model.Connection.Factory,
  Sistema.Model.Util.SQLGerador;
type

  TModelDAOSQL<T: class, constructor> = class(TInterfacedObject, iModelDAO<T>)
  private
    FObject: T;
    FConnectionFactory: iModelConnectionFactory;
    FDataSource: TDataSource;
    FOnChange: TProc<TDataSource>; // M�todo an�nimo para o que executar algum evento na na tela
    procedure DataSourceChanged(Sender: TObject; Field: TField);
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelDAO<T>;
    function NewObject: T;
    function Current: T;
    function UpdateObject: iModelDAO<T>;
    function Insert: iModelDAO<T>;
    function Update: iModelDAO<T>;
    function Delete: iModelDAO<T>;
    function Listar: iModelDAO<T>;
    function ListarPorId(AId: Integer): iModelDAO<T>;
    function ListarPorWhere(AWhere: string): iModelDAO<T>;
    function DataSource(ADatasource: TDataSource): iModelDAO<T>;
    function OnChange(AOnChange: TProc<TDataSource>): iModelDAO<T>;
  end;

  implementation

constructor TModelDAOSQL<T>.Create;
begin
  FObject := T.Create;
  FConnectionFactory := TModelConnectionFactory.New;
end;

function TModelDAOSQL<T>.Current: T;
begin
  Result := FObject;
end;

function TModelDAOSQL<T>.DataSource(ADatasource: TDataSource): iModelDAO<T>;
begin
  Result := Self;
  if FDataSource <> nil then
    FDataSource.OnDataChange := nil;
  FDataSource := ADatasource;

  if FDataSource <> nil then
    FDataSource.OnDataChange := DataSourceChanged;

  FDataSource.DataSet := FConnectionFactory.GetQuery.Query;
end;

procedure TModelDAOSQL<T>.DataSourceChanged(Sender: TObject; Field: TField);
begin
  if (FDataSource <> nil) and (FDataSource.DataSet <> nil) and (not FDataSource.DataSet.IsEmpty) then
  begin
    UpdateObject;
  end;

  if Assigned(FOnChange) then
    FOnChange(FDataSource);
end;

function TModelDAOSQL<T>.Delete: iModelDAO<T>;
begin
  Result := Self;
  FConnectionFactory
    .GetQuery
  .ExecutaSQL(TSQLGerador.GerarDeleteSQL(FObject));
end;

destructor TModelDAOSQL<T>.Destroy;
begin
  if Assigned(FObject) then
    FObject.Free;
  inherited;
end;

function TModelDAOSQL<T>.ListarPorId(AId: Integer): iModelDAO<T>;
begin
  Result := Self;
  FConnectionFactory
    .GetQuery
    .SQL(TSQLGerador.GerarSelectSQL(FObject) + ' where ID = ' + AId.ToString)
  .Open;
  UpdateObject();
end;

function TModelDAOSQL<T>.Listar: iModelDAO<T>;
begin
  Result := Self;
  FConnectionFactory
    .GetQuery
    .SQL(TSQLGerador.GerarSelectSQL(FObject) +' order by 1')
  .Open;
end;

function TModelDAOSQL<T>.ListarPorWhere(AWhere: string): iModelDAO<T>;
begin
  Result := Self;
  FConnectionFactory
    .GetQuery
    .SQL(TSQLGerador.GerarSelectSQL(FObject) + ' where ' + aWhere)
  .Open;
  UpdateObject();
end;

function TModelDAOSQL<T>.Insert: iModelDAO<T>;
begin
  Result := Self;
  FConnectionFactory
    .GetQuery
  .ExecutaSQL(TSQLGerador.GerarInsertSQL(FObject));

  if Assigned(FObject) then
    FObject.free;
  FObject := T.Create;
end;

class function TModelDAOSQL<T>.New : iModelDAO<T>;
begin
  Result := Self.Create;
end;

function TModelDAOSQL<T>.NewObject: T;
begin
  if Assigned(FObject) then
    FObject.Free;
  FObject := T.Create;
  Result := FObject;
end;

function TModelDAOSQL<T>.OnChange(AOnChange: TProc<TDataSource>): iModelDAO<T>;
begin
  Result := Self;
  FOnChange := AOnChange;
end;

function TModelDAOSQL<T>.UpdateObject: iModelDAO<T>;
begin
  Result := Self;
  if (FConnectionFactory.GetQuery.Query.Active) then
  begin
    if Assigned(FObject) and  not (FConnectionFactory.GetQuery.Query.IsEmpty) then
      TSQLGerador.PreencherObjeto(FConnectionFactory.GetQuery.Query, FObject);
  end;
end;

function TModelDAOSQL<T>.Update: iModelDAO<T>;
begin
  Result := Self;
  FConnectionFactory
    .GetQuery
  .ExecutaSQL(TSQLGerador.GerarUpdateSQL(FObject));
end;

end.
