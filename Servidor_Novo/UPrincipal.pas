unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uRESTDWAbout, uRESTDWConsts, Vcl.StdCtrls,
  Vcl.ExtCtrls, IniFiles, uRESTDWBasic, uRESTDWComponentBase, uRESTDWIdBase, uRESTDWDataUtils,
  Vcl.Menus;

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
    cmbFramework: TComboBox;
    btnConectar: TButton;
    btnDesconectar: TButton;
    btnSair: TButton;
    btnGerarArquivo: TButton;
    Label14: TLabel;
    RESTDWServicePooler: TRESTDWIdServicePooler;
    lblStatusServidor: TLabel;
    Label16: TLabel;
    TrayIcon: TTrayIcon;
    PopupMenu1: TPopupMenu;
    Conectar1: TMenuItem;
    Excluiroarquivoini1: TMenuItem;
    Desconectar1: TMenuItem;
    Mostraratela1: TMenuItem;
    Mostraratela2: TMenuItem;
    btnMinimizar: TButton;
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGerarArquivoClick(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
    procedure btnDesconectarClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure Mostraratela2Click(Sender: TObject);
  private
    { Private declarations }
    FArqIni: TIniFile;
    procedure EscreverIni();
    procedure LerIni();
  public
    { Public declarations }
    procedure ConfiguraRDW;
    procedure StatusServidor;
    procedure StatusBotoes;
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
  RESTDWServicePooler.Active := True;
  StatusServidor;
  StatusBotoes;
end;

procedure TFrmPrincipal.btnDesconectarClick(Sender: TObject);
begin
  RESTDWServicePooler.Active := False;
  StatusServidor;
  StatusBotoes;
end;

procedure TFrmPrincipal.btnGerarArquivoClick(Sender: TObject);
begin
   EscreverIni;
   StatusBotoes;
end;

procedure TFrmPrincipal.btnMinimizarClick(Sender: TObject);
begin
   Self.Hide;
   Self.WindowState := TWindowState.wsMinimized;
   TrayIcon.Visible := True;
   TrayIcon.ShowBalloonHint;
end;

procedure TFrmPrincipal.btnSairClick(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TFrmPrincipal.ConfiguraRDW;
begin
   RESTDWServicePooler.AuthenticationOptions.OptionParams.AuthDialog := CheckBox1.Checked;
   RESTDWServicePooler.AuthenticationOptions.AuthorizationOption := rdwAOBasic;
   TRESTDWAuthOptionBasic(RESTDWServicePooler.AuthenticationOptions.OptionParams).Username := edtUsuario.Text;
   TRESTDWAuthOptionBasic(RESTDWServicePooler.AuthenticationOptions.OptionParams).Password := edtSenha.Text;
   RESTDWServicePooler.ServicePort := StrToInt(edtPorta.Text);
end;

procedure TFrmPrincipal.EscreverIni;
begin
   //Escrever no arquivo Ini configura��es do servidor rest dataware  e banco de dados.
   FArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');
   try
       FArqIni.WriteString('Servidor', 'Porta', edtPorta.Text);
       FArqIni.WriteString('Servidor', 'Usuario', edtUsuario.Text);
       FArqIni.WriteString('Servidor', 'Senha', edtSenha.Text);
       FArqIni.WriteBool('Servidor', 'Autenticacao', CheckBox1.Checked);
       FArqIni.WriteString('Banco', 'Base', cmbDriver.Text);
       FArqIni.WriteString('Banco', 'Usuario', edtUsuarioBanco.Text);
       FArqIni.WriteString('Banco', 'Senha', edtSenhaBanco.Text);
       FArqIni.WriteString('Banco', 'Servidor', edtLocal.Text);
       FArqIni.WriteString('Banco', 'Biblioteca', edtCaminhoDLL.Text);
       FArqIni.WriteString('Banco', 'Caminho', edtCaminhoBanco.Text);
       FArqIni.WriteString('Banco', 'Framework', cmbFramework.Text);

       if cmbFramework.Text = 'FIREDAC' then
       begin
          if cmbDriver.Text = 'FIREBIRD' then
             FArqIni.WriteString('FIREDAC', 'DriverID', 'FB');
          if cmbDriver.Text = 'POSTGRESQL' then
             FArqIni.WriteString('FIREDAC', 'DriverID', 'PG');
       end;
   finally
       FArqIni.Free;
   end;

end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
   RESTDWServicePooler.ServerMethodClass := TDMServidor;
   StatusServidor;
   StatusBotoes;

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
     cmbFramework.Text := FArqIni.ReadString('Banco', 'Framework', '');
   finally
     FArqIni.Free;
   end;
end;

procedure TFrmPrincipal.Mostraratela2Click(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TFrmPrincipal.StatusBotoes;
begin
  if RESTDWServicePooler.Active then
  begin
    btnConectar.Enabled := False;
    btnDesconectar.Enabled := True;
  end
  else
  begin
    btnConectar.Enabled := True;
    btnDesconectar.Enabled := False;
  end;
  if  FileExists(ExtractFilePath(Application.ExeName) + '\' + 'Config.ini') then
     btnGerarArquivo.Enabled := False;
end;

procedure TFrmPrincipal.StatusServidor;
begin
   if RESTDWServicePooler.Active then
   begin
     lblStatusServidor.Caption := 'Servidor no ar...';
     lblStatusServidor.Font.Color := clGreen;
   end
   else
   begin
     lblStatusServidor.Caption := 'Servidor parado...';
     lblStatusServidor.Font.Color := clRed;
   end;
end;

end.