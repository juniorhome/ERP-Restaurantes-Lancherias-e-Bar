program ErpClient;

uses
  Vcl.Forms,
  Cli_Windows.View.ufrmPrincipal in 'View\Cli_Windows.View.ufrmPrincipal.pas' {frmPrincipal},
  Cli_Windows.Model.UfVO in 'Model\Cli_Windows.Model.UfVO.pas',
  Fabica_Objetos.IFactoryMethod in '..\..\Framework\Fabrica_Objetos\Fabica_Objetos.IFactoryMethod.pas',
  Fabrica_Objetos.FabricaObjeto in '..\..\Framework\Fabrica_Objetos\Fabrica_Objetos.FabricaObjeto.pas',
  orm.Atributos in '..\..\Framework\ORM\orm.Atributos.pas',
  orm.IBaseVO in '..\..\Framework\ORM\orm.IBaseVO.pas',
  Cli_Windows.Model.CartaoVO in 'Model\Cli_Windows.Model.CartaoVO.pas',
  Cli_Windows.Model.CFOPVO in 'Model\Cli_Windows.Model.CFOPVO.pas',
  Cli_Windows.Model.CestVO in 'Model\Cli_Windows.Model.CestVO.pas',
  Cli_Windows.Model.CrtVO in 'Model\Cli_Windows.Model.CrtVO.pas',
  Cli_Windows.Model.CsosnVO in 'Model\Cli_Windows.Model.CsosnVO.pas',
  Cli_Windows.Model.CstCofinsVO in 'Model\Cli_Windows.Model.CstCofinsVO.pas',
  Cli_Windows.Model.CstIcmsVO in 'Model\Cli_Windows.Model.CstIcmsVO.pas' {/Cli_Windows.Model.CstIcmsSTVO. in 'Model\Cli_Windows.Model.CstIcmsSTVO..pas';},
  Cli_Windows.Model.CstIpiVO in 'Model\Cli_Windows.Model.CstIpiVO.pas',
  Cli_Windows.Model.CstPisVO in 'Model\Cli_Windows.Model.CstPisVO.pas',
  Cli_Windows.Model.FormaPgtoVO in 'Model\Cli_Windows.Model.FormaPgtoVO.pas',
  Cli_Windows.Model.MesaVO in 'Model\Cli_Windows.Model.MesaVO.pas',
  Cli_Windows.Model.NcmVO in 'Model\Cli_Windows.Model.NcmVO.pas',
  Cli_Windows.Model.UsuarioVO in 'Model\Cli_Windows.Model.UsuarioVO.pas',
  Cli_Windows.Model.CidadeVO in 'Model\Cli_Windows.Model.CidadeVO.pas',
  Cli_Windows.Model.PessoaVO in 'Model\Cli_Windows.Model.PessoaVO.pas',
  Cli_Windows.Model.PerfilUsuarioVO in 'Model\Cli_Windows.Model.PerfilUsuarioVO.pas',
  Cli_Windows.Model.BancoVO in 'Model\Cli_Windows.Model.BancoVO.pas',
  Cli_Windows.Model.ClienteVO in 'Model\Cli_Windows.Model.ClienteVO.pas',
  Cli_Windows.Model.PessoaFisicaVO in 'Model\Cli_Windows.Model.PessoaFisicaVO.pas',
  Cli_Windows.Model.PessoaJuridicaVO in 'Model\Cli_Windows.Model.PessoaJuridicaVO.pas',
  orm.Controller.FabricaBaseController in '..\..\Framework\ORM\Controller\orm.Controller.FabricaBaseController.pas',
  orm.dao.BaseDAO in '..\..\Framework\ORM\DAO\orm.dao.BaseDAO.pas',
  orm.lib.Biblioteca in '..\..\Framework\ORM\Lib\orm.lib.Biblioteca.pas',
  Cli_Windows.Model.ConfiguracaoVO in 'Model\Cli_Windows.Model.ConfiguracaoVO.pas',
  Cli_Windows.Model.ProdutoVO in 'Model\Cli_Windows.Model.ProdutoVO.pas',
  Cli_Windows.Model.ReservaVO in 'Model\Cli_Windows.Model.ReservaVO.pas',
  orm.conexao.interfaces.Interfaces in '..\..\Framework\ORM\Conexao\Interfaces\orm.conexao.interfaces.Interfaces.pas',
  orm.conexao.ModelConexaoFactory in '..\..\Framework\ORM\Conexao\orm.conexao.ModelConexaoFactory.pas',
  orm.conexao.model_rdw.ModelRDWQuery in '..\..\Framework\ORM\Conexao\Model_RDW\orm.conexao.model_rdw.ModelRDWQuery.pas',
  orm.conexao.model_zeos.ModelZeosConexao in '..\..\Framework\ORM\Conexao\Model_Zeos\orm.conexao.model_zeos.ModelZeosConexao.pas',
  orm.conexao.model_zeos.ModelZeosQuery in '..\..\Framework\ORM\Conexao\Model_Zeos\orm.conexao.model_zeos.ModelZeosQuery.pas',
  orm.conexao.model_firedac.ModelFiredacConexao in '..\..\Framework\ORM\Conexao\Model_Firedac\orm.conexao.model_firedac.ModelFiredacConexao.pas',
  orm.conexao.model_firedac.ModelFiredacQuery in '..\..\Framework\ORM\Conexao\Model_Firedac\orm.conexao.model_firedac.ModelFiredacQuery.pas' {/Cli_Windows.Model.CartaoVO in 'Model\Cli_Windows.Model.CartaoVO.pas',},
  Cli_Windows.View.uDM in 'View\Cli_Windows.View.uDM.pas' {DMCliente: TDataModule},
  Cli_Windows.View.ufrmCadBasico in 'View\Cli_Windows.View.ufrmCadBasico.pas' {frmCadBasico},
  Cli_Windows.Controller.PessoaController in 'Controller\Cli_Windows.Controller.PessoaController.pas',
  Cli_Windows.Controller.CidadeController in 'Controller\Cli_Windows.Controller.CidadeController.pas',
  Cli_Windows.Controller.MesaController in 'Controller\Cli_Windows.Controller.MesaController.pas',
  Cli_Windows.View.uFrmLogin in 'View\Cli_Windows.View.uFrmLogin.pas' {frmLogin},
  Cli_Windows.View.ufrmConsulta in 'View\Cli_Windows.View.ufrmConsulta.pas' {frmConsulta},
  Cli_Windos.View.ufrmRelatorioBase in 'View\Cli_Windos.View.ufrmRelatorioBase.pas' {frmRelatorioBase},
  orm.lib.Constantes in '..\..\Framework\ORM\Lib\orm.lib.Constantes.pas',
  orm.seguranca.criptografia in '..\..\Framework\ORM\Seguranca\orm.seguranca.criptografia.pas',
  orm.Validacao in '..\..\Framework\ORM\Validacao\orm.Validacao.pas',
  Cli_Windows.View.ufrmCadGrupo in 'View\Cli_Windows.View.ufrmCadGrupo.pas' {frmCadBasico1},
  orm.lib.SessaoUsuario in '..\..\Framework\ORM\Lib\orm.lib.SessaoUsuario.pas',
  Cli_Windows.Controller.UsuarioController in 'Controller\Cli_Windows.Controller.UsuarioController.pas';

//Cli_Windows.Model.CartaoVO in 'Model\Cli_Windows.Model.CartaoVO.pas',
  //Cli_Windows.Model.CFOPVO in 'Model\Cli_Windows.Model.CFOPVO.pas',
  //Cli_Windows.Model.CestVO in 'Model\Cli_Windows.Model.CestVO.pas',
  //Cli_Windows.Model.CrtVO in 'Model\Cli_Windows.Model.CrtVO.pas',
  //Cli_Windows.Model.CsosnVO in 'Model\Cli_Windows.Model.CsosnVO.pas',
  //Cli_Windows.Model.CstCofinsVO in 'Model\Cli_Windows.Model.CstCofinsVO.pas',
  //Cli_Windows.Model.CstIcmsVO in 'Model\Cli_Windows.Model.CstIcmsVO.pas';
  //Cli_Windows.Model.CstIcmsSTVO. in 'Model\Cli_Windows.Model.CstIcmsSTVO..pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMCliente, DMCliente);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmRelatorioBase, frmRelatorioBase);
  Application.CreateForm(TfrmCadBasico1, frmCadBasico1);
  Application.Run;
end.
