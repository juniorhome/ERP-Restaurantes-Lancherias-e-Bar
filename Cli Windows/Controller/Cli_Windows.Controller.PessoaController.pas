unit Cli_Windows.Controller.PessoaController;

interface

uses orm.dao.BaseDAO, orm.conexao.interfaces.Interfaces, Cli_Windows.Model.PessoaVO,
     DB, uRESTDWPoolerDB;

type
  TPessoaController = class(TInterfacedObject, IController<TPessoaVO>)
    private
      FConexao: TRESTDWDatabase;
    public
      function Salvar(obj: TPessoaVO): integer;
      function Atualizar(obj: TPessoaVO): boolean;
      function Excluir(obj: TPessoaVO): boolean;
      function Listagem(obj: TPessoaVO): TDataSet;
      class function New(AConexao: TRESTDWDatabase): IController<TPessoaVO>;
      constructor Create(AConexao: TRESTDWDatabase);
  end;

implementation

{ TPessoaController }

function TPessoaController.Atualizar(obj: TPessoaVO): boolean;
begin
   Result := TBaseDAO<TPessoaVO>.new(FConexao).Atualizar(obj);
end;

constructor TPessoaController.Create(AConexao: TRESTDWDatabase);
begin
  FConexao := AConexao;
end;

function TPessoaController.Excluir(obj: TPessoaVO): boolean;
begin
  Result := TBaseDAO<TPessoaVO>.new(FConexao).Excluir(obj);
end;

function TPessoaController.Listagem(obj: TPessoaVO): TDataSet;
begin
  Result := TBaseDAO<TPessoaVO>.new(FConexao).Listagem(obj);
end;

class function TPessoaController.New(
  AConexao: TRESTDWDatabase): IController<TPessoaVO>;
begin
   Self.Create(AConexao);
end;

function TPessoaController.Salvar(obj: TPessoaVO): integer;
begin
   Result := TBaseDAO<TPessoaVO>.new(FConexao).Inserir(obj);
end;

end.