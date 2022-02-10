unit funcionarioDadosU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, modeloDadosU, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmFuncionarioDados = class(TfrmModeloDados)
    Label1: TLabel;
    dbeID: TDBEdit;
    Label2: TLabel;
    dbeNome: TDBEdit;
    Label3: TLabel;
    dbeUsuario: TDBEdit;
    Label4: TLabel;
    dbeSenha: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    dbeDataCadastro: TDBEdit;
    Label7: TLabel;
    dbeDataInativo: TDBEdit;
    dbcAtivo: TDBComboBox;
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFuncionarioDados: TfrmFuncionarioDados;

implementation

{$R *.dfm}
uses dmU;

procedure TfrmFuncionarioDados.btnSalvarClick(Sender: TObject);
begin

  if dmCantina.fdtbClientec_ativo.Value = 'S' then
  begin
    dmCantina.fdtbClientec_data_cadastro.Value := now;
  end
  else
  begin
      if dmCantina.fdtbClientec_ativo.Value = 'N' then
  begin
    dmCantina.fdtbClientec_data_inativo.Value := now;
  end
  end;

  dmCantina.fdtbCliente.Post;


end;

end.
