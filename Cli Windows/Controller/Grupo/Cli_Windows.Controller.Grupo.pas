unit Cli_Windows.Controller.Grupo;

interface

uses
  Cli_Windows.Controller.Grupo.Interfaces, Data.DB, Cli_Windows.Model.GrupoVO,
  Cli_Windows.model.Grupo.Interfaces, System.Generics.Collections,
  Cli_Windows.Model;

type
  TControllerGrupo = class(TInterfacedObject, iControllerGrupo)
    private
      FModel: iModelGrupo;
      FDataSource: TDataSource;
      FLista: TObjectList<TGrupoVO>;
      FEntidade: TGrupoVO;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iControllerGrupo;
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

{ TControllerGrupo }

function TControllerGrupo.Buscar(aDescricao: string): iControllerGrupo;
begin
   Result := Self;
   if Assigned(FLista) then
     FLista.Free;
  FModel.DAO.Listagem(FModel.Entidade, aDescricao);
end;

function TControllerGrupo.Buscar(aId: integer): iControllerGrupo;
begin
   Result := Self;
   FModel.DAO.Listagem(FModel.Entidade, aId);
end;

function TControllerGrupo.Buscar: iControllerGrupo;
begin
   Result := Self;
   if Assigned(FLista) then
     FLista.Free;
   FLista := FModel.DAO.Listagem(FModel.Entidade);
end;

function TControllerGrupo.Buscar(aDataInicio,
  aDataFinal: string): iControllerGrupo;
begin
  Result := Self;
  if Assigned(FLista) then
    FLista.Free;
  FModel.DAO.Listagem(FModel.Entidade, aDataInicio, aDataFinal);
end;

constructor TControllerGrupo.Create;
begin
   FModel := TModel.New.Grupo;
end;

function TControllerGrupo.DataSource(
  aDataSource: TDataSource): iControllerGrupo;
begin
  Result := Self;
  FDataSource := aDataSource;
  FModel.DataSource(FDataSource);
end;

function TControllerGrupo.Delete: iControllerGrupo;
begin
   Result := Self;
   FModel.DAO.Excluir(FModel.Entidade);
end;

destructor TControllerGrupo.Destroy;
begin
  if Assigned(FLista) then
     FLista.Free;
  inherited;
end;

function TControllerGrupo.Entidade: TGrupoVO;
begin
   Result := FModel.Entidade;
end;

function TControllerGrupo.Inserir: iControllerGrupo;
begin
   Result := Self;
   FModel.DAO.Inserir(FModel.Entidade);
end;

class function TControllerGrupo.New: iControllerGrupo;
begin
   Result := Self.Create;
end;

function TControllerGrupo.Update: iControllerGrupo;
begin
   Result := Self;
   FModel.DAO.Atualizar(FModel.Entidade);
end;

end.