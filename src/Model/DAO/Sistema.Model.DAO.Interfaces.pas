unit Sistema.Model.DAO.Interfaces;

interface
uses
  Data.DB,
  FireDAC.Comp.Client,
  System.SysUtils;

type

  iModelDAO<T> = interface
  ['{7227B75E-7EEA-4723-9168-7A7BD954D913}']
    function NewObject: T;
    function Current: T;
    function UpdateObject: iModelDAO<T>;
    function Insert: iModelDAO<T>;
    function Update: iModelDAO<T>;
    function Delete: iModelDAO<T>;
    function Listar : iModelDAO<T>;
    function ListarPorId(AId: Integer): iModelDAO<T>;
    function ListarPorWhere(AWhere: string): iModelDAO<T>;
    function DataSource(ADatasource: TDataSource): iModelDAO<T>;
    function OnChange(AOnChange: TProc<TDataSource>): iModelDAO<T>;
  end;

  iModelDAOFactory<T> = interface
  ['{9937EB26-A759-4272-9D36-4DC378751BDA}']
    function DAO: iModelDAO<T>;
  end;

  implementation

end.
