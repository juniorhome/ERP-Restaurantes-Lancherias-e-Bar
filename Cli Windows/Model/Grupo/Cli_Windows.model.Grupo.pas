unit Cli_Windows.model.Grupo;

interface

uses
  Cli_Windows.model.Grupo.Interfaces, Cli_Windows.Model.GrupoVO, Data.DB,
  orm.conexao.interfaces.Interfaces, orm.dao.BaseDAO,
  orm.conexao.model_rdw.ModelRDWQuery;

type
  TModelGrupo = class(TInterfacedObject, iModelGrupo)
    private
      FEntidade: TGrupoVO;
      FDAO: IDAO<TGrupoVO>;
      FDataSource: TDataSource;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iModelGrupo;
      function Entidade: TGrupoVO;
      function DAO: IDAO<TGrupoVO>;
      function DataSource(aDataSource: TDataSource): iModelGrupo;
  end;

implementation

{ TModelGrupo }

uses Cli_Windows.View.uDM;

constructor TModelGrupo.Create;
begin
   FEntidade := TGrupoVO.Create;
   FDAO := TBaseDAO<TGrupoVO>.New(TModelRDWQuery<TGrupoVO>.New(DMCliente.RESTDWIdDatabase1));
end;

function TModelGrupo.DAO: IDAO<TGrupoVO>;
begin
   Result := FDAO;
end;

function TModelGrupo.DataSource(aDataSource: TDataSource): iModelGrupo;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDAO.DataSource(FDataSource);
end;

destructor TModelGrupo.Destroy;
begin
  FEntidade.Free;
  inherited;
end;

function TModelGrupo.Entidade: TGrupoVO;
begin
   Result := FEntidade;
end;

class function TModelGrupo.New: iModelGrupo;
begin
   Result := Self.Create;
end;

end.
