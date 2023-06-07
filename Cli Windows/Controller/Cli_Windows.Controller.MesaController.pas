unit Cli_Windows.Controller.MesaController;

interface

uses orm.dao.BaseDAO, orm.conexao.interfaces.Interfaces, Cli_Windows.Model.MesaVO,
     DB, uRESTDWIdBase, uRESTDWConsts, Datasnap.DBClient;

type
  TMesaController = class(TInterfacedObject, IController<TMesaVO>)
    private
      FConexao: TRESTDWIdDatabase;
    public
      function Salvar(obj: TMesaVO): integer;
      function Atualizar(obj: TMesaVO): boolean;
      function Excluir(obj: TMesaVO): boolean;
      function Listagem(obj: TMesaVO): TClientDataSet;
      class function New(AConexao: TRESTDWIdDatabase): IController<TMesaVO>;
      constructor Create(AConexao: TRESTDWIdDatabase);
      destructor Destroy;override;
  end;

implementation

{ TMesaController }

function TMesaController.Atualizar(obj: TMesaVO): boolean;
begin
   Result := TBaseDAO<TMesaVO>.New(FConexao).Atualizar(obj);
end;

constructor TMesaController.Create(AConexao: TRESTDWIdDatabase);
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

function TMesaController.Salvar(obj: TMesaVO): integer;
begin
  Result := TBaseDAO<TMesaVO>.New(FConexao).Inserir(obj);
end;

function TMesaController.Listagem(obj: TMesaVO): TClientDataSet;
begin
  Result := TBaseDAO<TMesaVO>.New(FConexao).Listagem(obj, '', '', False);
end;

class function TMesaController.New(
  AConexao: TRESTDWIdDatabase): IController<TMesaVO>;
begin
   Self.Create(AConexao);
end;

end.
