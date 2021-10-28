unit Cli_Windows.Model.BancoVO;

interface

uses
    orm.IBaseVO, orm.Atributos, REST.json;

type
  [TTabela('BANCO', 'B', 'Banco', 'Bancos')]
  TBancoVO = class(TInterfacedObject, IBaseVO<TBancoVO>)
    private
      FId: integer;
      FNum_Banco: string;
      FDigito_Banco: string;
      FNome_Banco: string;
      FNome_Agencia: string;
      FNum_Agencia: string;
      FDigito_Agencia: string;
      FNum_Conta: string;
      FDigito_Conta: string;
      FCidade_Agencia: string;
      FUf_Agencia: string;
      FNosso_Numero: string;
      FCedente: string;
      FCod_Cedente: string;
    public
      [TChavePrimaria('ID', 'Código', 'Códigos')]
      [TGridCadastro('ID', 'Código', 'Códigos', 5)]
      [TGridConsulta('ID', 'Código', 'Código', 5)]
      [TCampoFiltro('ID', True)]
      property Id: integer read FId write FId;
      [TCampoTexto('NUM_BANCO', 'Número Banco', 'Números Banco', '', 5, False)]
      property NumBanco: string read FNum_Banco write FNum_Banco;
      [TCampoTexto('DIGITO_BANCO', 'Dígito Banco', 'Dígitos Banco', '', 2, False)]
      property DigitoBanco: string read FDigito_Banco write FDigito_Banco;
      [TCampoTexto('NOME_BANCO', 'Nome Banco', 'Nomes Banco', '', 50, False)]
      [TGridCadastro('NOME_BANCO', 'Nome Banco', 'Nomes Banco', 40)]
      [TGridConsulta('NOME_BANCO', 'Nome Banco', 'Nomes Banco', 40)]
      [TCampoFiltro('NOME_BANCO', True)]
      property NomeBanco: string read FNome_Banco write FNome_Banco;
      [TCampoTexto('NOME_AGENCIA', 'Nome Agência', 'Nomes Agências', '',  50, False)]
      property NomeAgencia: string read FNome_Agencia write FNome_Agencia;
      [TCampoTexto('NUM_AGENCIA', 'Número Agência', 'Números Agência', '' , 10, False)]
      [TGridCadastro('NUM_AGENCIA', 'Número Agência', 'Numeros Agência', 10)]
      [TGridConsulta('NUM_AGENCIA', 'Número Agência', 'Números Agência', 10)]
      property NumAgencia: string read FNum_Agencia write FNum_Agencia;
      [TCampoTexto('DIGITO_AGENCIA', 'Dígito Agência', 'Dígitos Agência', '', 2, False)]
      property DigitoAgencia: string read FDigito_Agencia write FDigito_Agencia;
      [TCampoTexto('NUM_CONTA', 'Número Conta', 'Números Conta', '', 50, False)]
      property NumConta: string read FNum_Conta write FNum_Conta;
      [TCampoTexto('DIGITO_CONTA', 'Dígito Conta', 'Dígitos Conta', '', 2, False)]
      property DigitoConta: string read FDigito_Conta write FDigito_Conta;
      [TCampoTexto('CIDADE_AGENCIA', 'Cidade', 'Cidades', '', 80, False)]
      [TGridCadastro('CIDADE_AGENCIA', 'Cidade', 'Cidades', 40)]
      [TGridConsulta('CIDADE_AGENCIA', 'Cidade', 'Cidades', 40)]
      [TCampoFiltro('CIDADE_AGENCIA', True)]
      property CidadeAgencia: string read FCidade_Agencia write FCidade_Agencia;
      [TCampoTexto('UF_AGENCIA', 'Estado', 'Estados', '', 2, False)]
      [TGridCadastro('UF_AGENCIA', 'Estado', 'Estados', 5)]
      [TGridConsulta('UF_AGENCIA', 'Estado', 'Estados', 5)]
      [TCampoFiltro('UF_AGENCIA', True)]
      property UfAgencia: string read FUf_Agencia write FUf_Agencia;
      [TCampoTexto('NOSSO_NUMERO', 'Nosso Número', 'Nossos Números', '', 20, False)]
      property NossoNumero: string read FNosso_Numero write FNosso_Numero;
      [TCampoTexto('CEDENTE', 'Cedente', 'Cedentes', '', 50, False)]
      property Cedente: string read FCedente write FCedente;
      [TCampoTexto('COD_CEDENTE', 'Cód. Cedente', 'Cód. Cedente', '', 20, False)]
      property CodCedente: string read FCod_Cedente write FCod_Cedente;
      constructor Create;
      destructor destroy;override;
      class function New: IBaseVO<TBancoVO>;
      function toJson(): string;
      function fromJson(json: string): TBancoVO;
  end;

implementation

{ TBancoVO }

constructor TBancoVO.Create;
begin
   //
end;

destructor TBancoVO.destroy;
begin
  //
  inherited;
end;

function TBancoVO.fromJson(json: string): TBancoVO;
begin
  Result := TJson.JsonToObject<TBancoVO>(json);
end;

class function TBancoVO.New: IBaseVO<TBancoVO>;
begin
   Result := Self.Create;
end;

function TBancoVO.toJson: string;
begin
  Result := TJson.ObjectToJsonString(Self);
end;

end.
