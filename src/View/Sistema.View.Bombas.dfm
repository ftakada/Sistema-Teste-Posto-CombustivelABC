inherited ViewBombas: TViewBombas
  Caption = 'Bombas de combustivel'
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 996
  ExplicitHeight = 549
  TextHeight = 15
  inherited DBGridLista: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 232
        Visible = True
      end>
  end
  inherited BtnFiltrar: TButton
    OnClick = BtnFiltrarClick
  end
end
