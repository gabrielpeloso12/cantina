inherited frmFuncionarioDados: TfrmFuncionarioDados
  Caption = 'Dados do Funcion'#225'rio'
  ClientWidth = 750
  ExplicitWidth = 766
  ExplicitHeight = 445
  PixelsPerInch = 96
  TextHeight = 13
  inherited gbDados: TGroupBox
    Width = 750
    ExplicitWidth = 750
    ExplicitHeight = 326
    object Label1: TLabel
      Left = 52
      Top = 37
      Width = 15
      Height = 13
      Caption = 'ID:'
      FocusControl = dbeID
    end
    object Label2: TLabel
      Left = 52
      Top = 80
      Width = 31
      Height = 13
      Caption = 'Nome:'
      FocusControl = dbeNome
    end
    object Label3: TLabel
      Left = 52
      Top = 130
      Width = 40
      Height = 13
      Caption = 'Usuario:'
      FocusControl = dbeUsuario
    end
    object Label4: TLabel
      Left = 52
      Top = 176
      Width = 34
      Height = 13
      Caption = 'Senha:'
      FocusControl = dbeSenha
    end
    object Label5: TLabel
      Left = 236
      Top = 37
      Width = 29
      Height = 13
      Caption = 'Ativo:'
    end
    object Label6: TLabel
      Left = 414
      Top = 80
      Width = 74
      Height = 13
      Caption = 'Data Cadastro:'
      FocusControl = dbeDataCadastro
    end
    object Label7: TLabel
      Left = 414
      Top = 130
      Width = 64
      Height = 13
      Caption = 'Data Inativo:'
      FocusControl = dbeDataInativo
    end
    object dbeID: TDBEdit
      Left = 73
      Top = 34
      Width = 96
      Height = 21
      TabStop = False
      DataField = 'f_id'
      DataSource = ds
      ReadOnly = True
      TabOrder = 4
    end
    object dbeNome: TDBEdit
      Left = 52
      Top = 99
      Width = 300
      Height = 21
      CharCase = ecUpperCase
      DataField = 'f_nome'
      DataSource = ds
      TabOrder = 1
    end
    object dbeUsuario: TDBEdit
      Left = 52
      Top = 149
      Width = 300
      Height = 21
      CharCase = ecUpperCase
      DataField = 'f_usuario'
      DataSource = ds
      TabOrder = 2
    end
    object dbeSenha: TDBEdit
      Left = 52
      Top = 195
      Width = 300
      Height = 21
      DataField = 'f_senha'
      DataSource = ds
      PasswordChar = '*'
      TabOrder = 3
    end
    object dbeDataCadastro: TDBEdit
      Left = 414
      Top = 99
      Width = 280
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      DataField = 'f_data_cadastro'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object dbeDataInativo: TDBEdit
      Left = 414
      Top = 149
      Width = 280
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      DataField = 'f_data_inativo'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object dbcAtivo: TDBComboBox
      Left = 271
      Top = 34
      Width = 49
      Height = 21
      CharCase = ecUpperCase
      DataField = 'f_ativo'
      DataSource = ds
      Items.Strings = (
        'S'
        'N')
      TabOrder = 0
    end
  end
  inherited pnControle: TPanel
    Width = 750
    ExplicitTop = 326
    ExplicitWidth = 750
    inherited btnFechar: TBitBtn
      Left = 663
      ExplicitLeft = 663
      ExplicitTop = 2
    end
    inherited btnCancelar: TBitBtn
      Left = 572
      ExplicitLeft = 572
    end
    inherited btnSalvar: TBitBtn
      Left = 486
      ExplicitLeft = 486
      ExplicitTop = 2
    end
  end
  inherited ds: TDataSource
    DataSet = dmCantina.fdtbFuncionario
    Left = 456
    Top = 33
  end
end
