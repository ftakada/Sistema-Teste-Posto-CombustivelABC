unit Sistema.View.ConfigurarIni;

interface

uses
  Vcl.Forms, Vcl.StdCtrls, Vcl.Controls, Vcl.ExtCtrls, System.Classes, System.IniFiles;

type
  TViewConfigurarIni = class(TForm)
    LabelCaminhoBanco: TLabel;
    LabelUsuario: TLabel;
    LabelSenha: TLabel;
    LabelServidor: TLabel;
    EditCaminhoBanco: TEdit;
    EditUsuario: TEdit;
    EditSenha: TEdit;
    EditServidor: TEdit;
    BotaoSalvar: TButton;
    BotaoCancelar: TButton;
    procedure BotaoSalvarClick(Sender: TObject);
    procedure BotaoCancelarClick(Sender: TObject);
  private
    FIniFileName: string;
  public
    constructor Create(AOwner: TComponent; const AIniFileName: string); reintroduce;
  end;

var
  ViewConfigurarIni: TViewConfigurarIni;

implementation

{$R *.dfm}

constructor TViewConfigurarIni.Create(AOwner: TComponent; const AIniFileName: string);
begin
  inherited Create(AOwner);
  FIniFileName := AIniFileName;
end;

procedure TViewConfigurarIni.BotaoSalvarClick(Sender: TObject);
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(FIniFileName);
  try
    IniFile.WriteString('Database', 'Database', EditCaminhoBanco.Text);
    IniFile.WriteString('Database', 'User', EditUsuario.Text);
    IniFile.WriteString('Database', 'Password', EditSenha.Text);
    IniFile.WriteString('Database', 'Server', EditServidor.Text);
    ModalResult := mrOk;
  finally
    IniFile.Free;
  end;
end;

procedure TViewConfigurarIni.BotaoCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.

