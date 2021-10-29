unit Cli_Windows.Model.PessoaVO;

interface

uses
    orm.IBaseVO, orm.Atributos, REST.json;

type
  [TTabela('PESSOA', 'P', 'Pessoa', 'Pessoas')]
  [TTabelaEstrangeira('CIDADE', 'CID', 'ID', 'IDCIDADE', 'LeftJoin')]
  TPessoaVO = class(TInterfacedObject, IBaseVO<TPessoaVO>)
    private
      FId: integer;
      FNome: string;
      FEndereco: string;
      FNumero: integer;
      FBairro: string;
      FComplemento: string;
      FCep: string;
      FEmail: string;
      FData_Nasc: TDate;
      FData_Cad: TDate;
      FTelefone: string;
      FCelular: string;
      FAtivo: string;
      FIdCidade: integer;
      FCidadeCidade: string;
    public
      [TChavePrimaria('ID', 'C�digo', 'C�digos')]
      property Id: integer read FId write FId;
      [TCampoTexto('NOME', 'Nome', 'Nomes', '', 200, False)]
      property Nome: string read FNome write FNome;
      [TCampoTexto('ENDERECO', 'Endere�o', 'Endere�os', '', 150, False)]
      property Endereco: string read FEndereco write FEndereco;
      [TCampoInteiro('NUMERO', 'N�mero', 'N�meros')]
      property Numero: integer read FNumero write FNumero;
      [TCampoTexto('BAIRRO', 'Bairro', 'Bairros', '', 150, False)]
      property Bairro: string read FBairro write FBairro;
      [TCampoTexto('COMPLEMENTO', 'Complemento', 'Complementos', '', 150, False)]
      property Complemento: string read FComplemento write FComplemento;
      [TCampoTexto('CEP', 'CEP', 'CEPs', '99999-999', 10, True)]
      property Cep: string read FCep write FCep;
      [TCampoTexto('EMAIL', 'E-Mail', 'E-Mails', '', 255, False)]
      property Email: string read FEmail write FEmail;
      [TCampoData('DATA_NASC', '99/99/9999', 'Data Nascimento', 'Datas Nascimento')]
      property DataNasc: TDate read FData_Nasc write FData_Nasc;
      [TCampoData('DATA_CAD', '99/99/9999', 'Data Cadastro', 'Datas Cadastro')]
      property DataCad: TDate read FData_Cad write FData_Cad;
      [TCampoTexto('TELEFONE', 'Telefone', 'Telefones', '(99)9999-9999', 20, True)]
      property Telefone: string read FTelefone write FTelefone;
      [TCampoTexto('CELULAR', 'Celular', 'Celulares', '(99)99999-9999', 20, True)]
      property Celular: string read FCelular write FCelular;
      [TCampoTexto('ATIVO', 'Ativo', 'Ativos', '', 1, False)]
      property Ativo: string read FAtivo write FAtivo;
      [TChaveEstrangeira('IDCIDADE', 'CIDADE')]
      property IdCidade: integer read FIdCidade write FIdCidade;
      [TCampoEstrangeiro('CIDADE', 'CIDADE', 'CID')]
      property CidadeCidade: string read FCidadeCidade write FCidadeCidade;
      constructor Create;
      destructor Destroy;override;
      class function New: IBaseVO<TPessoaVO>;
      function toJson(): string;
      function fromJson(json: string): TPessoaVO;
  end;

implementation

{ TPessoaVO }

constructor TPessoaVO.Create;
begin
   //
end;

destructor TPessoaVO.Destroy;
begin
  //
  inherited;
end;

function TPessoaVO.fromJson(json: string): TPessoaVO;
begin
  Result := TJson.JsonToObject<TPessoaVO>(json);
end;

class function TPessoaVO.New: IBaseVO<TPessoaVO>;
begin
  Result := Self.Create;
end;

function TPessoaVO.toJson: string;
begin
  Result := TJson.ObjectToJsonString(Self);
end;

end.