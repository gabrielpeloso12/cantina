unit dmU;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TdmCantina = class(TDataModule)
    fdConexao: TFDConnection;
    fdDriver: TFDPhysMySQLDriverLink;
    fdtbCliente: TFDTable;
    fdtbFuncionario: TFDTable;
    fdtbProduto: TFDTable;
    fdtbVenda: TFDTable;
    fdtbClientec_id: TFDAutoIncField;
    fdtbClientec_nome: TStringField;
    fdtbClientec_sexo: TStringField;
    fdtbClientec_email: TStringField;
    fdtbClientec_senha: TStringField;
    fdtbClientec_curso: TStringField;
    fdtbClientec_escola: TStringField;
    fdtbClientec_ativo: TStringField;
    fdtbClientec_data_cadastro: TDateTimeField;
    fdtbClientec_data_inativo: TDateTimeField;
    fdtbFuncionariof_id: TFDAutoIncField;
    fdtbFuncionariof_nome: TStringField;
    fdtbFuncionariof_usuario: TStringField;
    fdtbFuncionariof_senha: TStringField;
    fdtbFuncionariof_ativo: TStringField;
    fdtbFuncionariof_data_cadastro: TDateTimeField;
    fdtbFuncionariof_data_inativo: TDateTimeField;
    fdtbProdutop_id: TLargeintField;
    fdtbProdutop_nome: TStringField;
    fdtbProdutop_foto: TBlobField;
    fdtbProdutop_preco: TFloatField;
    fdtbProdutop_custo: TFloatField;
    fdtbProdutop_quantidade: TLongWordField;
    fdtbProdutop_qtd_alerta: TLongWordField;
    fdtbProdutop_ativo: TStringField;
    fdtbProdutop_data_cadastro: TDateTimeField;
    fdtbProdutop_data_inativo: TDateTimeField;
    fdtbVendav_id: TLargeintField;
    fdtbVendav_cliente: TLongWordField;
    fdtbVendav_caixa: TLongWordField;
    fdtbVendav_atendente: TLongWordField;
    fdtbVendav_total: TFloatField;
    fdtbVendav_forma_pagamento: TStringField;
    fdtbVendav_origem: TStringField;
    fdtbVendav_data_consumo: TDateTimeField;
    fdtbVendav_data: TDateTimeField;
    fdtbVendav_data_devolucao: TDateTimeField;
    fdClienteQuery: TFDQuery;
    fdClienteQueryc_id: TFDAutoIncField;
    fdClienteQueryc_nome: TStringField;
    fdClienteQueryc_sexo: TStringField;
    fdClienteQueryc_email: TStringField;
    fdClienteQueryc_senha: TStringField;
    fdClienteQueryc_curso: TStringField;
    fdClienteQueryc_escola: TStringField;
    fdClienteQueryc_ativo: TStringField;
    fdClienteQueryc_data_cadastro: TDateTimeField;
    fdClienteQueryc_data_inativo: TDateTimeField;
    fdClienteQueryco_saldo: TFloatField;
    updClient: TFDUpdateSQL;
    fdqueryVendaItem: TFDQuery;
    updVendaItem: TFDUpdateSQL;
    dsVenda: TDataSource;
    fdqueryVendaItemvi_id: TLargeintField;
    fdqueryVendaItemvi_produto: TLargeintField;
    fdqueryVendaItemvi_cliente: TLongWordField;
    fdqueryVendaItemvi_venda: TLargeintField;
    fdqueryVendaItemvi_valor: TFloatField;
    fdqueryVendaItemvi_quantidade: TLongWordField;
    fdqueryVendaItemvi_total: TFloatField;
    fdqueryVendaItemvi_prod_trocado: TLongWordField;
    fdqueryVendaItemP_NOME: TStringField;
    fdqueryVendaItemP_PRECO: TFloatField;
    fdqueryVendaItemP_QUANTIDADE: TLongWordField;
    readonlyProduto: TFDQuery;
    readonlyProdutop_id: TLargeintField;
    readonlyProdutop_nome: TStringField;
    readonlyProdutop_foto: TBlobField;
    readonlyProdutop_preco: TFloatField;
    readonlyProdutop_custo: TFloatField;
    readonlyProdutop_quantidade: TLongWordField;
    readonlyProdutop_qtd_alerta: TLongWordField;
    readonlyProdutop_ativo: TStringField;
    readonlyProdutop_data_cadastro: TDateTimeField;
    readonlyProdutop_data_inativo: TDateTimeField;
    fdtbVendav_status: TStringField;
    qrCalculaTotal: TFDQuery;
    fdqueryVendaItemvi_status: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCantina: TdmCantina;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
