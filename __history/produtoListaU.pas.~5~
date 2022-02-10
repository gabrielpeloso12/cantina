unit produtoListaU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, modeloListaU, Data.DB, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmProdutoListaU = class(TfrmModeloLista)
    procedure btnEditarClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutoListaU: TfrmProdutoListaU;

implementation

{$R *.dfm}

uses dmU, produtoDadosU, principalU;

procedure TfrmProdutoListaU.btnAdicionarClick(Sender: TObject);
begin
  inherited;

  frmPrincipal.abreForm(TfrmProdutoDados);

end;

procedure TfrmProdutoListaU.btnEditarClick(Sender: TObject);
begin
  inherited;

  frmPrincipal.abreForm(TfrmProdutoDados);

end;

end.
