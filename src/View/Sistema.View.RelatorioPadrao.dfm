object ViewRelatorioPadrao: TViewRelatorioPadrao
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'ViewRealtorioPadrao'
  ClientHeight = 512
  ClientWidth = 988
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  Visible = True
  OnCreate = FormCreate
  TextHeight = 15
  object RLReport: TRLReport
    Left = 112
    Top = 112
    Width = 794
    Height = 1123
    DataSource = DtSrc
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
  end
  object Button1: TButton
    Left = 392
    Top = 8
    Width = 129
    Height = 25
    Caption = 'Visualizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object DtSrc: TDataSource
    Left = 488
  end
end
