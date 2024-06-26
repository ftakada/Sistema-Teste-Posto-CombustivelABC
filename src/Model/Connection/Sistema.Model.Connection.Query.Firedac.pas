unit Sistema.Model.Connection.Query.Firedac;

interface

uses
  FireDAC.Comp.Client,
  System.SysUtils,
  System.IniFiles,
  FireDAC.Phys.FB,
  FireDAC.Stan.Def,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Data.DB,
  Sistema.Model.DAO.Interfaces,
  Sistema.Model.Connection.Interfaces;

type

  TModelQueryFiredac = class(TInterfacedObject, iModelQuery)
  private
    FConnectionFiredac: iModelConnection;
    FFDQuery: TFDQuery;
  public
    constructor Create(AConnectionFiredac: iModelConnection);
    destructor Destroy; override;
    class function New(AConnectionFiredac: iModelConnection): iModelQuery;
    function ExecutaSQL(ASQL : string) : iModelQuery;
    function Query: TFDQuery;
    function SQL(ASQL: string): iModelQuery;
    function Open: iModelQuery;
    function Close: iModelQuery;
    function Cancel: iModelQuery;
  end;

implementation

{ TModelQueryFiredac }

function TModelQueryFiredac.Cancel: iModelQuery;
begin
  Result := Self;
  FFDQuery.Cancel;
end;

function TModelQueryFiredac.Close: iModelQuery;
begin
  Result := Self;
  FFDQuery.Close;
end;

constructor TModelQueryFiredac.Create(AConnectionFiredac: iModelConnection);
begin
  FConnectionFiredac := AConnectionFiredac;
  FFDQuery := TFDQuery.Create(nil);
  FFDQuery.Connection := FConnectionFiredac.GetConnection;;
end;

destructor TModelQueryFiredac.Destroy;
begin
  inherited;
  if Assigned(FFDQuery) then
    FFDQuery.Disposeof;
end;

function TModelQueryFiredac.ExecutaSQL(ASQL: string): iModelQuery;
var
  LFDQuery : TFDQuery;
begin
  Result := Self;
  LFDQuery := TFDQuery.Create(nil);

  try
    LFDQuery.Connection := TFDConnection(FConnectionFiredac.GetConnection);
    LFDQuery.ExecSQL(ASQL);
  finally
    LFDQuery.DisposeOf;
  end;
end;

class function TModelQueryFiredac.New(AConnectionFiredac: iModelConnection): iModelQuery;
begin
  Result := Self.Create(AConnectionFiredac);
end;

function TModelQueryFiredac.Open: iModelQuery;
begin
  Result := Self;
  FFDQuery.Open;
end;

function TModelQueryFiredac.Query: TFDQuery;
begin
  Result := FFDQuery;
end;

function TModelQueryFiredac.SQL(ASQL: string): iModelQuery;
begin
  Result := Self;
  FFDQuery.SQL.Text := ASQL;
end;

end.

