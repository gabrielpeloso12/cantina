unit modeloListaU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmModeloLista = class(TForm)
    gbFiltro: TGroupBox;
    gbDados: TGroupBox;
    pnControle: TPanel;
    edtFiltro: TEdit;
    lbFiltro: TLabel;
    btnFiltro: TBitBtn;
    dbgDados: TDBGrid;
    btnFechar: TBitBtn;
    btnExcluir: TBitBtn;
    btnAdicionar: TBitBtn;
    btnEditar: TBitBtn;
    ds: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFiltroClick(Sender: TObject);
    procedure dbgDadosTitleClick(Column: TColumn);
    procedure edtFiltroChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmModeloLista: TfrmModeloLista;
  CampoFiltro: string;

implementation

{$R *.dfm}

procedure TfrmModeloLista.btnAdicionarClick(Sender: TObject);
begin
    ds.DataSet.Append;
end;

procedure TfrmModeloLista.btnExcluirClick(Sender: TObject);
begin
    if ds.DataSet.RecordCount = 0 then
    begin
         MessageBox(Application.Handle, Pchar('N�o existe registro para ser exclu�do!'), Pchar('Falha ao excluir registro'), MB_OK+MB_ICONERROR);
         exit;
    end;

    if MessageBox(application.Handle, Pchar('Deseja Excluir esse Registro?'), Pchar('Confirmar Exclus�o'), MB_YESNO+MB_ICONQUESTION) = ID_YES then
       ds.DataSet.Delete;

end;

procedure TfrmModeloLista.btnFecharClick(Sender: TObject);
begin
    self.Close;
end;

procedure TfrmModeloLista.btnFiltroClick(Sender: TObject);
begin
      if ds.DataSet.FieldByName (CampoFiltro) is TStringField then
      begin
        //define a regra para campos de texto com like do filtro
        ds.DataSet.Filter := CampoFiltro +' LIKE '+ QuotedStr('%'+edtFiltro.Text+'%');
      end
      else
      begin
        //define a regra para campos numericos, data, etc SEM like do filtro
        ds.DataSet.Filter := CampoFiltro+' = '+ edtFiltro.Text;
       end;
        //ativa o filtro
        ds.DataSet.Filtered := true;

        edtFiltro.SetFocus;
end;

procedure TfrmModeloLista.dbgDadosTitleClick(Column: TColumn);
begin
      lbFiltro.Caption := Column.Title.Caption+': ';
      edtFiltro.Clear;
      CampoFiltro := Column.FieldName;
      ds.DataSet.Filtered := false;

      edtFiltro.SetFocus; //joga o foco da aplica��o para a caixa de texto do filtro
end;

procedure TfrmModeloLista.edtFiltroChange(Sender: TObject);
begin
     if length(edtFiltro.Text) = 0 then
     begin
       btnFiltro.Enabled := false;
       ds.DataSet.Filtered := false;
     end
     else
     begin
       btnFiltro.Enabled := true;
     end;

end;

procedure TfrmModeloLista.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     ds.DataSet.Close;

     Action := caFree;
     self := nil;
end;

procedure TfrmModeloLista.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key = VK_ESCAPE then
    begin
      Self.Close;
    end;
end;

procedure TfrmModeloLista.FormShow(Sender: TObject);
begin
    ds.DataSet.Open;

    lbFiltro.Caption := dbgDados.Columns[0].Title.Caption + ':';
    edtFiltro.Clear;
    CampoFiltro := dbgDados.Columns[0].FieldName;
    ds.DataSet.Filtered := false;


end;

end.
