unit clienteListaU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, modeloListaU, Data.DB, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmClienteListaU = class(TfrmModeloLista)
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClienteListaU: TfrmClienteListaU;

implementation

{$R *.dfm}
  uses dmU, clienteDadosU, PrincipalU;

procedure TfrmClienteListaU.btnAdicionarClick(Sender: TObject);

begin
        inherited;

        frmPrincipal.abreForm(TfrmClienteDados);


end;

procedure TfrmClienteListaU.btnEditarClick(Sender: TObject);

begin
        inherited;

       frmPrincipal.abreForm(TfrmClienteDados);



end;

end.
