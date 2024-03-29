unit Cli_Windows.Controller.GrupoController;

interface

uses orm.dao.BaseDAO, orm.conexao.interfaces.Interfaces, DB, uRESTDWIdBase, uRESTDWConsts, Cli_Windows.Model.GrupoVO,
  Datasnap.DBClient;

type
  TGrupoController = class(TInterfacedObject, IController<TGrupoVO>)
    private
      FConexao: TRESTDWIdDatabase;
      FDao: IDAO<TGrupoVO>;
    public
      function Salvar(obj: TGrupoVO): integer;
      function Atualizar(obj: TGrupoVO): boolean;
      function Excluir(obj: TGrupoVO): boolean;
      function Listagem(obj: TGrupoVO): TClientDataSet;
      class function New(aConexao: TRESTDWIdDatabase): IController<TGrupoVO>;
      constructor Create(aConexao: TRESTDWIdDatabase);
      destructor Destroy; override;
  end;

implementation

{ TGrupoController }

function TGrupoController.Atualizar(obj: TGrupoVO): boolean;
begin
  Result := TBaseDAO<TGrupoVO>.New(FConexao).Atualizar(obj);
end;


constructor TGrupoController.Create(aConexao: TRESTDWIdDatabase);
begin
   FConexao := aConexao;
   FDao := TBaseDAO<TGrupoVO>.New(FConexao);
end;

destructor TGrupoController.Destroy;
begin
  FConexao.Free;
  inherited;
end;

function TGrupoController.Excluir(obj: TGrupoVO): boolean;
begin
  Result := TBaseDAO<TGrupoVO>.New(FConexao).Excluir(obj);
end;

function TGrupoController.Listagem(obj: TGrupoVO): TClientDataSet;
begin
   Result := FDao.Listagem(obj, '', '', False);
end;

class function TGrupoController.New(
  aConexao: TRESTDWIdDatabase): IController<TGrupoVO>;
begin
   Result := Self.Create(aConexao);
end;

function TGrupoController.Salvar(obj: TGrupoVO): integer;
begin
   Result := TBaseDAO<TGrupoVO>.New(FConexao).Inserir(obj);
end;

end.
