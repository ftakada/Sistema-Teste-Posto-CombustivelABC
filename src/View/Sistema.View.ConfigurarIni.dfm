object ViewConfigurarIni: TViewConfigurarIni
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Configure a Conex'#227'o com o Banco de Dados'
  ClientHeight = 179
  ClientWidth = 388
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  Visible = True
  TextHeight = 15
  object LabelCaminhoBanco: TLabel
    Left = 16
    Top = 16
    Width = 102
    Height = 15
    Caption = 'Caminho do Banco'
  end
  object LabelUsuario: TLabel
    Left = 16
    Top = 48
    Width = 40
    Height = 15
    Caption = 'Usu'#225'rio'
  end
  object LabelSenha: TLabel
    Left = 16
    Top = 80
    Width = 32
    Height = 15
    Caption = 'Senha'
  end
  object LabelServidor: TLabel
    Left = 16
    Top = 112
    Width = 43
    Height = 15
    Caption = 'Servidor'
  end
  object EditCaminhoBanco: TEdit
    Left = 120
    Top = 16
    Width = 250
    Height = 23
    TabOrder = 0
  end
  object EditUsuario: TEdit
    Left = 120
    Top = 48
    Width = 250
    Height = 23
    TabOrder = 1
  end
  object EditSenha: TEdit
    Left = 120
    Top = 80
    Width = 250
    Height = 23
    PasswordChar = '*'
    TabOrder = 2
  end
  object EditServidor: TEdit
    Left = 120
    Top = 112
    Width = 250
    Height = 23
    TabOrder = 3
  end
  object BotaoSalvar: TButton
    Left = 120
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 4
    OnClick = BotaoSalvarClick
  end
  object BotaoCancelar: TButton
    Left = 200
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 5
    OnClick = BotaoCancelarClick
  end
end
