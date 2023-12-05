unit Cli_Windows.model.Grupo.Interfaces;

interface

uses Cli_Windows.Model.GrupoVO, orm.conexao.interfaces.Interfaces, Data.DB;

type
  iModelGrupo = interface
    ['{5E8D4C6D-4F2F-4051-B6DD-B43945B99550}']
    function Entidade: TGrupoVO;
    function DAO: IDAO<TGrupoVO>;
    function DataSource(aDataSource: TDataSource): iModelGrupo;
  end;

implementation

end.
