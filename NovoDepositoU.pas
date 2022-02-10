unit NovoDepositoU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmDeposito = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edtValor: TEdit;
    btnCancelar: TBitBtn;
    btnDepositar: TBitBtn;
    procedure btnDepositarClick(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDeposito: TfrmDeposito;

implementation

{$R *.dfm}

uses dmU;

procedure TfrmDeposito.btnCancelarClick(Sender: TObject);
begin
      close;
end;

procedure TfrmDeposito.btnDepositarClick(Sender: TObject);
var
      deposito : real;
begin

      deposito := StrToFloat (edtValor.Text);

      dmCantina.fdClienteQuery.Edit;
      dmCantina.fdClienteQueryco_saldo.Value := dmCantina.fdClienteQueryco_saldo.Value +  deposito;
      dmCantina.fdClienteQuery.Post;
      dmCantina.fdClienteQuery.ApplyUpdates;

      close;
end;

procedure TfrmDeposito.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
      if not (key in ['0' .. '9', ',', char (VK_BACK)]) then
      begin
        key := #0;
      end;
end;

procedure TfrmDeposito.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action := caFree;
      Self := nil;
end;

procedure TfrmDeposito.FormKeyDown(Sender: TObject; var Key: Word;
 Shift: TShiftState);
begin
    if key = VK_ESCAPE then
    begin
      Self.Close;
    end;
end;

end.
