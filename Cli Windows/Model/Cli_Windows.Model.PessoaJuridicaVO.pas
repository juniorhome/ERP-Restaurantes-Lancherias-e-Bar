unit Cli_Windows.Model.PessoaJuridicaVO;

interface

uses
    orm.IBaseVO, orm.Atributos, REST.json;

type
  [TTabela('PESSOA_JURIDICA', 'PJ', 'Pessoa Jurídica', 'Pessoas Jurídicas')]
  [TTabelaEstrangeira('PESSOA', 'P', 'ID', 'IDPESSOA', 'LeftJoin')]
  TPessoaJuridicaVO = class(TInterfacedObject, IBaseVO<TPessoaJuridicaVO>)
    private
      FId: integer;
      FRazao_Social: string;
      FFantasia: string;
      FIe: string;
      FIm: string;
      FCnpj: string;
      FIdPessoa: integer;
      FNomePessoa: string;
      FEnderecoPessoa: string;
      FComplementoPessoa: string;
      FNumeroPessoa: integer;
      FBairroPessoa: string;
      FCepPessoa: string;
    public
      [TChavePrimaria('ID', 'Código', 'Códigos')]
      property Id: integer read FId write FId;
      [TCampoTexto('RAZAO_SOCIAL', 'Razão Social', 'Razões Sociais', '', 200, False)]
      property RazaoSocial: string read FRazao_Social write FRazao_Social;
      [TCampoTexto('FANTASIA', 'Nome Fantasia', 'Nomes Fantasias', '', 200, False)]
      property Fantasia: string read FFantasia write FFantasia;
      [TCampoTexto('IE', 'Inscrição Estadual', 'Inscrições Estaduais', '', 20, False)]
      property Ie: string read FIe write FIe;
      [TCampoTexto('IM', 'Inscrição Municipal', 'Inscrições Municipais', '', 20, False)]
      property Im: string read FIm write FIm;
      [TCampoTexto('CNPJ', 'CNPJ', 'CNPJs', '99.999.999/9999-99', 20, True)]
      property Cnpj: string read FCnpj write FCnpj;
      [TChaveEstrangeira('IDPESSOA', 'PESSOA')]
      property IdPessoa: integer read FIdPessoa write FIdPessoa;
      [TCampoEstrangeiro('NOME', 'PESSOA', 'P')]
      property NomePessoa: string read FNomePessoa write FNomePessoa;
      [TCampoEstrangeiro('ENDERECO', 'PESSOA', 'P')]
      property EnderecoPessoa: string read FEnderecoPessoa write FEnderecoPessoa;
      [TCampoEstrangeiro('COMPLEMENTO', 'PESSOA', 'P')]
      property ComplementoPessoa: string read FComplementoPessoa write FComplementoPessoa;
      [TCampoEstrangeiro('NUMERO', 'PESSOA', 'P')]
      property NumeroPessoa: integer read FNumeroPessoa write FNumeroPessoa;
      [TCampoEstrangeiro('BAIRRO', 'PESSOA', 'P')]
      property BairroPessoa: string read FBairroPessoa write FBairroPessoa;
      [TCampoEstrangeiro('CEP', 'PESSOA', 'P')]
      property CepPessoa: string read FCepPessoa write FCepPessoa;
      constructor Create;
      destructor Destroy;override;
      class function New: IBaseVO<TPessoaJuridicaVO>;
      function toJson(): string;
      function fromJson(json: string): TPessoaJuridicaVO;
  end;

implementation

{ TPessoaJuridicaVO }

constructor TPessoaJuridicaVO.Create;
begin
  //
end;

destructor TPessoaJuridicaVO.Destroy;
begin
  //
  inherited;
end;

function TPessoaJuridicaVO.fromJson(json: string): TPessoaJuridicaVO;
begin
   Result := TJson.JsonToObject<TPessoaJuridicaVO>(json);
end;

class function TPessoaJuridicaVO.New: IBaseVO<TPessoaJuridicaVO>;
begin
  Result := Self.Create;
end;

function TPessoaJuridicaVO.toJson: string;
begin
   Result := TJson.ObjectToJsonString(Self);
end;

end.
