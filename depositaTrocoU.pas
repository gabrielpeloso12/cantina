unit depositaTrocoU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, identificaClienteU, Data.DB,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmdepositaTroco = class(TfrmIdentificaConta)
    procedure btnEscolheClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmdepositaTroco: TfrmdepositaTroco;

implementation

{$R *.dfm}
  uses principalU, dmU, pontoVendaU;

procedure TfrmdepositaTroco.btnEscolheClick(Sender: TObject);
var
    troco: real;

begin
        if Length ((frmPrincipal.buscaForm(TfrmpontoVenda) as TfrmPontoVenda).edtTroco.Text) > 0 then
     begin
        troco := StrToFloat((frmPrincipal.buscaForm(TfrmpontoVenda) as TfrmPontoVenda).edtTroco.Text);
        ds.DataSet.edit;
        ds.DataSet.FieldByName('co_saldo').Value := ds.DataSet.FieldByName('co_saldo').Value+troco;
        ds.DataSet.Post;
        (frmPrincipal.buscaForm(TfrmpontoVenda) as TfrmPontoVenda).edtValor.Enabled := false;
        (frmPrincipal.buscaForm(TfrmpontoVenda) as TfrmPontoVenda).edtTroco.Clear;
     end;
        Self.Close;

end;

end.
