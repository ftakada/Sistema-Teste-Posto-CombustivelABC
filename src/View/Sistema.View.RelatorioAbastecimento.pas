unit Sistema.View.RelatorioAbastecimento;

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
  RLReport,
  Vcl.StdCtrls,
  Vcl.Mask,
  Data.DB,
  Sistema.Model.Connection.Interfaces,
  Sistema.Model.Connection.Factory,
  Sistema.Model.Util.Funcoes,
  Sistema.View.RelatorioPadrao;

type
  TViewRelatorioAbastecimento = class(TViewRelatorioPadrao)
    RLBand2: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel21: TRLLabel;
    RLPeriodo: TRLLabel;
    RLBand4: TRLBand;
    RLLabel7: TRLLabel;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RLGroup1: TRLGroup;
    RLBand6: TRLBand;
    RLLabel17: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel3: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel11: TRLLabel;
    RLBand1: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel16: TRLLabel;
    RLBand3: TRLBand;
    RLDBData: TRLDBText;
    RLDBTanque: TRLDBText;
    RLDBBomba: TRLDBText;
    RLDBImposto: TRLDBText;
    RDBTextValorAbastecido: TRLDBText;
    RDBTextValorAbastecidoComImposto: TRLDBText;
    RLDBText1: TRLDBText;
    RLDBText3: TRLDBText;
    RLBand5: TRLBand;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLSubtotalAbastecido: TRLLabel;
    RLLSubtotalAbastecidoComImposto: TRLLabel;
    RLLabel13: TRLLabel;
    RLBand7: TRLBand;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLTotalAbastecido: TRLLabel;
    RLLTotalAbastecidoComImposto: TRLLabel;
    MkEditDtInicial: TMaskEdit;
    MkEditDtFinal: TMaskEdit;
    RLBand8: TRLBand;
    RLLabel4: TRLLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RDBTextValorAbastecidoBeforePrint(Sender: TObject; var AText: string; var PrintIt: Boolean);
    procedure RLGroup1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RDBTextValorAbastecidoComImpostoBeforePrint(Sender: TObject; var AText: string; var PrintIt: Boolean);
    procedure RLReportBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLReportAfterPrint(Sender: TObject);
  private
    { Private declarations }
    FConnectionFactory: iModelConnectionFactory;
    procedure Filtrar;
    function SQLAbstecimento: string;
  public
    { Public declarations }
  end;

var
  ViewRelatorioAbastecimento: TViewRelatorioAbastecimento;

implementation

{$R *.dfm}

procedure TViewRelatorioAbastecimento.Button1Click(Sender: TObject);
begin
  inherited;
  Filtrar;
  RLReport.PreviewOptions.WindowState := wsMaximized;
  RLReport.PreviewModal;
end;

procedure TViewRelatorioAbastecimento.Filtrar;
var
  LSQL: string;
begin
  LSQL := SQLAbstecimento;

  if MkEditDtInicial.Text <> '  /  /    ' then
    LSQL := LSQL + ' and A.DATA >= ' + QuotedStr(StringReplace(MkEditDtInicial.Text, '/', '.', [rfReplaceAll]));
  if MkEditDtFinal.Text <> '  /  /    ' then
    LSQL := LSQL + ' and A.DATA<=' + QuotedStr(StringReplace(MkEditDtFinal.Text, '/', '.', [rfReplaceAll]));

  case ComboBox1.ItemIndex of
    0:
      begin
        RLGroup1.DataFields := 'DATALANCAMENTO';
        LSQL := LSQL + ' order by DATALANCAMENTO';
      end;
    1:
     begin
       RLGroup1.DataFields := 'IDTANQUE';
       LSQL := LSQL + ' order by IDTANQUE';
     end;
    2:
     begin
       RLGroup1.DataFields := 'IDBOMBA';
       LSQL := LSQL + ' order by IDBOMBA';
     end;
  end;

  FConnectionFactory
    .GetQuery
   .Close
    .SQL(LSQL)
  .Open;
end;

procedure TViewRelatorioAbastecimento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  ViewRelatorioAbastecimento := nil
end;

