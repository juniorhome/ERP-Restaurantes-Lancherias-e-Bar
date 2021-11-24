unit Cli_Windows.Controller.CidadeController;

interface

uses orm.dao.BaseDAO, orm.conexao.interfaces.Interfaces, Cli_Windows.Model.CidadeVO,
     DB, uRESTDWPoolerDB;

type
  TCidadeController = class(TInterfacedObject, IController<TCidadeVO>)
    private
      FConexao: TRESTDWDatabase;
    public
      function Inserir(obj: TCidadeVO): integer;
      function Atualizar(obj: TCidadeVO): boolean;
      function Excluir(obj: TCidadeVO): boolean;
      function Listagem(obj: TCidadeVO): TDataSet;
      class function New(AConexao: TRESTDWDatabase): IController<TCidadeVO>;
      constructor Create(AConexao: TRESTDWDatabase);
  end;

implementation

{ TCidadeController }

function TCidadeController.Atualizar(obj: TCidadeVO): boolean;
begin
   Result := TBaseDAO<TCidadeVO>.New(FConexao).Atualizar(obj);
end;

constructor TCidadeController.Create(AConexao: TRESTDWDatabase);
begin
   FConexao := AConexao;
end;

function TCidadeController.Excluir(obj: TCidadeVO): boolean;
begin
   Result := TBaseDAO<TCidadeVO>.New(FConexao).Excluir(obj);
end;

function TCidadeController.Inserir(obj: TCidadeVO): integer;
begin
   Result := TBaseDAO<TCidadeVO>.New(FConexao).Inserir(obj);
end;

function TCidadeController.Listagem(obj: TCidadeVO): TDataSet;
begin
   Result := TBaseDAO<TCidadeVO>.New(FConexao).Listagem(obj);
end;

class function TCidadeController.New(
  AConexao: TRESTDWDatabase): IController<TCidadeVO>;
begin
   Self.Create(AConexao);
end;

end.