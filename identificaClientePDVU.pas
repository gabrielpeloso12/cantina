unit identificaClientePDVU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, identificaClienteU, Data.DB,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmIdentificaContaPDV = class(TfrmIdentificaConta)
    btnClientePadrao: TBitBtn;
    procedure btnClientePadraoClick(Sender: TObject);
    procedure btnEscolheClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIdentificaContaPDV: TfrmIdentificaContaPDV;

implementation

uses PontoVendaU, PrincipalU, dmU;

{$R *.dfm}



procedure TfrmIdentificaContaPDV.btnClientePadraoClick(Sender: TObject);
begin

    with (frmPrincipal.buscaForm(TfrmPontoVenda) as TfrmPontoVenda) do
    begin
      IDCliente := 1;
      edtCliente.Text := 'Cliente Padr�o';
      dmCantina.fdtbVenda.Edit;
      dmCantina.fdtbVenda.FieldByName('v_cliente').Value := IDCliente;
      dmCantina.fdtbVenda.Post;
      edtNovoSaldo.Clear;
      edtSaldoAtual.Clear;
    end;

    self.Close;
    //APENAS TESTE  (frmPrincipal.buscaForm(TfrmPontoVenda) as TfrmPontoVenda).edtCliente.Text := 'Cliente Padr�o';

end;

procedure TfrmIdentificaContaPDV.btnEscolheClick(Sender: TObject);
var
    novosaldo, saldo: real;
begin
    with (frmPrincipal.buscaForm(TfrmPontoVenda) as TfrmPontoVenda) do
    begin
      IDCliente := dmCantina.fdClienteQuery.FieldByName('c_id').Value;
      edtCliente.Text := dmCantina.fdClienteQuery.FieldByName('c_nome').Value;

      dmCantina.fdtbVenda.Edit;
      dmCantina.fdtbVenda.FieldByName('v_cliente').Value := IDCliente;
      dmCantina.fdtbVenda.Post;

      saldo := dmCantina.fdClienteQuery.FieldByName('co_saldo').Value; //Grava o saldo em uma variavel temporaria
      novosaldo := saldo - dmCantina.fdtbVenda.FieldByName('v_total').Value; //Calcula o novo saldo

      edtSaldoAtual.Text := FloatToStr(saldo);
      edtNovoSaldo.Text := FormatFloat('R$: #.###.00', novosaldo);
    end;

       self.Close;
    // APENAS TESTE (frmPrincipal.buscaForm(TfrmPontoVenda) as TfrmPontoVenda).edtCliente.Text := 'Cliente Padr�o';

end;

end.
