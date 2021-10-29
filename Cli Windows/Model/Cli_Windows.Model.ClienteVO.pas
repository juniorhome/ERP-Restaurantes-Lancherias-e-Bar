unit Cli_Windows.Model.ClienteVO;

interface

uses
    orm.IBaseVO, orm.Atributos, REST.json;

type
  [TTabela('CLIENTE', 'CLI', 'Cliente', 'Clientes')]
  [TTabelaEstrangeira('PESSOA', 'P', 'ID', 'IDPESSOA', 'LeftJoin')]
  TClienteVO = class(TInterfacedObject, IBaseVO<TClienteVO>)
    private
      FId: integer;
      FRestricao: string;
      FLimite: extended;
      FEhCliente: string;
      FIdPessoa: integer;
      FNomePessoa: string;
      FEnderecoPessoa: string;
      FBairroPessoa: string;
      FCepPessoa: string;
      FNumeroPessoa: integer;
      FComplementoPessoa: string;
    public
      [TChavePrimaria('ID', 'C�digo', 'C�digos')]
      [TGridCadastro('ID', 'C�digo', 'C�digos', 5)]
      [TGridConsulta('ID', 'C�digo', 'C�digos', 5)]
      [TCampoFiltro('ID', True)]
      property Id: integer read FId write FId;
      [TCampoTexto('RESTRICAO', 'Restri��o', 'Restri��es', '', 1, False)]
      property Restricao: string read FRestricao write FRestricao;
      [TCampoExtended('LIMITE', 'Limite', 'Limites', '00.0000,000', 15, 3)]
      property Limite: extended read FLimite write FLimite;
      [TCampoTexto('EHCLIENTE', '� Cliente', 'S�o Clientes', '', 1, False)]
      property EhCliente: string read FEhCliente write FEhCliente;
      [TChaveEstrangeira('IDPESSOA', 'PESSOA')]
      property IdPessoa: integer read FIdPessoa write FIdPessoa;
      [TCampoEstrangeiro('NOME', 'PESSOA', 'P')]
      [TGridCadastro('NOME', 'Pessoa', 'Pessoas', 60)]
      [TGridConsulta('NOME', 'Pessoa', 'Pessoas', 60)]
      [TCampoFiltro('NOME', True)]
      property NomePessoa: string read FNomePessoa write FNomePessoa;
      [TCampoEstrangeiro('ENDERECO', 'PESSOA', 'P')]
      [TGridCadastro('ENDERECO', 'Endere�o', 'Endere�os', 35)]
      [TGridConsulta('ENDERECO', 'Endere�o', 'Endere�os', 35)]
      property EnderecoPessoa: string read FEnderecoPessoa write FEnderecoPessoa;
      [TCampoEstrangeiro('BAIRRO', 'PESSOA', 'P')]
      property BairroPessoa: string read FBairroPessoa write FBairroPessoa;
      [TCampoEstraigeiro('CEP', 'PESSOA', 'P')]
      property CepPessoa: string read FCepPessoa write FCepPessoa;
      [TCampoEstrangeiro('NUMERO', 'PESSOA', 'P')]
      property NumeroPessoa: integer read FNumeroPessoa write FNumeroPessoa;
      [TCampoEstrangeiro('COMPLEMENTO', 'PESSOA', 'P')]
      property ComplementoPessoa: string read FComplementoPessoa write FComplementoPessoa;
      constructor Create;
      destructor Destroy;override;
      class function New: IBaseVO<TClienteVO>;
      function toJson(): string;
      function fromJson(json: string): TClienteVO;
  end;

implementation

{ TClienteVO }

constructor TClienteVO.Create;
begin
   //
end;

destructor TClienteVO.Destroy;
begin
  //
  inherited;
end;

function TClienteVO.fromJson(json: string): TClienteVO;
begin
  Result := TJson.JsonToObject<TClienteVO>(json);
end;

class function TClienteVO.New: IBaseVO<TClienteVO>;
begin
  Result := Self.Create;
end;

function TClienteVO.toJson: string;
begin
  Result := TJson.ObjectToJsonString(Self);
end;

end.