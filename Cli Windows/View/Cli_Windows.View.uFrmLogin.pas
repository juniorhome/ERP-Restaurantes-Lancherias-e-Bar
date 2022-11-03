unit Cli_Windows.View.uFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, Vcl.Buttons, orm.lib.SessaoUsuario, orm.Validacao, orm.seguranca.criptografia;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    pnlLogin: TPanel;
    Shape1: TShape;
    pnlImagem: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    pnlUsuario: TPanel;
    pnlSenha: TPanel;
    Label3: TLabel;
    edtNomeUsuario: TEdit;
    Label4: TLabel;
    edtSenha: TEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    Image2: TImage;
    pnlBotaoEntrar: TPanel;
    pnlBotaoCancelar: TPanel;
    btnCancelar: TSpeedButton;
    btnEntrar: TSpeedButton;
    chkLembrar: TCheckBox;
    procedure FormResize(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
var senha: string;
begin
   if (edtNomeUsuario.Text <> EmptyStr) and (edtSenha.Text <> EmptyStr) then
   begin
     senha := TCriptografia.MD5(edtSenha.Text);
   end;

end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
   TSessaoUsuario.LerIni;
   edtNomeUsuario.Text := TSessaoUsuario.Apelido;
   chkLembrar.Checked := TSessaoUsuario.Lembrar;
end;

procedure TfrmLogin.FormResize(Sender: TObject);
begin
   pnlLogin.Top := Round(frmLogin.Height / 2 - pnlLogin.Height / 2);
   pnlLogin.Left := Round(frmLogin.Width / 2 - pnlLogin.Width / 2);
end;

procedure TfrmLogin.btnCancelarClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
