unit Cli_Windows.Model.CidadeVO;

interface

uses
   orm.IBaseVO, orm.Atributos, REST.json;

type
  [TTabela('CIDADE', 'CID', 'Cidade', 'Cidades')]
  [TTabelaEstrangeira('UF', 'U', 'ID', 'IDUF', 'LeftJoin')]
  TCidadeVO = class(TInterfacedObject, IBaseVO<TCidadeVO>)
    private
      FId: integer;
      FCidade: string;
      FCod_Ibge: string;
      FIdUf: integer;
      FSiglaUf: string;
    public
      [TChavePrimaria('ID', 'C�digo', 'C�digos')]
      [TGridCadastro('ID', 'C�digo', 'C�digos', 5)]
      [TGridConsulta('ID', 'C�digo', 'C�digos', 5)]
      [TCampoFiltro('ID', True)]
      property Id: integer read FId write FId;
      [TCampoTexto('CIDADE', 'Cidade', 'Cidades', '', 100, False)]
      [TGridCadastro('CIDADE', 'Cidade', 'Cidades', 80)]
      [TGridConsulta('CIDADE', 'Cidade', 'Cidades', 95)]
      [TCampoFiltro('CIDADE', True)]
      property Cidade: string read FCidade write FCidade;
      [TCampoTexto('COD_IBGE', 'C�d. IBGE', 'C�d. IBGE', '', 20, False)]
      [TGridCadastro('COD_IBGE', 'C�d. IBGE', 'C�d. IBGE', 15)]
      property CodIbge: string read FCod_Ibge write FCod_Ibge;
      [TChaveEstrangeira('IDUF', 'UF')]
      property IdUf: integer read FIdUf write FIdUf;
      [TCampoEstrangeiro('UF', 'UF', 'U')]
      property SiglaUf: string read FSiglaUf write FSiglaUf;
      constructor Create;
      destructor Destroy;override;
      class function New: IBaseVO<TCidadeVO>;
      function toJson(): string;
      function fromJson(json: string): TCidadeVO;
  end;

implementation

{ TCidadeVO }

constructor TCidadeVO.Create;
begin
  //
end;

destructor TCidadeVO.Destroy;
begin
  //
  inherited;
end;

function TCidadeVO.fromJson(json: string): TCidadeVO;
begin
  Result := TJson.JsonToObject<TCidadeVO>(json);
end;

class function TCidadeVO.New: IBaseVO<TCidadeVO>;
begin
  Result := Self.Create;
end;

function TCidadeVO.toJson: string;
begin
  Result := TJson.ObjectToJsonString(Self);
end;

end.
