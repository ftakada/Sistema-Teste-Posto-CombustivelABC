unit Sistema.View.Padrao;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.StdCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Sitema.Model.Helpers.EnterTabHelper;

type
  TViewPadrao = class(TForm)
    DBGridLista: TDBGrid;
    BtnFiltrar: TButton;
    DtSrc: TDataSource;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewPadrao: TViewPadrao;

implementation

{$R *.dfm}

procedure TViewPadrao.FormCreate(Sender: TObject);
begin
  EnableEnterTab;
end;

end.
