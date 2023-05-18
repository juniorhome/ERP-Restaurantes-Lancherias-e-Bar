unit Cli_Windows.View.ufrmCadGrupo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cli_Windows.View.ufrmCadBasico, Data.DB,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Cli_Windows.Model.GrupoVO, orm.conexao.interfaces.Interfaces;

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
  private
    { Private declarations }
    FGrupo: TGrupoVO;
  public
    { Public declarations }
    procedure CarregarObjeto();override;
    procedure CarregarCds();override;
  end;

var
  frmCadGrupo: TfrmCadGrupo;

implementation

{$R *.dfm}

uses Cli_Windows.Controller.GrupoController, Cli_Windows.View.uDM;

{ TfrmCadGrupo }

procedure TfrmCadGrupo.btnSalvarClick(Sender: TObject);
begin
  inherited;
  CarregarObjeto;
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

procedure TfrmCadGrupo.FormCreate(Sender: TObject);
begin
  inherited;
  FGrupo := TGrupoVO.Create;
  edtDescricao.SetFocus;
  dsGeral.DataSet := TGrupoController.New(DMCliente.RESTDWIdDatabase1).Listagem(FGrupo);
end;

end.
