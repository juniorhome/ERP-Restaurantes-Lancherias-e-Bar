unit Cli_Windows.Controller.CidadeController;

interface

uses orm.dao.BaseDAO, orm.conexao.interfaces.Interfaces, Cli_Windows.Model.CidadeVO,
     DB, uRESTDWIdBase, uRESTDWConsts, Datasnap.DBClient;

type
  TCidadeController = class(TInterfacedObject, IController<TCidadeVO>)
    private
      FConexao: TRESTDWIdDatabase;
    public
      function Salvar(obj: TCidadeVO): integer;
      function Atualizar(obj: TCidadeVO): boolean;
      function Excluir(obj: TCidadeVO): boolean;
      function Listagem(obj: TCidadeVO): TClientDataSet;
      class function New(AConexao: TRESTDWIdDatabase): IController<TCidadeVO>;
      constructor Create(AConexao: TRESTDWIdDatabase);
  end;

implementation

{ TCidadeController }

function TCidadeController.Atualizar(obj: TCidadeVO): boolean;
begin
   Result := TBaseDAO<TCidadeVO>.New(FConexao).Atualizar(obj);
end;

constructor TCidadeController.Create(AConexao: TRESTDWIdDatabase);
begin
   FConexao := AConexao;
end;

function TCidadeController.Excluir(obj: TCidadeVO): boolean;
begin
   Result := TBaseDAO<TCidadeVO>.New(FConexao).Excluir(obj);
end;

function TCidadeController.Salvar(obj: TCidadeVO): integer;
begin
   Result := TBaseDAO<TCidadeVO>.New(FConexao).Inserir(obj);
end;

function TCidadeController.Listagem(obj: TCidadeVO): TClientDataSet;
begin
   Result := TBaseDAO<TCidadeVO>.New(FConexao).Listagem(obj, '', '', False);
end;

class function TCidadeController.New(
  AConexao: TRESTDWIdDatabase): IController<TCidadeVO>;
begin
   Self.Create(AConexao);
end;

end.
