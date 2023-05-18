unit Cli_Windows.Controller.UsuarioController;

interface

uses orm.conexao.interfaces.Interfaces, orm.dao.BaseDAO, DB, uRESTDWIdBase, uRESTDWConsts, Cli_Windows.Model.UsuarioVO;

type
  TUsuarioController = class(TInterfacedObject, IController<TUsuarioVO>)
  private
    FConexao: TRESTDWIdDataBase;
  public
    function Salvar(obj: TUsuarioVO): integer;
    function Atualizar(obj: TUsuarioVO): boolean;
    function Excluir(obj: TUsuarioVO): boolean;
    function Listagem(obj: TUsuarioVO): TDataSet;
    //class function New(AConexao: TRESTDWIdDataBase): IController<TUsuarioVO>;
    constructor Create(AConexao: TRESTDWIdDataBase);
    function Login(obj: TUsuarioVO): TUsuarioVO;
    procedure Logout(obj: TUsuarioVO);
    function ListagemId(obj: TUsuarioVO): TUsuarioVO;
    function ListagemNome(obj: TUsuarioVO): TUsuarioVO;
  end;

implementation

{ TUsuarioController }

function TUsuarioController.Atualizar(obj: TUsuarioVO): boolean;
begin
   Result := TBaseDAO<TUsuarioVO>.New(FConexao).Atualizar(obj);
end;

constructor TUsuarioController.Create(AConexao: TRESTDWIdDataBase);
begin
  FConexao := AConexao;
end;

function TUsuarioController.Excluir(obj: TUsuarioVO): boolean;
begin
   Result := TBaseDAO<TUsuarioVO>.New(FConexao).Excluir(obj);
end;

function TUsuarioController.Listagem(obj: TUsuarioVO): TDataSet;
begin
  Result := TBaseDAO<TUsuarioVO>.New(FConexao).Listagem(obj, '', '', False);
end;

function TUsuarioController.ListagemId(obj: TUsuarioVO): TUsuarioVO;
begin
  Result := TBaseDAO<TUsuarioVO>.New(FConexao).Listagem(obj);
end;

function TUsuarioController.ListagemNome(obj: TUsuarioVO): TUsuarioVO;
begin
  Result := TBaseDAO<TUsuarioVO>.New(FConexao).Listagem(obj);
end;

function TUsuarioController.Login(obj: TUsuarioVO): TUsuarioVO;
begin
  Result := TBaseDAO<TUsuarioVO>.New(FConexao).Listagem(obj);
end;

procedure TUsuarioController.Logout(obj: TUsuarioVO);
begin
   obj.Free;
end;

//class function TUsuarioController.New(
  //AConexao: TRESTDWIdDataBase): IController<TUsuarioVO>;
//begin
   //Result := Self.Create(AConexao);
//end;

function TUsuarioController.Salvar(obj: TUsuarioVO): integer;
begin
   Result := TBaseDAO<TUsuarioVO>.New(FConexao).Inserir(obj);
end;

end.
