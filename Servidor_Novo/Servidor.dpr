program Servidor;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal},
  UDMServidor in 'UDMServidor.pas' {DMServidor: TDataModule},
  orm.conexao.ModelConexaoFactory in '..\..\Framework\ORM\Conexao\orm.conexao.ModelConexaoFactory.pas',
  orm.conexao.interfaces.Interfaces in '..\..\Framework\ORM\Conexao\Interfaces\orm.conexao.interfaces.Interfaces.pas',
  orm.conexao.model_firedac.ModelFiredacConexao in '..\..\Framework\ORM\Conexao\Model_Firedac\orm.conexao.model_firedac.ModelFiredacConexao.pas',
  orm.conexao.model_firedac.ModelFiredacQuery in '..\..\Framework\ORM\Conexao\Model_Firedac\orm.conexao.model_firedac.ModelFiredacQuery.pas',
  orm.conexao.model_zeos.ModelZeosConexao in '..\..\Framework\ORM\Conexao\Model_Zeos\orm.conexao.model_zeos.ModelZeosConexao.pas',
  orm.conexao.model_zeos.ModelZeosQuery in '..\..\Framework\ORM\Conexao\Model_Zeos\orm.conexao.model_zeos.ModelZeosQuery.pas',
  orm.dao.BaseDAO in '..\..\Framework\ORM\DAO\orm.dao.BaseDAO.pas',
  orm.IBaseVO in '..\..\Framework\ORM\orm.IBaseVO.pas',
  orm.lib.Biblioteca in '..\..\Framework\ORM\Lib\orm.lib.Biblioteca.pas',
  orm.Atributos in '..\..\Framework\ORM\orm.Atributos.pas',
  orm.conexao.model_rdw.ModelRDWConexao in '..\..\Framework\ORM\Conexao\Model_RDW\orm.conexao.model_rdw.ModelRDWConexao.pas',
  orm.conexao.model_rdw.ModelRDWQuery in '..\..\Framework\ORM\Conexao\Model_RDW\orm.conexao.model_rdw.ModelRDWQuery.pas',
  orm.Controller.FabricaBaseController in '..\..\Framework\ORM\Controller\orm.Controller.FabricaBaseController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMServidor, DMServidor);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
