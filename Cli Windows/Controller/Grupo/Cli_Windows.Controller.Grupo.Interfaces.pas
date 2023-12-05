unit Cli_Windows.Controller.Grupo.Interfaces;

interface

uses
  Data.DB, Cli_Windows.Model.GrupoVO;

type
 iControllerGrupo = interface
   ['{DEED434B-2FFD-42E9-92FE-B9388FA2C44C}']
   function DataSource(aDataSource: TDataSource): iControllerGrupo;
   function Buscar: iControllerGrupo; overload;
   function Buscar(aId: integer): iControllerGrupo; overload;
   function Buscar(aDescricao: string): iControllerGrupo; overload;
   function Buscar(aDataInicio, aDataFinal: string): iControllerGrupo; overload;
   function Inserir: iControllerGrupo;
   function Delete: iControllerGrupo;
   function Update: iControllerGrupo;
   function Entidade: TGrupoVO;
 end;

implementation

end.
