unit Sistema.View.Principal;

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
  Vcl.Menus,
  StrUtils,
  FireDAC.Stan.Intf,
  FireDAC.Comp.UI,
  FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait,
  System.Actions,
  Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan,
  Sistema.Model.Connection.Factory,
  Sistema.View.Tanques,
  Sistema.View.Bombas,
  Sistema.View.Abastecimentos,
  Sistema.View.RelatorioAbastecimento;

type
  TViewPrincipal = class(TForm)
    MainMenu: TMainMenu;
    MenuItemCadastro: TMenuItem;
    MenuItemCadTanques: TMenuItem;
    MenuItemLancamentos: TMenuItem;
    ActionManager: TActionManager;
    ATanques: TAction;
    ABombas: TAction;
    AAbastecimentos: TAction;
    MenuItemCadBombas: TMenuItem;
    MenuItemLanAbastecimentos: TMenuItem;
    ARelatorioAbastecimento: TAction;
    Relatrio1: TMenuItem;
    MenuItemRelAbatecimento: TMenuItem;
    procedure ATanquesExecute(Sender: TObject);
    procedure ABombasExecute(Sender: TObject);
    procedure AAbastecimentosExecute(Sender: TObject);
    procedure ARelatorioAbastecimentoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

{$R *.dfm}

procedure TViewPrincipal.AAbastecimentosExecute(Sender: TObject);
begin
  if ViewAbastecimentos = nil then
    ViewAbastecimentos := TViewAbastecimentos.Create(Self);
  ViewAbastecimentos.Show;
  ViewAbastecimentos.BringToFront;
  Cascade;
end;

procedure TViewPrincipal.ABombasExecute(Sender: TObject);
begin
  if ViewBombas = nil then
    ViewBombas := TViewBombas.Create(Self);
  ViewBombas.Show;
  ViewBombas.BringToFront;
  Cascade;
end;

procedure TViewPrincipal.ARelatorioAbastecimentoExecute(Sender: TObject);
begin
  if ViewRelatorioAbastecimento = nil then
    ViewRelatorioAbastecimento := TViewRelatorioAbastecimento.Create(Self);
  ViewRelatorioAbastecimento.Show;
  ViewRelatorioAbastecimento.BringToFront;
  Cascade;
end;

procedure TViewPrincipal.ATanquesExecute(Sender: TObject);
begin
  if ViewTanques = nil then
    ViewTanques := TViewTanques.Create(Self);
  ViewTanques.Show;
  ViewTanques.BringToFront;
  Cascade;
end;

end.
