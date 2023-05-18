unit Cli_Windows.Controller.PerfilUsuarioController;

interface

uses orm.conexao.interfaces.Interfaces, orm.dao.BaseDAO, DB, uRESTDWIdBase, uRESTDWConsts, Cli_Windows.Model.PerfilUsuarioVO;

  type
    TPerfilUsuarioController = class(TInterfacedObject, IController<TPerfilUsuarioVO>)
    private
      FConexao: TRESTDWIdDatabase;
    public
      function Salvar(obj: TPerfilUsuarioVO): integer;
      function Atualizar(obj: TPerfilUsuarioVO): boolean;
      function Excluir(obj: TPerfilUsuarioVO): boolean;
      function Listagem(obj: TPerfilUsuarioVO): TDataSet;
      constructor Create(AConexao: TRESTDWIdDatabase);
      function ListagemId(obj: TPerfilUsuarioVO): TPerfilUsuarioVO;
    end;

implementation

{ TPerfilUsuarioController }

function TPerfilUsuarioController.Atualizar(obj: TPerfilUsuarioVO): boolean;
begin
   Result := TBaseDAO<TPerfilUsuarioVO>.New(FConexao).Atualizar(obj);
end;

constructor TPerfilUsuarioController.Create(AConexao: TRESTDWIdDatabase);
begin
  FConexao := AConexao;
end;

function TPerfilUsuarioController.Excluir(obj: TPerfilUsuarioVO): boolean;
begin
   Result := TBaseDAO<TPerfilUsuarioVO>.New(FConexao).Excluir(obj);
end;

function TPerfilUsuarioController.Listagem(obj: TPerfilUsuarioVO): TDataSet;
begin
  Result := TBaseDAO<TPerfilUsuarioVO>.New(FConexao).Listagem(obj, '', '', False);
end;

function TPerfilUsuarioController.ListagemId(
  obj: TPerfilUsuarioVO): TPerfilUsuarioVO;
begin
  Result := TBaseDAO<TPerfilUsuarioVO>.New(FConexao).Listagem(obj);
end;

function TPerfilUsuarioController.Salvar(obj: TPerfilUsuarioVO): integer;
begin
  Result := TBaseDAO<TPerfilUsuarioVO>.New(FConexao).Inserir(obj);
end;

end.
