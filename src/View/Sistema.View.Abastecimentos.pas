unit Sistema.View.Abastecimentos;

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
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ComCtrls,
  Vcl.DBCtrls,
  Sistema.View.Padrao,
  Sistema.Controller.Interfaces,
  Sistema.Controller,
  Sistema.Model.Types,
  Sistema.View.RelatorioPadrao, RLReport;

type
  TViewAbastecimentos = class(TViewPadrao)
    PanelLancamentoAbastecimento: TPanel;
    BtnGravar: TButton;
    EdtLitros: TEdit;
    DtpData: TDateTimePicker;
    LblData: TLabel;
    EdtValor: TEdit;
    LblLitros: TLabel;
    LblValor: TLabel;
    RdgBombas: TRadioGroup;
    LblStatus: TLabel;
    BtnExcluir: TButton;
    BtnNovoLancamento: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnFiltrarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGridListaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnNovoLancamentoClick(Sender: TObject);
  private
    { Private declarations }
    FController: iController;
    FState : TState;
    procedure ListarAbastecimentos;
    procedure GravarAbastecimento;
    procedure NovoLancamento;
    procedure ExcluirLancamento;
    procedure AlterarLancamento;
    procedure ConfigurarComponentes;
  public
    { Public declarations }
  end;

var
  ViewAbastecimentos: TViewAbastecimentos;

implementation

{$R *.dfm}

procedure TViewAbastecimentos.AlterarLancamento;
begin
  with FController.Services.Abastecimentos.Current do
  begin
    RdgBombas.ItemIndex := Id_Bomba - 1;
    DtpData.Date := Data;
    EdtLitros.Text := Quantidade_Litros.ToString;
    EdtValor.Text := FloatToStr(Valor_Abastecido);
    FState := stEdit;
  end;
  ConfigurarComponentes;
end;

procedure TViewAbastecimentos.BtnFiltrarClick(Sender: TObject);
begin
  inherited;
  ListarAbastecimentos;
end;

procedure TViewAbastecimentos.BtnGravarClick(Sender: TObject);
begin
  inherited;
  GravarAbastecimento;
end;

procedure TViewAbastecimentos.BtnNovoLancamentoClick(Sender: TObject);
begin
  inherited;
  NovoLancamento;
end;

procedure TViewAbastecimentos.Button1Click(Sender: TObject);
begin
  inherited;
  AlterarLancamento;
end;

procedure TViewAbastecimentos.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  ExcluirLancamento;
end;

procedure TViewAbastecimentos.ConfigurarComponentes;
begin
  case FState of
    stBrowse :
      begin
        BtnGravar.Enabled := False;
        BtnExcluir.Enabled := False;
        BtnNovoLancamento.Enabled := True;
        LblStatus.Caption := 'Visualizando';
      end;
    stInsert :
      begin
        BtnGravar.Enabled := True;
        BtnExcluir.Enabled := False;
        BtnNovoLancamento.Enabled := False;
        LblStatus.Caption := 'Inserindo';
      end;
    stEdit :
      begin
        BtnGravar.Enabled := True;
        BtnExcluir.Enabled := True;
        BtnNovoLancamento.Enabled := True;
        LblStatus.Caption := 'Alterando';
      end
  end;
end;

procedure TViewAbastecimentos.DBGridListaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
 LTotal: Double;
 LTexto: string;
 LTextWidth: Integer;
begin
  inherited;
  if Column.FieldName = 'TOTAL' then
  begin
    LTotal :=
      DBGridLista.DataSource.DataSet.FieldByName('VALOR_ABASTECIDO').AsFloat +
      DBGridLista.DataSource.DataSet.FieldByName('VALOR_IMPOSTO').AsFloat;

    LTexto := FormatFloat('#,##0.00', LTotal);

    LTextWidth := DBGridLista.Canvas.TextWidth(LTexto);
    DBGridLista.Canvas.FillRect(Rect);
    DBGridLista.Canvas.TextOut(Rect.Right - LTextWidth - 2, Rect.Top + 2, LTexto);
  end;
end;

procedure TViewAbastecimentos.ExcluirLancamento;
begin
  FController
    .Services
    .Abastecimentos
  .Delete
  .Listar;
  FState := stBrowse;
end;

procedure TViewAbastecimentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  ViewAbastecimentos := nil
end;

procedure TViewAbastecimentos.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TController.New;
  FController.Services.Abastecimentos.DataSource(DtSrc)
   .OnChange(
       procedure (ADatasource: TDataSource)
       begin
         AlterarLancamento;
       end
     );

  NovoLancamento;
end;

procedure TViewAbastecimentos.GravarAbastecimento;
begin
  FController.Services.Abastecimentos.Current.Data               := DtpData.Date;
  FController.Services.Abastecimentos.Current.Id_Bomba           := RdgBombas.ItemIndex + 1;
  FController.Services.Abastecimentos.Current.Percentual_Imposto := 13;
  FController.Services.Abastecimentos.Current.Quantidade_Litros  := StrToInt(EdtLitros.Text);
  FController.Services.Abastecimentos.Current.Valor_Abastecido   := StrToFloat(EdtValor.Text);

  case FState of
    stInsert: FController.Services.Abastecimentos.Insert;
    stEdit: FController.Services.Abastecimentos.Update;
  end;

  ListarAbastecimentos;
  FState := stBrowse;
  ConfigurarComponentes;
end;


procedure TViewAbastecimentos.NovoLancamento;
begin
  FController
    .Services
    .Abastecimentos
  .NewObject;

  RdgBombas.ItemIndex := 0;
  EdtLitros.Clear;
  EdtValor.Clear;

  FState := stInsert;
  ConfigurarComponentes;
end;

procedure TViewAbastecimentos.ListarAbastecimentos;
begin
  FController.Services.Abastecimentos.Listar;
end;

end.
