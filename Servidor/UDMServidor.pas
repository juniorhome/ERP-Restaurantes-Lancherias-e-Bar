unit UDMServidor;

interface

uses
  System.SysUtils, System.Classes, uDWDataModule, uRESTDWPoolerDB,
  uRESTDWDriverZEOS, uDWAbout, IniFiles, uRESTDWDriverFD, orm.conexao.ModelConexaoFactory,
  FireDAC.Comp.Client, uRESTDWServerEvents;

type
  TDMServidor = class(TServerMethodDataModule)
    RESTDWPoolerDB1: TRESTDWPoolerDB;
    RESTDWDriverZeos1: TRESTDWDriverZeos;
    RESTDWDriverFD1: TRESTDWDriverFD;
    DWServerEvents1: TDWServerEvents;
  private
    { Private declarations }
    FArqIni: TIniFile;
  public
    { Public declarations }
    procedure ConfiguraConexao;
  end;

var
  DMServidor: TDMServidor;

implementation

uses
  Vcl.Forms, ZConnection;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMServidor }

procedure TDMServidor.ConfiguraConexao;
var sFramework: string;
begin
  {
    M�todo que configura a conex�o do banco de dados. Se � Zeos,Firedac.
  }
  FArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'\Config.ini');
  try
    sFramework := FArqIni.ReadString('Banco', 'Framework', '');
    if sFramework = 'Zeos' then
    begin
       RESTDWPoolerDB1.RESTDriver := RESTDWDriverZeos1;
       RESTDWDriverZeos1.Connection :=  TZConnection(TModelConexaoFactory.New.Conexao(1).Connection);
    end
    else if sFramework = 'Firedac' then
         begin
           RESTDWPoolerDB1.RESTDriver := RESTDWDriverFD1;
           RESTDWDriverFD1.Connection := TFDConnection(TModelConexaoFactory.New.Conexao(2).Connection);
         end;
  finally
    FArqIni.Free;
  end;
end;

end.