object frmRelatorio: TfrmRelatorio
  Left = 0
  Top = 0
  Caption = 'frmRelatorio'
  ClientHeight = 510
  ClientWidth = 907
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object frxCliente: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44597.698730381900000000
    ReportOptions.LastChange = 44597.900742893500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 232
    Top = 96
    Datasets = <
      item
        DataSet = frxdbCliente
        DataSetName = 'Cliente'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Color = clHighlightText
      object rbTitulo: TfrxReportTitle
        FillType = ftBrush
        Height = 113.385900000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Top = 7.559060000000000000
          Width = 634.961040000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'ELETR'#212' - Sistema da Cantina')
        end
        object Memo2: TfrxMemoView
          Align = baWidth
          Top = 49.133890000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de Clientes')
          ParentFont = False
        end
        object Date: TfrxMemoView
          Align = baRight
          Left = 634.961040000000000000
          Top = 7.559060000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[Date]')
        end
      end
      object mdCliente: TfrxMasterData
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 22.677180000000000000
        ParentFont = False
        Top = 234.330860000000000000
        Width = 718.110700000000000000
        DataSet = frxdbCliente
        DataSetName = 'Cliente'
        RowCount = 0
        object Clientec_nome: TfrxMemoView
          Align = baLeft
          Width = 234.330860000000000000
          Height = 22.677180000000000000
          DataField = 'c_nome'
          DataSet = frxdbCliente
          DataSetName = 'Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[Cliente."c_nome"]')
          ParentFont = False
        end
        object Clientec_escola: TfrxMemoView
          Align = baLeft
          Left = 234.330860000000000000
          Width = 283.464750000000000000
          Height = 22.677180000000000000
          DataField = 'c_escola'
          DataSet = frxdbCliente
          DataSetName = 'Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[Cliente."c_escola"]')
          ParentFont = False
        end
        object Clientec_curso: TfrxMemoView
          Align = baLeft
          Left = 517.795610000000000000
          Width = 177.637910000000000000
          Height = 22.677180000000000000
          DataField = 'c_curso'
          DataSet = frxdbCliente
          DataSetName = 'Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[Cliente."c_curso"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 192.756030000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Align = baLeft
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = cl3DLight
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Align = baLeft
          Left = 234.330860000000000000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = cl3DLight
          Memo.UTF8W = (
            'Escola')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Align = baLeft
          Left = 517.795610000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = cl3DLight
          Memo.UTF8W = (
            'Curso')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 317.480520000000000000
        Width = 718.110700000000000000
        object Page: TfrxMemoView
          Align = baRight
          Left = 668.976810000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Page]')
          ParentFont = False
        end
      end
    end
  end
  object frxdbCliente: TfrxDBDataset
    UserName = 'Cliente'
    CloseDataSource = False
    DataSet = dmCantina.fdtbCliente
    BCDToCurrency = False
    Left = 392
    Top = 96
  end
end
