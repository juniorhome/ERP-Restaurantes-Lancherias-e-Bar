unit Cli_Windows.Controller.MesaController;

interface

uses orm.dao.BaseDAO, orm.conexao.interfaces.Interfaces, Cli_Windows.Model.MesaVO,
     DB, uRESTDWPoolerDB;

type
  TMesaController = class(TInterfacedObject, IController<TMesaVO>)
    private
      FConexao: TRESTDWDatabase;
    public
      function Inserir(obj: TMesaVO): integer;
      function Atualizar(obj: TMesaVO): boolean;
      function Excluir(obj: TMesaVO): boolean;
      function Listagem(obj: TMesaVO): TDataSet;
      class function New(AConexao: TRESTDWDatabase): IController<TMesaVO>;
      constructor Create(AConexao: TRESTDWDatabase);
      destructor Destroy;override;
  end;

implementation

{ TMesaController }

function TMesaController.Atualizar(obj: TMesaVO): boolean;
begin
   Result := TBaseDAO<TMesaVO>.New(FConexao).Atualizar(obj);
end;

constructor TMesaController.Create(AConexao: TRESTDWDatabase);
begin
   FConexao := AConexao;
end;

destructor TMesaController.Destroy;
begin
  FConexao.Free;
  inherited;
end;

function TMesaController.Excluir(obj: TMesaVO): boolean;
begin
  Result := TBaseDAO<TMesaVO>.New(FConexao).Excluir(obj);
end;

function TMesaController.Inserir(obj: TMesaVO): integer;
begin
  Result := TBaseDAO<TMesaVO>.New(FConexao).Inserir(obj);
end;

function TMesaController.Listagem(obj: TMesaVO): TDataSet;
begin
  Result := TBaseDAO<TMesaVO>.New(FConexao).Listagem(obj);
end;

class function TMesaController.New(
  AConexao: TRESTDWDatabase): IController<TMesaVO>;
begin
   Self.Create(AConexao);
end;

end.
