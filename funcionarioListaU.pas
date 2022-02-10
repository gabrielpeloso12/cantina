unit funcionarioListaU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, modeloListaU, Data.DB, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmFuncionarioListaU = class(TfrmModeloLista)
    procedure btnEditarClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFuncionarioListaU: TfrmFuncionarioListaU;

implementation

{$R *.dfm}
  uses dmU, PrincipalU, funcionarioDadosU;

procedure TfrmFuncionarioListaU.btnAdicionarClick(Sender: TObject);
begin
  inherited;

  frmPrincipal.abreForm(TfrmFuncionarioDados);
end;

procedure TfrmFuncionarioListaU.btnEditarClick(Sender: TObject);
begin
  inherited;

  frmPrincipal.abreForm(TfrmFuncionarioDados);
end;

end.
