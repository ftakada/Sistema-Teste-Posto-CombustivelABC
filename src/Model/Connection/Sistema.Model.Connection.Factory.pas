unit Sistema.Model.Connection.Factory;

interface

uses
  Sistema.Model.Connection.Interfaces,
  Sistema.Model.Connection.FireDac,
  Sistema.Model.Connection.Query.Firedac;

type
  TModelConnectionFactory = class(TInterfacedObject,iModelConnectionFactory)
    private
      FConnection : iModelConnection;
      FQuery: iModelQuery;
    public
    constructor Create;
    destructor Destroy; override;
    class function New : iModelConnectionFactory;
    function Connection : iModelConnection;
    function GetQuery: iModelQuery;
  end;
implementation

{ TModelConnectionFactory }

function TModelConnectionFactory.Connection: iModelConnection;
begin
  Result := FConnection;
end;

constructor TModelConnectionFactory.Create;
begin
  FConnection := TModelConnectionFireDac.New;
  FQuery := TModelQueryFiredac.New(FConnection);
  FConnection.Connect;
end;

destructor TModelConnectionFactory.Destroy;
begin
  inherited;
end;

function TModelConnectionFactory.GetQuery: iModelQuery;
begin
  Result := FQuery;
end;

class function TModelConnectionFactory.New: iModelConnectionFactory;
begin
  Result := Self.Create;
end;

end.
