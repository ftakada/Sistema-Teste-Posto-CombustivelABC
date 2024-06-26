inherited ViewRelatorioAbastecimento: TViewRelatorioAbastecimento
  Caption = 'Relat'#243'rio de Abastecimentos'
  ClientHeight = 441
  ClientWidth = 979
  OnClose = FormClose
  ExplicitWidth = 991
  ExplicitHeight = 479
  TextHeight = 15
  object Label1: TLabel [0]
    Left = 3
    Top = 9
    Width = 58
    Height = 15
    Caption = 'Data Inicial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel [1]
    Left = 160
    Top = 9
    Width = 64
    Height = 15
    Caption = 'Agrupar por'
  end
  object Label3: TLabel [2]
    Left = 81
    Top = 9
    Width = 52
    Height = 15
    Caption = 'Data Final'
  end
  inherited Button1: TButton [3]
    Left = 314
    Width = 217
    Height = 41
    TabOrder = 4
    OnClick = Button1Click
    ExplicitLeft = 314
    ExplicitWidth = 217
    ExplicitHeight = 41
  end
  inherited RLReport: TRLReport [4]
    Left = 91
    Top = 68
    AfterPrint = RLReportAfterPrint
    BeforePrint = RLReportBeforePrint
    ExplicitLeft = 91
    ExplicitTop = 68
    object RLBand2: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 74
      BandType = btHeader
      BeforePrint = RLBand2BeforePrint
      object RLLabel1: TRLLabel
        Left = 210
        Top = 3
        Width = 298
        Height = 24
        Alignment = taCenter
        Caption = 'Relat'#243'rio de Abastecimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel21: TRLLabel
        Left = 1
        Top = 54
        Width = 65
        Height = 16
        AutoSize = False
        Caption = 'Per'#237'odo de:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLPeriodo: TRLLabel
        Left = 72
        Top = 54
        Width = 145
        Height = 16
        AutoSize = False
        Caption = '00/00/0000 a 00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Pitch = fpVariable
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel7: TRLLabel
        Left = 253
        Top = 26
        Width = 212
        Height = 19
        Alignment = taCenter
        Caption = 'Posto de Combust'#237'vel ABC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 240
      Width = 718
      Height = 18
      BandType = btFooter
      object RLSystemInfo1: TRLSystemInfo
        Left = 1
        Top = 1
        Width = 60
        Height = 16
        Info = itFullDate
        Text = ''
      end
      object RLLabel3: TRLLabel
        Left = 602
        Top = 1
        Width = 44
        Height = 16
        Caption = 'Pagina'
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 647
        Top = 1
        Width = 28
        Height = 16
        Info = itPageNumber
        Text = ''
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 687
        Top = 1
        Width = 112
        Height = 16
        Info = itLastPageNumber
        Text = ''
      end
      object RLLabel11: TRLLabel
        Left = 676
        Top = 1
        Width = 8
        Height = 16
        Caption = '/'
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 112
      Width = 718
      Height = 105
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      FooterMeasuring = fmBeforeDetail
      BeforePrint = RLGroup1BeforePrint
      object RLBand6: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 16
        GreenBarColor = clSilver
        BandType = btHeader
        Color = clSilver
        ParentColor = False
        Transparent = False
        object RLLabel17: TRLLabel
          Left = 3
          Top = 0
          Width = 71
          Height = 16
          AutoSize = False
          Caption = 'Agrupado por:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel13: TRLLabel
          Left = 80
          Top = 0
          Width = 132
          Height = 16
          Caption = 'Descricao Agrupado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
      object RLBand1: TRLBand
        Left = 0
        Top = 16
        Width = 718
        Height = 18
        BandType = btColumnHeader
        object RLLabel2: TRLLabel
          Left = 3
          Top = 1
          Width = 74
          Height = 16
          Caption = 'Data '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 78
          Top = 1
          Width = 115
          Height = 16
          Caption = 'Tanque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel6: TRLLabel
          Left = 201
          Top = 1
          Width = 106
          Height = 16
          Caption = 'Bomba'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel8: TRLLabel
          Left = 451
          Top = 1
          Width = 94
          Height = 16
          Alignment = taRightJustify
          Caption = 'Abastecido R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel9: TRLLabel
          Left = 379
          Top = 1
          Width = 69
          Height = 16
          Alignment = taRightJustify
          Caption = 'Imposto %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel10: TRLLabel
          Left = 623
          Top = 1
          Width = 91
          Height = 16
          Alignment = taRightJustify
          Caption = 'Total R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel12: TRLLabel
          Left = 310
          Top = 1
          Width = 65
          Height = 16
          Alignment = taRightJustify
          Caption = 'Qtd.Litros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel16: TRLLabel
          Left = 546
          Top = 1
          Width = 74
          Height = 16
          Alignment = taRightJustify
          Caption = 'Imposto R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Holder = RLLabel16
          ParentFont = False
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 34
        Width = 718
        Height = 21
        object RLDBData: TRLDBText
          Left = 3
          Top = 3
          Width = 74
          Height = 16
          AutoSize = False
          DataField = 'DATALANCAMENTO'
          DataSource = DtSrc
          Text = ''
        end
        object RLDBTanque: TRLDBText
          Left = 78
          Top = 3
          Width = 115
          Height = 16
          AutoSize = False
          DataField = 'DESCRICAOTANQUE'
          DataSource = DtSrc
          Text = ''
        end
        object RLDBBomba: TRLDBText
          Left = 201
          Top = 3
          Width = 106
          Height = 16
          AutoSize = False
          DataField = 'DESCRICAOBOMBA'
          DataSource = DtSrc
          Text = ''
        end
        object RLDBImposto: TRLDBText
          Left = 379
          Top = 3
          Width = 69
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'PERCENTUALIMPOSTO'
          DataSource = DtSrc
          Text = ''
        end
        object RDBTextValorAbastecido: TRLDBText
          Left = 451
          Top = 3
          Width = 94
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VALORABASTECIDO'
          DataSource = DtSrc
          Text = ''
          BeforePrint = RDBTextValorAbastecidoBeforePrint
        end
        object RDBTextValorAbastecidoComImposto: TRLDBText
          Left = 623
          Top = 3
          Width = 91
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VALORTOTAL'
          DataSource = DtSrc
          Text = ''
          BeforePrint = RDBTextValorAbastecidoComImpostoBeforePrint
        end
        object RLDBText1: TRLDBText
          Left = 310
          Top = 3
          Width = 65
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'QUANTIDADELITROS'
          DataSource = DtSrc
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 546
          Top = 3
          Width = 74
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VALORIMPOSTO'
          DataSource = DtSrc
          Text = ''
        end
      end
      object RLBand5: TRLBand
        Left = 0
        Top = 55
        Width = 718
        Height = 41
        BandType = btSummary
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Borders.FixedTop = True
        object RLLabel14: TRLLabel
          Left = 482
          Top = 1
          Width = 155
          Height = 19
          Alignment = taRightJustify
          Caption = 'SubTotal Abastecido R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel15: TRLLabel
          Left = 420
          Top = 20
          Width = 217
          Height = 16
          Alignment = taRightJustify
          Caption = 'Subtotal Abastecido + Imposto R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLSubtotalAbastecido: TRLLabel
          Left = 643
          Top = 1
          Width = 71
          Height = 19
          Alignment = taRightJustify
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLSubtotalAbastecidoComImposto: TRLLabel
          Left = 640
          Top = 21
          Width = 74
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
    end
    object RLBand7: TRLBand
      Left = 38
      Top = 217
      Width = 718
      Height = 23
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      Borders.FixedTop = True
      object RLLabel18: TRLLabel
        Left = 208
        Top = 3
        Width = 130
        Height = 16
        Alignment = taRightJustify
        Caption = 'Total Abastecido R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel19: TRLLabel
        Left = 441
        Top = 3
        Width = 196
        Height = 16
        Alignment = taRightJustify
        Caption = 'Total Abastecido + Imposto R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLTotalAbastecido: TRLLabel
        Left = 344
        Top = 3
        Width = 71
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'RLLabelTotalAbastecido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLTotalAbastecidoComImposto: TRLLabel
        Left = 640
        Top = 4
        Width = 74
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'RLLabelTotalAbastecidoComImposto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLBand8: TRLBand
      Left = 38
      Top = 258
      Width = 718
      Height = 13
      BandType = btFooter
      object RLLabel4: TRLLabel
        Left = 3
        Top = 0
        Width = 134
        Height = 12
        Caption = 'Sistema Posto de Combust'#237'vel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object ComboBox1: TComboBox [5]
    Left = 160
    Top = 25
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    ItemIndex = 0
    TabOrder = 2
    Text = 'Data'
    Items.Strings = (
      'Data'
      'Tanque'
      'Bomba')
  end
  object MkEditDtInicial: TMaskEdit [6]
    Left = 3
    Top = 24
    Width = 66
    Height = 23
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 0
    Text = '  /  /    '
  end
  object MkEditDtFinal: TMaskEdit [7]
    Left = 81
    Top = 24
    Width = 66
    Height = 23
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 1
    Text = '  /  /    '
  end
  inherited DtSrc: TDataSource
    Left = 800
  end
end
