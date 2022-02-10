inherited frmFuncionarioListaU: TfrmFuncionarioListaU
  Caption = 'Lista De Funcion'#225'rio'
  PixelsPerInch = 96
  TextHeight = 13
  inherited gbDados: TGroupBox
    ExplicitHeight = 257
  end
  inherited pnControle: TPanel
    ExplicitTop = 362
    inherited btnEditar: TBitBtn
      OnClick = btnEditarClick
    end
  end
  inherited ds: TDataSource
    DataSet = dmCantina.fdtbFuncionario
  end
end
