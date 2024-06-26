unit Sistema.Model.Connection.Interfaces;

interface

uses
  FireDAC.Comp.Client;

type

  iModelQuery = interface
    ['{A0D1F6E8-158B-4307-A204-0AC30A53DC8D}']
    function ExecutaSQL(ASQL : string) : iModelQuery;
    function Query: TFDQuery;
    function SQL(ASQL: string): iModelQuery;
    function Cancel: iModelQuery;
    function Open: iModelQuery;
    function Close: iModelQuery;
  end;

  iModelConnection = interface
  ['{17EFEF18-E794-4F14-9F07-A1EBC30F22B1}']
    function ConfigurarConnection: iModelConnection;
    function Connect: iModelConnection;
    function Disconnect: iModelConnection;
    function Reconnect: iModelConnection;
    function GetConnection: TFDCustomConnection;
    function Connected: Boolean;
  end;

  iModelConnectionFactory = interface
  ['{907B5E91-3716-429A-B148-3A909778B1FB}']
    function Connection: iModelConnection;
    function GetQuery: iModelQuery;
  end;


implementation
end.
