inherited ViewTanques: TViewTanques
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Tanques Combustivel'
  ClientHeight = 512
  ClientWidth = 988
  OnClose = FormClose
  TextHeight = 15
  inherited DBGridLista: TDBGrid
    Top = 42
    Width = 988
    OnDrawColumnCell = DBGridListaDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 164
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOCOMBUSTIVEL'
        Title.Caption = 'Tp.Combustivel'
        Width = 118
        Visible = True
      end>
  end
  inherited BtnFiltrar: TButton
    OnClick = BtnFiltrarClick
  end
  inherited DtSrc: TDataSource
    Left = 664
  end
end
