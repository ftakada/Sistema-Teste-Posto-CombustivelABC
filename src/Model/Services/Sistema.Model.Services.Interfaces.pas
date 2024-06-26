unit Sistema.Model.Services.Interfaces;

interface

uses
  Data.DB,
  System.SysUtils,
  Sistema.Model.Entities.Tanques,
  Sistema.Model.Entities.Bombas,
  Sistema.Model.Entities.Abastecimentos;

type
  iModelServicesCalculos = interface
  ['{EBB36996-32E7-4A3B-B302-6046FC639E0A}']
    function CalcularImposto(AValorAbastecido: Currency; APorcentagemImposto: Currency): Currency;
  end;

  iModelServicesEntities<T: class, constructor> = interface
  ['{A5E4352A-7EA6-4CC7-82AA-B146EF3B095A}']
    function NewObject: T;
    function Current: T;
    function UpdateObject: iModelServicesEntities<T>;
    function Insert: iModelServicesEntities<T>;
    function Update: iModelServicesEntities<T>;
    function Delete: iModelServicesEntities<T>;
    function Listar : iModelServicesEntities<T>;
    function ListarPorId(AId: Integer): iModelServicesEntities<T>;
    function ListarPorWhere(AWhere: string): iModelServicesEntities<T>;
    function DataSource(ADatasource: TDataSource): iModelServicesEntities<T>;
    function OnChange(AOnChange: TProc<TDataSource>): iModelServicesEntities<T>;
  end;

  iModelServicesFactory = interface
  ['{E0B69106-5F3A-4E11-805C-6284ABD8138A}']
    function Tanques: iModelServicesEntities<TTanques>;
    function Bombas:iModelServicesEntities<TBombas>;
    function Abastecimentos: iModelServicesEntities<TAbastecimentos>;
  end;

implementation

end.

