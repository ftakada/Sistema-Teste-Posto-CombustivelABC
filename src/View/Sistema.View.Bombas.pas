unit Sistema.View.Bombas;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs,
  Data.DB,
  Vcl.StdCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Sistema.View.Padrao,
  Sistema.Controller.Interfaces,
  Sistema.Controller;

type
  TViewBombas = class(TViewPadrao)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnFiltrarClick(Sender: TObject);
  private
    { Private declarations }
    FController: iController;
    procedure ListarBombas;
  public
    { Public declarations }
  end;

var
  ViewBombas: TViewBombas;

implementation

{$R *.dfm}

procedure TViewBombas.BtnFiltrarClick(Sender: TObject);
begin
  inherited;
  ListarBombas;
end;

procedure TViewBombas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  ViewBombas := nil;
end;

procedure TViewBombas.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TController.New;
  FController.Services.Bombas.DataSource(DtSrc);
end;

procedure TViewBombas.ListarBombas;
begin
  FController.Services.Bombas.Listar
end;

end.
