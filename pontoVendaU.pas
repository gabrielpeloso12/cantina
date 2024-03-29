unit pontoVendaU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls, Vcl.Mask;

type
  TfrmPontoVenda = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    gbProdutos: TGroupBox;
    gbItens: TGroupBox;
    dbgItens: TDBGrid;
    dbgProdutos: TDBGrid;
    Panel4: TPanel;
    lbFiltro: TLabel;
    edtFiltro: TEdit;
    dsProduto: TDataSource;
    dsVenda: TDataSource;
    dsVendaItem: TDataSource;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    btnCliente: TBitBtn;
    edtCliente: TEdit;
    btnRemover: TBitBtn;
    btnAdicionar: TBitBtn;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    btnDepositarTroco: TBitBtn;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dbeTotal: TDBEdit;
    dbcFormaPagamento: TDBComboBox;
    Label3: TLabel;
    Label4: TLabel;
    edtValor: TEdit;
    edtTroco: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtSaldoAtual: TEdit;
    edtNovoSaldo: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dbgProdutosTitleClick(Column: TColumn);
    procedure edtFiltroChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnClienteClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorChange(Sender: TObject);
    procedure dbcFormaPagamentoChange(Sender: TObject);
    procedure btnDepositarTrocoClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPontoVenda: TfrmPontoVenda;
  Campo : string;
  IDCliente : Integer;

implementation

{$R *.dfm}

uses PrincipalU, dmU, identificaclientePDVU, depositaTrocoU;

procedure TfrmPontoVenda.btnAdicionarClick(Sender: TObject);
var
    saldo, novosaldo: real;

begin
    // Se n�o encontrar o produto escolhido pelo vendedor ent�o cadastra o produto
    if not dsVendaItem.DataSet.Locate ('vi_produto', dsProduto.DataSet.FieldByName('p_id').Value, [loCaseInsensitive]) then
    begin
      with dsVendaItem.DataSet do
      begin
          Append;
            //FieldByName('vi_status').Value := 'ABERTO';
            FieldByName('vi_produto').Value := dsProduto.DataSet.FieldByName('p_id').Value;
            FieldByName('vi_cliente').Value := IDCliente;
            FieldByName('vi_valor').Value := dsProduto.DataSet.FieldByName('p_preco').Value;
            FieldByName('vi_quantidade').Value := 1;
            FieldByName('vi_total').Value := FieldByName('vi_quantidade').Value * FieldByName('vi_valor').Value;
          post;
      end;
    end
    else  // Produto j� inserido antes, apenas aumenta a quantidade e calcula o sub-total
    begin
        with dsVendaItem.DataSet do
        begin
           Edit;
              FieldByName('vi_quantidade').Value := FieldByName('vi_quantidade').Value + 1;
              FieldByName('vi_total').Value := FieldByName('vi_quantidade').Value * FieldByName('vi_valor').Value;
           Post;
        end;
    end;

    //Atualiza a query para mostrar o nome do produto
    dsVendaItem.DataSet.Refresh;

    //Calcula o total a pagar da compra
     with dmCantina.qrCalculaTotal do
     begin
     Params[0].Value := dsVenda.DataSet.FieldByName('v_id').Value;
     Open;
     dsVenda.DataSet.Edit;
     dsVenda.DataSet.FieldByName('v_total').Value := FieldByName('Total').Value;
     dsVenda.DataSet.Post;
     Close;
     end;

      //Caso a forma de pagamento seja Niblle (conta do usuario) atualiza saldos
      if UpperCase (dbcFormaPagamento.Text) = 'NIBLLE' then
      begin
        saldo := StrToCurr (edtSaldoAtual.Text); //Grava o saldo em uma variavel temporaria
        novosaldo := saldo - dmCantina.fdtbVenda.FieldByName('v_total').Value; //Calcula o novo saldo
        //edtSaldoAtual.Text := FormatFloat('R$: #.###.00', saldo);
        edtNovoSaldo.Text := FormatFloat('R$: #.###.00', novosaldo);
      end;


      dsProduto.DataSet.Filter := '';
      dsProduto.DataSet.Filtered := false;
      edtFiltro.Clear;
end;

procedure TfrmPontoVenda.btnClienteClick(Sender: TObject);
begin
    frmPrincipal.abreForm(TfrmIdentificaContaPDV);
end;

procedure TfrmPontoVenda.btnDepositarTrocoClick(Sender: TObject);
begin
    frmPrincipal.abreForm(TfrmDepositaTroco);
end;

procedure TfrmPontoVenda.btnOkClick(Sender: TObject);
var
    novoSaldo: string;

begin
    with dsVenda.DataSet do
    begin
      edit;
        FieldByName('v_status').Value := 'ABERTO';
      post;
      if UpperCase(FieldByName ('v_forma_pagamento').Value) = 'NIBLLE' then
      begin
        dmCantina.fdClienteQuery.Open;
          dmCantina.fdClienteQuery.Locate('c_id', IDCliente, []);
          novoSaldo := edtNovoSaldo.Text;
          System.Delete(novoSaldo, 1, 4);
          dmCantina.fdClienteQuery.Edit;
          dmCantina.fdClienteQuery.FieldByName('c_saldo').Value := StrToFloat(edtNovoSaldo.Text);
          dmCantina.fdClienteQuery.Post;

      end;


    end;

