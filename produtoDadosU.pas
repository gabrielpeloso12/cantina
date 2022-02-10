unit produtoDadosU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, modeloDadosU, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, JPEG, Vcl.ExtDlgs;

type
  TfrmProdutoDados = class(TfrmModeloDados)
    Panel1: TPanel;
    Label1: TLabel;
    dbeID: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbeProduto: TDBEdit;
    Label4: TLabel;
    dbeEstoqueMinimo: TDBEdit;
    Label5: TLabel;
    dbeQuantidade: TDBEdit;
    Label6: TLabel;
    dbeCusto: TDBEdit;
    Label7: TLabel;
    dbePreco: TDBEdit;
    Label8: TLabel;
    dbeDataCadastro: TDBEdit;
    Label9: TLabel;
    dbeDataInativo: TDBEdit;
    dbcAtivo: TDBComboBox;
    Panel2: TPanel;
    gbFoto: TGroupBox;
    imProduto: TImage;
    odFoto: TOpenPictureDialog;
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure imProdutoDblClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutoDados: TfrmProdutoDados;

implementation

{$R *.dfm}

uses dmU;

procedure TfrmProdutoDados.btnSalvarClick(Sender: TObject);
begin

   if dmCantina.fdtbProdutop_ativo.Value = 'S' then
  begin
    dmCantina.fdtbProdutop_data_cadastro.Value := now;
  end
  else
  begin
      if dmCantina.fdtbProdutop_ativo.Value = 'N' then
  begin
    dmCantina.fdtbProdutop_data_inativo.Value := now;
  end
  end;

  dmCantina.fdtbProduto.Post;
end;

procedure TfrmProdutoDados.dsDataChange(Sender: TObject; Field: TField);
var
    jpg : TJPEGImage;
    stream : TMemoryStream;

begin
    inherited;

    if not (dmCantina.fdtbProdutop_foto.IsNull) then // se houver foto cadastrada
    begin
      try
          //aloca espa�o na memoria (cria instancia das classes)
          jpg := TJPEGImage.Create;
          stream := TMemoryStream.Create;

          //Carrega imagem do campo p_foto para stream (memoria RAM do PC)
          dmCantina.fdtbProdutop_foto.SaveToStream(stream);
          stream.Seek(0 ,soFromBeginning); // volta o ponteiro para o INICIO da stream
          jpg.LoadFromStream(stream);  // grava a stream dentro de jpg
          imProduto.Picture.Assign(jpg); // carrega a foto na caixa de imagem (image do formulario)

          //Libera memoria (apaga as instancias)
          jpg.Free;
          stream.Free;
      except

          //caso aconte�a algum erro ao carregar imagem
          On e:exception do
          begin
              jpg.Free;  // libera memoria
              stream.Free;
              //mostra mensagem de erro para o usu�rio
              MessageBox(application.Handle, Pchar(e.Message), Pchar('Falha ao carregar imagem do produto'), MB_OK+MB_ICONWARNING);
          end;

      end;
    end
    else
    begin  //se n�o houver foto cadastrada

        imProduto.Picture.Assign(nil);

    end;



end;

procedure TfrmProdutoDados.imProdutoDblClick(Sender: TObject);
var
    jpg : TJPEGImage;

begin
    inherited;

    if odFoto.Execute then
    begin
      try
          // Coloca tabela produto em modo de edi��o (para poder salvar a foto no banco de dados)
          ds.DataSet.Edit;
          // Cria a instancia da classe TJPEGIMAGE  na memoria RAM
          jpg := TJPEGImage.Create;
          // Salva imagem no banco de dados
          dmCantina.fdtbProdutop_foto.LoadFromFile(odFoto.FileName);
          // Carrega imagem na instacia jpg
          jpg.LoadFromFile(odFoto.FileName);
          // Assimila jpg para imProduto (mostra imagem no formul�rio)
          imProduto.Picture.Assign(jpg);
          // Destroi instancia da imagem (jpg) (libera da memoria RAM)
          jpg.Free;
      except

          on E:Exception do
          begin
            JPG.Free;
            MessageBox(application.Handle, Pchar('� permitido apenas arquivos JPG para imagem!'), Pchar('Falha ao carregar imagem do produto'), MB_OK+MB_ICONWARNING);
          end;

      end;
    end;

end;

end.
