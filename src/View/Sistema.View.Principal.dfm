object ViewPrincipal: TViewPrincipal
  Left = 0
  Top = 0
  Caption = 'Posto de Combustivel ABC'
  ClientHeight = 626
  ClientWidth = 1235
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu
  Position = poDesigned
  WindowState = wsMaximized
  TextHeight = 15
  object MainMenu: TMainMenu
    Left = 48
    Top = 8
    object MenuItemCadastro: TMenuItem
      Caption = 'Cadastro'
      object MenuItemCadTanques: TMenuItem
        Action = ATanques
        Caption = 'Tanques de combust'#237'vel'
      end
      object MenuItemCadBombas: TMenuItem
        Action = ABombas
      end
    end
    object MenuItemLancamentos: TMenuItem
      Caption = 'Lan'#231'amentos'
      object MenuItemLanAbastecimentos: TMenuItem
        Action = AAbastecimentos
      end
    end
    object Relatrio1: TMenuItem
      Caption = 'Relat'#243'rios'
      object MenuItemRelAbatecimento: TMenuItem
        Action = ARelatorioAbastecimento
      end
    end
  end
  object ActionManager: TActionManager
    Left = 136
    Top = 8
    StyleName = 'Platform Default'
    object ATanques: TAction
      Category = 'Cadastros'
      Caption = 'Tanques'
      OnExecute = ATanquesExecute
    end
    object ABombas: TAction
      Category = 'Cadastros'
      Caption = 'Bombas'
      OnExecute = ABombasExecute
    end
    object AAbastecimentos: TAction
      Category = 'Lancamentos'
      Caption = 'Abastecimentos'
      OnExecute = AAbastecimentosExecute
    end
    object ARelatorioAbastecimento: TAction
      Category = 'Relat'#243'rio'
      Caption = 'Relat'#243'rio Abastecimento'
      OnExecute = ARelatorioAbastecimentoExecute
    end
  end
end
