unit UDMServidor;

interface

uses
  System.SysUtils, System.Classes, uDWDataModule, uRESTDWPoolerDB,
  uRESTDWDriverZEOS, uDWAbout, IniFiles, uRESTDWDriverFD, orm.conexao.ModelConexaoFactory,
  FireDAC.Comp.Client, uRESTDWServerEvents, uDWJSONObject, System.JSON, Data.DB,
  Datasnap.DBClient, System.NetEncoding;

type
  TDMServidor = class(TServerMethodDataModule)
    RESTDWPoolerDB1: TRESTDWPoolerDB;
    RESTDWDriverZeos1: TRESTDWDriverZeos;
    RESTDWDriverFD1: TRESTDWDriverFD;
    DWServerEvents1: TDWServerEvents;
    cdsImagem: TClientDataSet;
    cdsImagemFOTO: TBlobField;
    procedure DWServerEvents1EventsgetFotoReplyEvent(var Params: TDWParams;
      var Result: string);
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

procedure TDMServidor.DWServerEvents1EventsgetFotoReplyEvent(
  var Params: TDWParams; var Result: string);
var json: TJSONObject;
    StreamIn: TStream;
    StreamOut: TStringStream;
    arq: TFileStream;
begin
    json := TJSONObject.Create;
    try
     if not Params.ItemsString['caminhoFoto'].AsString.IsEmpty then
     begin
       //popular o cds.
       cdsImagem.Close;
       cdsImagem.Append;
       cdsImagemFOTO.LoadFromFile(Params.ItemsString['caminhoFoto'].AsString);
       cdsImagem.Post;
       cdsImagem.Open;
       StreamIn := cdsImagem.CreateBlobStream(cdsImagem.Fields[cdsImagem.RecNo], bmRead);
       StreamOut := TStringStream.Create;
       TNetEncoding.Base64.Encode(StreamIn, StreamOut);
       StreamOut.Position := 0;
       json.AddPair('Codigo', '200');
       json.AddPair('Mensagem', 'Foto encontada com sucesso.');
       json.AddPair('Foto', StreamOut.DataString);
     end
     else
     begin
       json.AddPair('Codigo', '500');
       json.AddPair('Mensagem', 'Foto n�o encontrada.');
     end;
    finally
      json.Free;
    end;
end;

end.
