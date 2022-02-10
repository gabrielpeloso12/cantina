inherited frmClienteListaU: TfrmClienteListaU
  Caption = 'Lista de Clientes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited gbDados: TGroupBox
    inherited dbgDados: TDBGrid
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'c_id'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'c_ativo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'c_nome'
          Width = 300
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'c_sexo'
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'c_email'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'c_senha'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'c_curso'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'c_escola'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'c_data_cadastro'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'c_data_inativo'
          Visible = True
        end>
    end
  end
  inherited pnControle: TPanel
    inherited btnEditar: TBitBtn
      OnClick = btnEditarClick
    end
  end
  inherited ds: TDataSource
    DataSet = dmCantina.fdtbCliente
  end
end
