unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDWAbout, uDWConsts, Vcl.StdCtrls,
  Vcl.ExtCtrls, IniFiles, ServerUtils, uRESTDWBasic, uRESTDWComponentBase,
  uRESTDWIdBase;

type
  TFrmPrincipal = class(TForm)
    pnlConfigServidor: TPanel;
    Label1: TLabel;
    edtPorta: TEdit;
    Label2: TLabel;
    edtUsuario: TEdit;
    Label3: TLabel;
    edtSenha: TEdit;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    Label5: TLabel;
    pnlConfigBanco: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    cmbDriver: TComboBox;
    Label8: TLabel;
    Label9: TLabel;
    edtUsuarioBanco: TEdit;
    edtSenhaBanco: TEdit;
    Label10: TLabel;
    edtCaminhoBanco: TEdit;
    Label11: TLabel;
    edtLocal: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    edtCaminhoDLL: TEdit;
    ComboBox1: TComboBox;
    btnConectar: TButton;
    btnDesconectar: TButton;
    btnSair: TButton;
    btnGerarArquivo: TButton;
    Label14: TLabel;
    RESTDWServicePooler: TRESTDWIdServicePooler;
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGerarArquivoClick(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
    procedure btnDesconectarClick(Sender: TObject);
  private
    { Private declarations }
    FArqIni: TIniFile;
    procedure EscreverIni();
    procedure LerIni();
  public
    { Public declarations }
    procedure ConfiguraRDW;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses UDMServidor;

procedure TFrmPrincipal.btnConectarClick(Sender: TObject);
begin
  ConfiguraRDW;
  DMServidor.ConfiguraConexao;
  RESTServicePooler.Active := True;
end;

procedure TFrmPrincipal.btnDesconectarClick(Sender: TObject);
begin
  RESTServicePooler.Active := False;
end;

procedure TFrmPrincipal.btnGerarArquivoClick(Sender: TObject);
begin
   EscreverIni;
end;

procedure TFrmPrincipal.btnSairClick(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TFrmPrincipal.ConfiguraRDW;
begin
   RESTServicePooler.AuthenticationOptions.OptionParams.AuthDialog := CheckBox1.Checked;
   TRDWAuthOptionBasic(RESTServicePooler.AuthenticationOptions.OptionParams).Username := edtUsuario.Text;
   TRDWAuthOptionBasic(RESTServicePooler.AuthenticationOptions.OptionParams).Password := edtSenha.Text;
   RESTServicePooler.ServicePort := StrToInt(edtPorta.Text);
end;

procedure TFrmPrincipal.EscreverIni;
begin
   //Escrever no arquivo Ini configura��es do servidor rest dataware  e banco de dados.
   FArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'\Config.ini');
   try
       FArqIni.WriteString('Servidor', 'Porta', edtPorta.Text);
       FArqIni.WriteString('Servidor', 'Usuario', edtUsuario.Text);
       FArqIni.WriteString('Servidor', 'Senha', edtSenha.Text);
       FArqIni.WriteBool('Servidor', 'Autenticacao', CheckBox1.Checked);
       FArqIni.WriteString('Banco', 'Base', cmbDriver.Items[cmbDriver.ItemIndex]);
       FArqIni.WriteString('Banco', 'Usuario', edtUsuarioBanco.Text);
       FArqIni.WriteString('Banco', 'Senha', edtSenhaBanco.Text);
       FArqIni.WriteString('Banco', 'Servidor', edtLocal.Text);
       FArqIni.WriteString('Banco', 'Biblioteca', edtCaminhoDLL.Text);
       FArqIni.WriteString('Banco', 'Caminho', edtCaminhoBanco.Text);
       FArqIni.WriteString('Banco', 'Framework', ComboBox1.Items[cmbDriver.ItemIndex]);
   finally
       FArqIni.Free;
   end;

end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
   RESTServicePooler.ServerMethodClass := TDMServidor;

   if FileExists(ExtractFilePath(Application.ExeName) + '\' + 'Config.ini') then
   begin
     Label14.Caption := 'Existe Arquivo';
     Label14.Font.Color := clGreen;
     LerIni;
   end
   else
   begin
     Label14.Caption := 'N�o Existe Arquivo.';
     Label14.Font.Color := clRed;
     btnConectar.Enabled := False;
   end;

end;

procedure TFrmPrincipal.LerIni;
begin
   FArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'\Config.ini');
   try
     edtPorta.Text := FArqIni.ReadString('Servidor', 'Porta', '');
     edtUsuario.Text := FArqIni.ReadString('Servidor', 'Usuario', '');
     edtSenha.Text := FArqIni.ReadString('Servidor', 'Senha', '');
     CheckBox1.Checked := FArqIni.ReadBool('Servidor', 'Autenticacao', True);
     cmbDriver.Text := FArqIni.ReadString('Banco', 'Base', '');
     edtUsuarioBanco.Text := FArqIni.ReadString('Banco', 'Usuario', '');
     edtSenhaBanco.Text := FArqIni.ReadString('Banco', 'Senha', '');
     edtLocal.Text := FArqIni.ReadString('Banco', 'Servidor', '');
     edtCaminhoDLL.Text := FArqIni.ReadString('Banco', 'Biblioteca', '');
     edtCaminhoBanco.Text := FArqIni.ReadString('Banco', 'Caminho', '');
     ComboBox1.Text := FArqIni.ReadString('Banco', 'Framework', '');
   finally
     FArqIni.Free;
   end;
end;

end.
