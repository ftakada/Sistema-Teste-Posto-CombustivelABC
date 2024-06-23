unit Sistema.View.Tanques;

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
  Sistema.Controller,
  Sistema.Model.Types;

type
  TViewTanques = class(TViewPadrao)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnFiltrarClick(Sender: TObject);
    procedure DBGridListaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    FController: iController;
    FTipoCombustivel: TTipoCombustivel;
    procedure ListarTanques;
  public
    { Public declarations }
  end;

var
  ViewTanques: TViewTanques;

implementation

{$R *.dfm}

procedure TViewTanques.BtnFiltrarClick(Sender: TObject);
begin
  inherited;
  ListarTanques;
end;

procedure TViewTanques.DBGridListaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
 LTexto: string;
begin
  inherited;
  if Column.FieldName = 'TIPOCOMBUSTIVEL' then
  begin
    LTexto :=   FTipoCombustivel.Descricao(DBGridLista.DataSource.DataSet.FieldByName('TIPOCOMBUSTIVEL').AsString);
    DBGridLista.Canvas.FillRect(Rect);
    DBGridLista.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, LTexto);
  end;
end;

procedure TViewTanques.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  ViewTanques := nil;
end;

procedure TViewTanques.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TController.New;
  FController.Services.Tanques.DataSource(DtSrc);
end;

procedure TViewTanques.ListarTanques;
begin
  FController.Services.Tanques.Listar;
end;

end.
