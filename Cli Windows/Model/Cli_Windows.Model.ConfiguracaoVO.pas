unit Cli_Windows.Model.ConfiguracaoVO;

interface

uses
    orm.IBaseVO, orm.Atributos, REST.json;

type
  [TTabela('CONFIGURACAO', 'CONF', 'Configura��o', 'Configura��es')]
  [TTabelaEstrangeira('CRT', 'CR', 'ID', 'IDCRT', 'LeftJoin')]
  TConfiguracaoVO = class(TInterfacedObject, IBaseVO<TConfiguracaoVO>)
    private
      FId: integer;
      FPath_Xml: string;
      FPath_Danfe: string;
      FPath_Remessa: string;
      FPath_Retorno: string;
      FPath_Logo: string;
      FDias_Protesto: integer;
      FEspecie: string;
      FAceite: string;
      FCarteira: string;
      FLocal_Pgto: string;
      FInstrucao_1: string;
      FInstrucao_2: string;
      FCont_Remessa: integer;
      FPath_Pdf: string;
      FCertificadora: string;
      FTipo_Cert: string;
      FPath_Certificadora: string;
      FRazao_Social: string;
      FFantasia: string;
      FCnpj: string;
      FIdCrt: integer;
      FCrtCrt: string;
      FDescricaoCrt: string;
    public
      [TChavePrimaria('ID', 'C�digo', 'C�digos')]
      [TGridCadastro('ID', 'C�digo', 'C�digos', 5)]
      [TGridConsulta('ID', 'C�digo', 'C�digos', 5)]
      [TCampoFiltro('ID', True)]
      property Id: integer read FId write FId;
      [TCampoTexto('PATH_XML', 'Caminho Nota', 'Caminhos Notas', '', 150, False)]
      property PathXML: string read FPath_Xml write FPath_Xml;
      [TCampoTexto('PATH_DANFE', 'Caminho DANFE', 'Caminhos DANFEs', '', 150, False)]
      property PathDanfe: string read FPath_Danfe write FPath_Danfe;
      [TCampoTexto('PATH_REMESSA', 'Caminho Remessa', 'Caminhos Remessas', '', 150, False)]
      property PathRemessa: string read FPath_Remessa write FPath_Remessa;
      [TCampoTexto('PATH_RETORNO', 'Caminho Retorno', 'Caminhos Retornos', '', 150, False)]
      property PathRetorno: string read FPath_Retorno write FPath_Retorno;
      [TCampoTexto('PATH_LOGO', 'Caminho Logo', 'Caminhos Logos', '', 150, False)]
      property PathLogo: string read FPath_Logo write FPath_Logo;
      [TCampoInteiro('DIAS_PROTESTO', 'Dias Protesto', 'Dias Protestos')]
      property DiasProtesto: integer read FDias_Protesto write FDias_Protesto;
      [TCampoTexto('ESPECIE', 'Esp�cie', 'Esp�cies', '', 20, False)]
      property Especie: string read FEspecie write FEspecie;
      [TCampoTexto('ACEITE', 'Aceite', 'Aceites', '', 3, False)]
      property Aceite: string read FAceite write FAceite;
      [TCampoTexto('CARTEIRA', 'Carteira', 'Carteiras', '', 3, False)]
      property Carteira: string read FCarteira write FCarteira;
      [TCampoTexto('LOCAL_PGTO', 'Local Pagamento', 'Locais Pagamentos', '', 100, False)]
      property LocalPgto: string read FLocal_Pgto write FLocal_Pgto;
      [TCampoTexto('INSTRUCAO_1', 'Intru��o 1', 'Instru��es 1', '', 100, False)]
      property Intrucao1: string read FInstrucao_1 write FInstrucao_1;
      [TCampoTexto('INSTRUCAO_2', 'Instru��o 2', 'Instru��es 2', '', 100, False)]
      property Instrucao2: string read FInstrucao_2 write FInstrucao_2;
      [TCampoInteiro('CONT_REMESSA', 'Contador Remessa', 'Contadores Remessas')]
      property ContRemessa: integer read FCont_Remessa write FCont_Remessa;
      [TCampoTexto('PATH_PDF', 'Caminho PDF', 'Caminhos PDF', '', 150, False)]
      property PathPdf: string read FPath_Remessa write FPath_Remessa;
      [TCampoTexto('CERTIFICADORA', 'Certificadora', 'Certificadoras', '', 100, False)]
      property Certificadora: string read FCertificadora write FCertificadora;
      [TCampoTexto('TIPO_CERT', 'Tipo Certificado', 'Tipos Certificados', '', 3, False)]
      property TipoCertiificadora: string read FTipo_Cert write FTipo_Cert;
      [TCampoTexto('PATH_CERTIFICADORA', 'Caminho Certificado', 'Caminho Certificado', '', 150, False)]
      property PathCertificadora: string read FPath_Certificadora write FPath_Certificadora;
      [TCampoTexto('RAZAO_SOCIAL', 'Raz�o Social', 'Raz�es Sociais', '', 200, False)]
      [TGridCadastro('RAZAO_SOCIAL', 'Raz�o Social', 'Raz�es Sociais', 50)]
      [TGridConsulta('RAZAO_SOCIAL', 'Raz�o Social', 'Raz�es Sociais', 50)]
      [TCampoFiltro('RAZAO_SOCIAL', True)]
      property RazaoSocial: string read FRazao_Social write FRazao_Social;
      [TCampoTexto('FANTASIA', 'Fantasia', 'Fantasias', '', 200, False)]
      [TGridCadastro('FANTASIA', 'Nome Fantasia', 'Nomes Fantasias', 45)]
      [TGridConsulta('FANTASIA', 'Nome Fantasia', 'Nomes Fantasias', 45)]
      [TCampoFiltro('FANTASIA', True)]
      property Fantasia: string read FFantasia write FFantasia;
      [TcampoTexto('CNPJ', 'CNPJ', 'CNPJs', '99.999.999/9999-99', 20, True)]
      property Cnpj: string read FCnpj write FCnpj;
      [TChaveEstrangeira('IDCRT', 'CRT')]
      property IdCrt: integer read FIdCrt write FIdCrt;
      [TCampoEstrangeiro('CRT', 'CRT', 'CR')]
      property CrtCrt: string read FCrtCrt write FCrtCrt;
      [TCampoEstrangeiro('DESCRICAO', 'CRT', 'CR')]
      property DescricaoCrt: string read FDescricaoCrt write FDescricaoCrt;
      constructor Create;
      destructor Destroy;override;
      class function New: TConfiguracaoVO;
      function toJson(): string;
      function fromJson(json: string): TConfiguracaoVO;
  end;

implementation

{ TConfiguracaoVO }

constructor TConfiguracaoVO.Create;
begin
  //
end;

destructor TConfiguracaoVO.Destroy;
begin
  //
  inherited;
end;

function TConfiguracaoVO.fromJson(json: string): TConfiguracaoVO;
begin
  Result := TJson.JsonToObject<TConfiguracaoVO>(json);
end;

class function TConfiguracaoVO.New: TConfiguracaoVO;
begin
  Result := Self.Create;
end;

function TConfiguracaoVO.toJson: string;
begin
   Result := TJson.ObjectToJsonString(Self);
end;

end.
