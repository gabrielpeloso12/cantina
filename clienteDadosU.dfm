inherited frmClienteDados: TfrmClienteDados
  Caption = 'Dados do Cliente'
  PixelsPerInch = 96
  TextHeight = 13
  inherited gbDados: TGroupBox
    Height = 328
    ExplicitWidth = 721
    ExplicitHeight = 279
    object Label1: TLabel
      Left = 36
      Top = 29
      Width = 15
      Height = 13
      Caption = 'ID:'
      FocusControl = dbeID
    end
    object Label2: TLabel
      Left = 37
      Top = 63
      Width = 31
      Height = 13
      Caption = 'Nome:'
      FocusControl = dbeNome
    end
    object Label3: TLabel
      Left = 403
      Top = 63
      Width = 28
      Height = 13
      Caption = 'Sexo:'
    end
    object Label4: TLabel
      Left = 37
      Top = 155
      Width = 28
      Height = 13
      Caption = 'Email:'
      FocusControl = dbeEmail
    end
    object Label5: TLabel
      Left = 403
      Top = 155
      Width = 34
      Height = 13
      Caption = 'Senha:'
      FocusControl = dbeSenha
    end
    object Label6: TLabel
      Left = 37
      Top = 109
      Width = 32
      Height = 13
      Caption = 'Curso:'
      FocusControl = dbeCurso
    end
    object Label7: TLabel
      Left = 403
      Top = 109
      Width = 34
      Height = 13
      Caption = 'Escola:'
      FocusControl = dbeEscola
    end
    object Label8: TLabel
      Left = 171
      Top = 29
      Width = 29
      Height = 13
      Caption = 'Ativo:'
    end
    object Label9: TLabel
      Left = 36
      Top = 201
      Width = 74
      Height = 13
      Caption = 'Data Cadastro:'
      FocusControl = dbeCadastro
    end
    object Label10: TLabel
      Left = 404
      Top = 201
      Width = 64
      Height = 13
      Caption = 'Data Inativo:'
      FocusControl = dbeInativo
    end
    object dbeID: TDBEdit
      Left = 57
      Top = 26
      Width = 53
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      DataField = 'c_id'
      DataSource = ds
      ReadOnly = True
      TabOrder = 0
    end
    object dbeNome: TDBEdit
      Left = 36
      Top = 82
      Width = 300
      Height = 21
      CharCase = ecUpperCase
      DataField = 'c_nome'
      DataSource = ds
      TabOrder = 2
    end
    object dbeEmail: TDBEdit
      Left = 36
      Top = 174
      Width = 300
      Height = 21
      CharCase = ecUpperCase
      DataField = 'c_email'
      DataSource = ds
      TabOrder = 6
    end
    object dbeSenha: TDBEdit
      Left = 404
      Top = 174
      Width = 300
      Height = 21
      DataField = 'c_senha'
      DataSource = ds
      PasswordChar = '*'
      TabOrder = 7
    end
    object dbeCurso: TDBEdit
      Left = 36
      Top = 128
      Width = 300
      Height = 21
      CharCase = ecUpperCase
      DataField = 'c_curso'
      DataSource = ds
      TabOrder = 4
    end
    object dbeEscola: TDBEdit
      Left = 403
      Top = 128
      Width = 300
      Height = 21
      CharCase = ecUpperCase
      DataField = 'c_escola'
      DataSource = ds
      TabOrder = 5
    end
    object dbeCadastro: TDBEdit
      Left = 36
      Top = 220
      Width = 195
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      DataField = 'c_data_cadastro'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxLength = 8
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object dbeInativo: TDBEdit
      Left = 403
      Top = 220
      Width = 197
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      DataField = 'c_data_inativo'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxLength = 8
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
    object dbcAtivo: TDBComboBox
      Left = 206
      Top = 26
      Width = 49
      Height = 21
      CharCase = ecUpperCase
      DataField = 'c_ativo'
      DataSource = ds
      Items.Strings = (
        'S'
        'N')
      TabOrder = 1
    end
    object dbcSexo: TDBComboBox
      Left = 403
      Top = 82
      Width = 42
      Height = 21
      CharCase = ecUpperCase
      DataField = 'c_sexo'
      DataSource = ds
      Items.Strings = (
        'M'
        'F')
      TabOrder = 3
    end
  end
  inherited pnControle: TPanel
    Top = 328
    Height = 78
    ExplicitTop = 279
    ExplicitWidth = 721
    ExplicitHeight = 78
    inherited btnFechar: TBitBtn
      Height = 74
      TabOrder = 2
      ExplicitLeft = 634
      ExplicitHeight = 74
    end
    inherited btnCancelar: TBitBtn
      Height = 74
      ExplicitLeft = 543
      ExplicitHeight = 74
    end
    inherited btnSalvar: TBitBtn
      Height = 74
      TabOrder = 0
      ExplicitHeight = 74
    end
  end
  inherited ds: TDataSource
    DataSet = dmCantina.fdtbCliente
    Left = 664
    Top = 33
  end
end
