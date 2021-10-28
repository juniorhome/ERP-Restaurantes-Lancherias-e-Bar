unit Cli_Windows.Model.PessoaFisicaVO;

interface

uses
   orm.IBaseVO, orm.Atributos, REST.json;

type
  [TTabela('PESSOA_FISICA', 'PF', 'Pessoa F�sica', 'Pessoas F�sicas')]
  [TTabelaEstrangeira('PESSOA', 'P', 'ID', 'IDPESSOA', 'LeftJoin')]
  [TTabelaEstrangeira('CIDADE', 'CID', 'ID', 'IDCIDADE', 'LeftJoin')]
  TPessoaFisicaVO = class(TInterfacedObject, IBaseVO<TPessoaFisicaVO>)
    private
      FId: integer;
      FRg: string;
      FCpf: string;
      FIdPessoa: integer;
      FNomePessoa: string;
      FEnderecoPessoa: string;
      FBairroPessoa: string;
      FNumeroPessoa: integer;
      FCepPessoa: string;
      FComplementoPessoa: string;
      FCidadeCidade: string;
    public
      [TChavePrimaria('ID', 'C�digo', 'C�digos')]
      property Id: integer read FId write FId;
      [TCampoTexto('RG', 'Identidade', 'Identidades', '', 10, False)]
      property Rg: string read FRg write FRg;
      [TCampoTexto('CPF', 'CPF', 'CPFs', '999.999.999-99_', 11, True)]
      property Cpf: string read FCpf write FCpf;
      [TChaveEstrangeira('IDPESSOA', 'PESSOA')]
      property IdPessoa: integer read FIdPessoa write FIdPessoa;
      [TCampoEstrangeiro('NOME', 'PESSOA', 'P')]
      property NomePessoa: string read FNomePessoa write FNomePessoa;
      [TCampoEstrangeiro('ENDERECO', 'PESSOA', 'P')]
      property EnderecoPessoa: string read FEnderecoPessoa write FEnderecoPessoa;
      [TCampoEstrangeiro('BAIRRO', 'PESSOA', 'P')]
      property BairroPessoa: string read FBairroPessoa write FBairroPessoa;
      [TCampoEstrangeiro('NUMERO', 'PESSOA', 'P')]
      property NumeroPessoa: integer read FNumeroPessoa write FNumeroPessoa;
      [TCampoEstrangeiro('CEP', 'PESSOA', 'P')]
      property CepPessoa: string read FCepPessoa write FCepPessoa;
      [TCampoEstrangeiro('COMPLEMENTO', 'PESSOA', 'P')]
      property ComplementoPessoa: string read FComplementoPessoa write FComplementoPessoa;
      [TCampoEstrangeiro('CIDADE', 'CIDADE', 'CID')]
      property CidadeCidade: string read FCidadeCidade write FCidadeCidade;
      constructor Create;
      destructor Destroy;override;
      class function New: IBaseVO<TPessoaFisicaVO>;
      function toJson(): string;
      function fromJson(json: string): TPessoaFisicaVO;
  end;

implementation

{ TPessoaFisicaVO }

constructor TPessoaFisicaVO.Create;
begin
  //
end;

destructor TPessoaFisicaVO.Destroy;
begin
  //
  inherited;
end;

function TPessoaFisicaVO.fromJson(json: string): TPessoaFisicaVO;
begin
   Result := TJson.JsonToObject<TPessoaFisicaVO>(json);
end;

class function TPessoaFisicaVO.New: IBaseVO<TPessoaFisicaVO>;
begin
   Result := Self.Create;
end;

function TPessoaFisicaVO.toJson: string;
begin
  Result := TJson.ObjectToJsonString(Self);
end;

end.
