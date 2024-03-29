unit Cli_Windows.View.ufrmCadGrupo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cli_Windows.View.ufrmCadBasico, Data.DB,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Cli_Windows.Model.GrupoVO, orm.conexao.interfaces.Interfaces,
  Cli_Windows.Controller.GrupoController, System.UITypes, orm.lib.Biblioteca, uRESTDWBasicDB;

type
  TfrmCadGrupo = class(TfrmCadBasico)
    pnlId: TPanel;
    Label5: TLabel;
    edtId: TEdit;
    pnlDescricao: TPanel;
    Label6: TLabel;
    edtDescricao: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure dbgGeralDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FGrupo: TGrupoVO;
    FLib: TLib<TGrupoVO>;
    FController: IController<TGrupoVO>;
  public
    { Public declarations }
    procedure CarregarObjeto();override;
    procedure CarregarCds();override;
  end;

var
  frmCadGrupo: TfrmCadGrupo;

implementation

{$R *.dfm}

uses Cli_Windows.View.uDM;

{ TfrmCadGrupo }

procedure TfrmCadGrupo.btnCancelarClick(Sender: TObject);
begin
  inherited;
  pnlListagem.BringToFront;
end;

procedure TfrmCadGrupo.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmCadGrupo.btnSalvarClick(Sender: TObject);
var retorno: integer;
    bool: boolean;
begin
  inherited;
  if FGrupo.ID > 0 then
  begin
     CarregarCds;
     CarregarObjeto;
     bool := TGrupoController.New(DMCliente.RESTDWIdDatabase1).Atualizar(FGrupo);
     if bool then
       ShowMessage('Grupo Atualizado com Sucesso!')
     else ShowMessage('Ocorreu um erro ao atualizar o registro!');
  end
  else
  begin
    CarregarObjeto;
    retorno := TGrupoController.New(DMCliente.RESTDWIdDatabase1).Salvar(FGrupo);
    if retorno > 0 then
      ShowMessage('Grupo salvo com sucesso!')
    else ShowMessage('Ocorreu um erro ao inserir o novo registro!');
  end;
end;

procedure TfrmCadGrupo.CarregarCds;
begin
   if not cdsGeral.IsEmpty then
   begin
     edtId.Text        := cdsGeral.FieldByName('ID').AsString;
     edtDescricao.Text := cdsGeral.FieldByName('DESCRICAO').AsString;
   end;
end;

procedure TfrmCadGrupo.CarregarObjeto;
begin
  if not (edtId.Text = '') then
    FGrupo.ID := StrToInt(edtId.Text);
  FGrupo.Descricao := edtDescricao.Text;
end;

procedure TfrmCadGrupo.dbgGeralDblClick(Sender: TObject);
var bool: boolean;
begin
  inherited;
  if MessageDlg('Deseja realmente excluir esse registro?', TMsgDlgType.mtInformation, mbYesNo, 0) = mrYes then
  begin
     CarregarCds;
     CarregarObjeto;
     bool := TGrupoController.New(DMCliente.RESTDWIdDatabase1).Excluir(FGrupo);
     if bool then
       ShowMessage('Registro excluido com sucesso!')
     else ShowMessage('Ocorreu um erro na exclus�o!');
  end;
end;

procedure TfrmCadGrupo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FGrupo.Free;
end;

procedure TfrmCadGrupo.FormCreate(Sender: TObject);
begin
  inherited;
  FGrupo := TGrupoVO.Create;
  Flib   := TLib<TGrupoVO>.Create;
  FController := TGrupoController.New(DMCliente.RESTDWIdDatabase1);
end;

procedure TfrmCadGrupo.FormShow(Sender: TObject);
begin
  inherited;
  if Assigned(FController) then
  begin
     FLib.CriarCds(FGrupo, cdsGeral);
     cdsGeral.Active             := True;
     cdsGeral                    := FController.Listagem(FGrupo);
  end;
end;

end.
