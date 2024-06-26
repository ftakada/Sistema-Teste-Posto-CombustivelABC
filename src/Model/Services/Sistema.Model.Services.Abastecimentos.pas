unit Sistema.Model.Services.Abastecimentos;

interface

uses
  Data.DB,
  Sistema.Model.Services.Interfaces,
  Sistema.Model.Entities.Abastecimentos,
  Sistema.Model.DAO.Interfaces,
  Sistema.Model.DAO.Factory, 
  Sistema.Sitema.Model.Exception.MinhaExcecao,
  System.SysUtils, Sistema.Model.Services.Calculos;

type
  TModelServicesAbastecimentos = class(TInterfacedObject, iModelServicesEntities<TAbastecimentos>)
  private
    FAbastecimentos: iModelDAO<TAbastecimentos>;
    procedure ValidarDados;
    procedure ProcessarImposto;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelServicesEntities<TAbastecimentos>;
    function NewObject: TAbastecimentos;
    function Current: TAbastecimentos;
    function UpdateObject: iModelServicesEntities<TAbastecimentos>;
    function Insert: iModelServicesEntities<TAbastecimentos>;
    function Update: iModelServicesEntities<TAbastecimentos>;
    function Delete: iModelServicesEntities<TAbastecimentos>;
    function Listar : iModelServicesEntities<TAbastecimentos>;
    function ListarPorId(AId: Integer): iModelServicesEntities<TAbastecimentos>;
    function ListarPorWhere(AWhere: string): iModelServicesEntities<TAbastecimentos>;
    function DataSource(ADatasource: TDataSource): iModelServicesEntities<TAbastecimentos>;
    function OnChange(AOnChange: TProc<TDataSource>): iModelServicesEntities<TAbastecimentos>;

  end;


implementation


{ TModelServicesAbastecimentos }

constructor TModelServicesAbastecimentos.Create;
begin
  FAbastecimentos := TModelDAOFactory<TAbastecimentos>.New.DAO;
end;

function TModelServicesAbastecimentos.Current: TAbastecimentos;
begin
  Result := FAbastecimentos.Current;
end;

function TModelServicesAbastecimentos.DataSource(ADatasource: TDataSource): iModelServicesEntities<TAbastecimentos>;
begin
  Result := Self;
  FAbastecimentos.DataSource(ADatasource);
end;

function TModelServicesAbastecimentos.Delete: iModelServicesEntities<TAbastecimentos>;
begin
  Result := Self;
  FAbastecimentos.Delete;
end;

destructor TModelServicesAbastecimentos.Destroy;
begin

  inherited;
end;

function TModelServicesAbastecimentos.Insert: iModelServicesEntities<TAbastecimentos>;
begin
  Result := Self;
  ValidarDados;
  ProcessarImposto;
  FAbastecimentos.Insert;
end;

function TModelServicesAbastecimentos.Listar: iModelServicesEntities<TAbastecimentos>;
begin
  Result := Self;
  FAbastecimentos.Listar;
end;

function TModelServicesAbastecimentos.ListarPorId(AId: Integer): iModelServicesEntities<TAbastecimentos>;
begin
  Result := Self;
  FAbastecimentos.ListarPorId(AId);
end;

function TModelServicesAbastecimentos.ListarPorWhere(AWhere: string): iModelServicesEntities<TAbastecimentos>;
begin
  Result := Self;
  FAbastecimentos.ListarPorWhere(AWhere);
end;

class function TModelServicesAbastecimentos.New: iModelServicesEntities<TAbastecimentos>;
begin
  Result := Self.Create;
end;

function TModelServicesAbastecimentos.NewObject: TAbastecimentos;
begin
  Result := FAbastecimentos.NewObject;
end;


function TModelServicesAbastecimentos.OnChange(AOnChange: TProc<TDataSource>): iModelServicesEntities<TAbastecimentos>;
begin
  Result := Self;
  FAbastecimentos.OnChange(AOnChange);
end;

procedure TModelServicesAbastecimentos.ProcessarImposto;
begin
  Current.Valor_Imposto := TModelServicesCalculos.New.CalcularImposto(Current.Valor_Abastecido, Current.Percentual_Imposto);
end;

function TModelServicesAbastecimentos.Update: iModelServicesEntities<TAbastecimentos>;
begin
  Result := Self;
  ValidarDados;
  ProcessarImposto;
  FAbastecimentos.Update;;
end;

function TModelServicesAbastecimentos.UpdateObject: iModelServicesEntities<TAbastecimentos>;
begin
  Result := Self;
  FAbastecimentos.UpdateObject;
end;

procedure TModelServicesAbastecimentos.ValidarDados;
begin
  if Current.Quantidade_Litros <= 0 then
    raise EMinhaExcecao.Create('A quantidade de litros n�o pode ser menor ou igual a 0(zero)!');

  if Current.Valor_Abastecido <= 0 then
    raise EMinhaExcecao.Create('O valor abastecido n�o pode ser menor ou igual a 0(zero)!');
end;

end.
