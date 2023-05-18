unit Cli_Windows.View.uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uRESTDWAbout, uRESTDWServerEvents, uRESTDWComponentBase,
  uRESTDWBasicTypes, uRESTDWBasicDB, uRESTDWBasic, uRESTDWIdBase,
  uRESTDWDataUtils;

type
  TDMCliente = class(TDataModule)
    RESTDWClientSQL1: TRESTDWClientSQL;
    RESTDWClientEvents1: TRESTDWClientEvents;
    RESTDWIdDatabase1: TRESTDWIdDatabase;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConfigurarConexaoClient();
  end;

var
  DMCliente: TDMCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMCliente }

procedure TDMCliente.ConfigurarConexaoClient;
begin
   RESTDWIdDatabase1.AuthenticationOptions.AuthorizationOption := rdwAOBasic;
   TRESTDWAuthOptionBasic(RESTDWIdDatabase1.AuthenticationOptions.OptionParams).Username := 'admin';
   TRESTDWAuthOptionBasic(RESTDWIdDatabase1.AuthenticationOptions.OptionParams).Password:= 'admin';
   RESTDWIdDatabase1.PoolerName := 'TDMServidor.RESTDWPoolerDB1';
   RESTDWIdDatabase1.Active := True;
   RESTDWClientSQL1.DataBase := RESTDWIdDatabase1;
   RESTDWClientSQL1.Active := True;
end;

procedure TDMCliente.DataModuleCreate(Sender: TObject);
begin
   ConfigurarConexaoClient;
end;

end.