end;

procedure TfrmPontoVenda.btnRemoverClick(Sender: TObject);
var
    saldo, novosaldo: real;
begin
    dsVendaItem.DataSet.Delete;

    //Calcula o total a pagar da compra
     with dmCantina.qrCalculaTotal do
     begin
     Params[0].Value := dsVenda.DataSet.FieldByName('v_id').Value;
     Open;
     dsVenda.DataSet.Edit;
     dsVenda.DataSet.FieldByName('v_total').Value := FieldByName('Total').Value;
     dsVenda.DataSet.Post;
     Close;
     end;

      //Caso a forma de pagamento seja Niblle (conta do usuario) atualiza saldos
      if UpperCase (dbcFormaPagamento.Text) = 'NIBLLE' then
      begin
        saldo := dmCantina.fdClienteQuery.FieldByName('co_saldo').Value; //Grava o saldo em uma variavel temporaria
        novosaldo := saldo - dmCantina.fdtbVenda.FieldByName('v_total').Value; //Calcula o novo saldo
        edtNovoSaldo.Text := FormatFloat('R$: #.###.00', novosaldo);
      end;

end;

procedure TfrmPontoVenda.dbcFormaPagamentoChange(Sender: TObject);
var
    saldo, novosaldo: real;
begin
    if Length (edtSaldoAtual.Text) > 0 then
    begin
       //Caso a forma de pagamento seja Niblle (conta do usuario) atualiza saldos
      if UpperCase (dbcFormaPagamento.Text) = 'NIBLLE' then
      begin
        saldo := StrToCurr (edtSaldoAtual.Text); //Grava o saldo em uma variavel temporaria
        novosaldo := saldo - dmCantina.fdtbVenda.FieldByName('v_total').Value; //Calcula o novo saldo
        //edtSaldoAtual.Text := FormatFloat('R$: #.###.00', saldo);
        edtNovoSaldo.Text := FormatFloat('R$: #.###.00', novosaldo);
      end;
    end;
end;

procedure TfrmPontoVenda.dbgProdutosTitleClick(Column: TColumn);
begin

    Campo := Column.FieldName;
    lbFiltro.Caption := Column.Title.Caption+': ';
    edtFiltro.Clear;

end;

procedure TfrmPontoVenda.edtValorChange(Sender: TObject);
var
    valor: real;
    troco: real;
begin
    if Length (edtValor.Text) > 0 then
    begin
      Valor := StrToFloat(edtValor.Text);
      Troco := valor - dsVenda.DataSet.FieldByName('v_total').AsFloat;
      edtTroco.Text := FloatToStr(troco);
    end
    else
    edtTroco.Clear;

end;

procedure TfrmPontoVenda.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
    if not (key in ['0' .. '9', ',', char (VK_BACK)]) then
      begin
        key := #0;
      end;
end;

procedure TfrmPontoVenda.edtFiltroChange(Sender: TObject);
begin
    if Length(edtFiltro.Text) > 0  then
    begin
      if dsProduto.DataSet.FieldByName (Campo) is TStringField  then
      begin
         dsProduto.DataSet.Filter := Campo +' like '+ QuotedStr('%'+edtFiltro.Text+'%');
      end
       Else
       begin
         dsProduto.DataSet.Filter := Campo +' = '+edtFiltro.Text;
       end;

       dsProduto.DataSet.Filtered := true;
    end
    else
      dsProduto.DataSet.Filtered := false;
end;

procedure TfrmPontoVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    dsProduto.DataSet.Close;
    dsVenda.DataSet.Close;
    dsVendaItem.DataSet.Close;

    Action := caFree;
    self := nil;
end;

procedure TfrmPontoVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key = VK_ESCAPE then
    begin
      Self.Close;
    end;
end;

procedure TfrmPontoVenda.FormShow(Sender: TObject);
begin

    dsProduto.DataSet.Open;
    dsVenda.DataSet.Open;
    dsVendaItem.DataSet.Open;
    dmCantina.fdClienteQuery.Open;

    IDCliente := 1;
    edtCliente.Text := 'Cliente Padr�o';

    Campo := 'p_id';
    dsVendaItem.DataSet.Filtered := false;
    lbFiltro.Caption := 'ID: ';
    edtFiltro.Clear;

    edtValor.Enabled := true;

    with dsVenda.DataSet do
    begin
      Append;
        FieldByName('v_origem').Value := 'CAIXA';
        FieldByName('v_forma_pagamento').Value := 'DINHEIRO';
        FieldByName('v_cliente').Value := 1;   //Define cliente padr�o (n�o identificado) pode ser alterado posteriormente
        FieldByName('v_caixa').Value := 1;  // Codigo do usuario que fez login no sistema (montagem posterior de login do sistema)
        FieldByName('v_status').Value := 'CONSUMADO';  // Pois � alterado quando cliente pega produto e n�o quando paga
        FieldByName('v_data').Value := now;  // Data da compra e n�o a data da consuma��o
      post;
    end;



end;

end.
