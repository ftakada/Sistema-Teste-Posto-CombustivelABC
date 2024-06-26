inherited ViewAbastecimentos: TViewAbastecimentos
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Abastecimentos'
  ClientHeight = 550
  OnClose = FormClose
  ExplicitHeight = 588
  TextHeight = 15
  object PanelLancamentoAbastecimento: TPanel [0]
    Left = 0
    Top = 0
    Width = 273
    Height = 550
    Align = alLeft
    TabOrder = 2
    ExplicitHeight = 549
    object LblData: TLabel
      Left = 176
      Top = 38
      Width = 24
      Height = 15
      Caption = 'Data'
    end
    object LblLitros: TLabel
      Left = 176
      Top = 76
      Width = 29
      Height = 15
      Caption = 'Litros'
    end
    object LblValor: TLabel
      Left = 176
      Top = 118
      Width = 42
      Height = 15
      Caption = 'Valor R$'
    end
    object LblStatus: TLabel
      Left = 7
      Top = 5
      Width = 47
      Height = 21
      Caption = 'Status'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object BtnGravar: TButton
      Left = 176
      Top = 163
      Width = 89
      Height = 25
      Caption = 'Gravar'
      TabOrder = 3
      OnClick = BtnGravarClick
    end
    object EdtLitros: TEdit
      Left = 176
      Top = 92
      Width = 89
      Height = 23
      NumbersOnly = True
      TabOrder = 1
    end
    object DtpData: TDateTimePicker
      Left = 176
      Top = 51
      Width = 89
      Height = 23
      Date = 45464.000000000000000000
      Time = 0.025417060183826830
      TabOrder = 0
    end
    object EdtValor: TEdit
      Left = 176
      Top = 134
      Width = 89
      Height = 23
      TabOrder = 2
    end
    object RdgBombas: TRadioGroup
      Left = 7
      Top = 31
      Width = 154
      Height = 126
      Caption = 'Bombas'
      ItemIndex = 0
      Items.Strings = (
        'Bomba 01 - Gasolina'
        'Bomba 02 - Gasolina'
        'Bomba 03 - Diesel'
        'Bomba 04 - Diesel')
      TabOrder = 4
    end
    object BtnExcluir: TButton
      Left = 7
      Top = 194
      Width = 82
      Height = 25
      Caption = 'Excluir'
      TabOrder = 5
      TabStop = False
      OnClick = BtnExcluirClick
    end
    object BtnNovoLancamento: TButton
      Left = 95
      Top = 194
      Width = 170
      Height = 25
      Caption = 'Novo Lan'#231'amento'
      TabOrder = 6
      TabStop = False
      OnClick = BtnNovoLancamentoClick
    end
  end
  inherited DBGridLista: TDBGrid
    Left = 287
    Top = 31
    Width = 701
    Height = 519
    Align = alNone
    OnDrawColumnCell = DBGridListaDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'DATA'
        Title.Caption = 'Data'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_BOMBA'
        Title.Caption = 'ID da Bomba'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTIDADE_LITROS'
        Title.Caption = 'Qtd. Litros'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_ABASTECIDO'
        Title.Caption = 'Abastecido R$'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERCENTUAL_IMPOSTO'
        Title.Caption = 'Imposto %'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_IMPOSTO'
        Title.Caption = 'Imposto R$'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL'
        Title.Caption = 'Total R$'
        Width = 81
        Visible = True
      end>
  end
  inherited BtnFiltrar: TButton
    Left = 287
    Top = 3
    Width = 82
    OnClick = BtnFiltrarClick
    ExplicitLeft = 287
    ExplicitTop = 3
    ExplicitWidth = 82
  end
  inherited DtSrc: TDataSource
    Left = 856
    Top = 8
  end
end
