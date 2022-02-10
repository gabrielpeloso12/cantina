unit identificaClienteU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, modeloListaU, Data.DB, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmIdentificaConta = class(TfrmModeloLista)
    pnControle2: TPanel;
    btnEscolhe: TBitBtn;
    btnVoltar: TBitBtn;
    procedure btnVoltarClick(Sender: TObject);
    procedure btnEscolheClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIdentificaConta: TfrmIdentificaConta;

implementation

{$R *.dfm}

uses dmU,PrincipalU, NovoDepositoU;

procedure TfrmIdentificaConta.btnEscolheClick(Sender: TObject);
begin
    inherited;

    frmPrincipal.abreForm(TfrmDeposito);
end;

procedure TfrmIdentificaConta.btnVoltarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
