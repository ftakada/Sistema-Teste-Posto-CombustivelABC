unit Sistema.Model.DAO.Factory;

interface
uses
  Sistema.Model.DAO.Interfaces,
  Sistema.Model.DAO.SQL;
type

  TModelDAOFactory<T: class, constructor> = class(TInterfacedObject, iModelDAOFactory<T>)
  private
    FDAO: IModelDAO<T>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelDAOFactory<T>;
    function DAO: iModelDAO<T>;
  end;

implementation

{ TModelDAOFactory<T> }
constructor TModelDAOFactory<T>.Create;
begin
  FDAO := TModelDAOSQL<T>.New;
end;

function TModelDAOFactory<T>.DAO: iModelDAO<T>;
begin
  Result := FDAO;
end;

destructor TModelDAOFactory<T>.Destroy;
begin
  inherited;
end;

class function TModelDAOFactory<T>.New: iModelDAOFactory<T>;
begin
  Result := Self.Create;
end;

end.
