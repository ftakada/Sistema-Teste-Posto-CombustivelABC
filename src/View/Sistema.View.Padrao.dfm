object ViewPadrao: TViewPadrao
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'ViewPadrao'
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
  object DBGridLista: TDBGrid
    Left = 0
    Top = 42
    Width = 988
    Height = 470
    Align = alBottom
    DataSource = DtSrc
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object BtnFiltrar: TButton
    Left = 8
    Top = 10
    Width = 75
    Height = 25
    Caption = 'Filtrar'
    TabOrder = 1
  end
  object DtSrc: TDataSource
    Left = 488
  end
end