procedure TViewRelatorioAbastecimento.FormCreate(Sender: TObject);
begin
  inherited;
  FConnectionFactory := TModelConnectionFactory.New;
  DtSrc.DataSet :=  FConnectionFactory.GetQuery.Query;
end;

procedure TViewRelatorioAbastecimento.RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  inherited;
  RLPeriodo.Caption := MkEditDtInicial.Text + ' - ' + MkEditDtFinal.Text;
end;

procedure TViewRelatorioAbastecimento.RDBTextValorAbastecidoBeforePrint(Sender: TObject; var AText: string; var PrintIt: Boolean);
begin
  inherited;
  RLLSubtotalAbastecido.Caption := TFuncoes.SomarValoresStr(RLLSubtotalAbastecido.Caption,AText);
  RLLTotalAbastecido.Caption    := TFuncoes.SomarValoresStr(RLLTotalAbastecido.Caption,AText);
end;

procedure TViewRelatorioAbastecimento.RDBTextValorAbastecidoComImpostoBeforePrint(Sender: TObject; var AText: string; var PrintIt: Boolean);
begin
  inherited;
  RLLSubtotalAbastecidoComImposto.Caption := TFuncoes.SomarValoresStr(RLLSubtotalAbastecidoComImposto.Caption,AText);
  RLLTotalAbastecidoComImposto.Caption    := TFuncoes.SomarValoresStr(RLLTotalAbastecidoComImposto.Caption,AText);
end;

procedure TViewRelatorioAbastecimento.RLGroup1BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  inherited;
  RLLSubTotalAbastecido.Caption := '0,00';
  RLLSubtotalAbastecidoComImposto.Caption := '0,00';

  case ComboBox1.ItemIndex of
    0:
      begin
        RLLabel17.Caption := 'Data';
        RLLabel13.Caption := FConnectionFactory.GetQuery.Query.FieldByName('DATALANCAMENTO').AsString;
      end;
    1:
     begin
       RLLabel17.Caption := 'Tanque';
       RLLabel13.Caption := FConnectionFactory.GetQuery.Query.FieldByName('DESCRICAOTANQUE').AsString;
     end;
    2:
     begin
       RLLabel17.Caption := 'Bomba';
       RLLabel13.Caption := FConnectionFactory.GetQuery.Query.FieldByName('DESCRICAOBOMBA').AsString;
     end;
  end;
end;

procedure TViewRelatorioAbastecimento.RLReportAfterPrint(Sender: TObject);
begin
  inherited;
  FConnectionFactory.GetQuery.Close;
end;

procedure TViewRelatorioAbastecimento.RLReportBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  inherited;
  RLLSubTotalAbastecido.Caption := '0,00';
  RLLSubtotalAbastecidoComImposto.Caption := '0,00';
  RLLTotalAbastecido.Caption := '0,00';
  RLLTotalAbastecidoComImposto.Caption := '0,00';
end;

function TViewRelatorioAbastecimento.SQLAbstecimento: string;
var
  LSQL: string;
begin
  LSQL :=
  ' SELECT '+
  '   A.DATA as DATALANCAMENTO, '+
  '   B.ID_TANQUE as IDTANQUE, '+
  '   T.DESCRICAO  as DESCRICAOTANQUE, '+
  '   A.ID_BOMBA as IDBOMBA, '+
  '   B.DESCRICAO as DESCRICAOBOMBA, '+
  '   T.TIPOCOMBUSTIVEL as  TIPOCOMBUSTIVEL, '+
  '   A.PERCENTUAL_IMPOSTO as PERCENTUALIMPOSTO, '+
  '   A.QUANTIDADE_LITROS as QUANTIDADELITROS, '+
  '   A.VALOR_ABASTECIDO as VALORABASTECIDO, '+
  '   A.VALOR_IMPOSTO as VALORIMPOSTO, '+
  '   (A.VALOR_ABASTECIDO + A.VALOR_IMPOSTO) as VALORTOTAL '+
  ' FROM ABASTECIMENTOS A '+
  ' join BOMBAS B on A.ID_BOMBA = B.ID '+
  ' join TANQUES T on B.ID_TANQUE = T.ID ';

  Result := LSQL;
end;

end.
