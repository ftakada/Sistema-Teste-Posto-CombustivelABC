unit Sistema.Model.Connection.Firedac;

interface

uses
  FireDAC.Comp.Client,
  System.SysUtils,
  System.IniFiles,
  FireDAC.Phys.FB,
  FireDAC.Stan.Def,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.UI,
  Data.DB,
  Sistema.Model.Connection.Interfaces,
  Sistema.Model.Util.Funcoes,
  Sistema.Sitema.Model.Exception.MinhaExcecao;

type

  TModelConnectionFiredac = class(TInterfacedObject, IModelConnection)
  private
    FConnectionFiredac: TFDConnection;
    FFDPhysFBDriverLink: TFDPhysFBDriverLink;
    FFDGuixWaitCursor: TFDGUIxWaitCursor;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelConnection;
    function ConfigurarConnection: iModelConnection;
    function Connect: iModelConnection;
    function Disconnect: iModelConnection;
    function Reconnect: iModelConnection;
    function GetConnection: TFDCustomConnection;
    function Connected: Boolean;
  end;

implementation


{ TModelConnectionFiredac }

function TModelConnectionFiredac.ConfigurarConnection: iModelConnection;
const
  cNomeArquivoIni = 'config.ini';
  cMsgErrorIni =
   '[Database]' +sLineBreak + 'DatabasePath=C:\Exe\BANCO.FDB' + sLineBreak +
   'User=sysdba' + sLineBreak + 'Password=masterkey' + 'Server=localhost' ;
var
  LCaminhoCompletoIni: string;
  LIniFile: TIniFile;
  LDatabasePath: string;
  LUser: string;
  LPassword: string;
  LIPServer: string;
begin
  Result := Self;
  LCaminhoCompletoIni := TFuncoes.CaminhoExe + cNomeArquivoIni;

  if not FileExists(LCaminhoCompletoIni) then
    raise Exception.Create('Arquivo .INI n�o encontrado!' + sLineBreak + 'Crie o arquivo(' + cNomeArquivoIni + ') e configure conforme o exemplo: ' + sLineBreak + cMsgErrorIni);

  LIniFile := TIniFile.Create(LCaminhoCompletoIni);
  try
    LDatabasePath := LIniFile.ReadString('Database', 'DatabasePath', '');
    LUser := LIniFile.ReadString('Database', 'User', '');
    LPassword := LIniFile.ReadString('Database', 'Password', '');
    LIPServer := LIniFile.ReadString('Database', 'Server', 'localhost');

    if LDatabasePath = '' then
      raise Exception.Create('Caminho do banco de dados n�o foi especificado no arquivo INI.');
    if LUser = '' then
      raise Exception.Create('Usu�rio do banco de dados n�o foi especificado no arquivo INI.');
    if LPassword = '' then
      raise Exception.Create('Senha do banco de dados n�o foi especificado no arquivo INI.');

    // Configurar a conex�o
    FConnectionFiredac.Params.DriverID := 'FB';
    FConnectionFiredac.Params.Database := LDatabasePath;
    FConnectionFiredac.Params.UserName := LUser;
    FConnectionFiredac.Params.Password := LPassword;
    FConnectionFiredac.Params.Add('Server=' + LIPServer);
    FConnectionFiredac.LoginPrompt := False;
  finally
    LIniFile.Free;
  end;
end;

function TModelConnectionFiredac.Connect: iModelConnection;
begin
  try
    Result := Self;
    FConnectionFiredac.Connected := True;

  except on E: EMinhaExcecao do
    E.Create(E.Message);
  end;
end;

function TModelConnectionFiredac.Connected: Boolean;
begin
  Result := FConnectionFiredac.Connected;
end;

constructor TModelConnectionFiredac.Create;
begin
  FConnectionFiredac := TFDConnection.Create(nil);
  FFDPhysFBDriverLink := TFDPhysFBDriverLink.Create(FConnectionFiredac);
  FFDGuixWaitCursor := TFDGUIxWaitCursor.Create(FConnectionFiredac);
  FFDPhysFBDriverLink.ThreadSafe := True;
  ConfigurarConnection;
end;

function TModelConnectionFiredac.Reconnect: iModelConnection;
begin
  Result := Self;
  Disconnect.Connect;
end;

destructor TModelConnectionFiredac.Destroy;
begin
  inherited;
  FConnectionFiredac.DisposeOf;
end;

function TModelConnectionFiredac.Disconnect: iModelConnection;
begin
  Result := Self;
  FConnectionFiredac.Close;
end;

function TModelConnectionFiredac.GetConnection: TFDCustomConnection;
begin
  Result := FConnectionFiredac;
end;

class function TModelConnectionFiredac.New: iModelConnection;
begin
  Result := Self.Create;
end;

end.

