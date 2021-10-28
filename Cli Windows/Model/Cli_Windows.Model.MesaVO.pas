unit Cli_Windows.Model.MesaVO;

interface

uses
    orm.IBaseVO, orm.Atributos, REST.json;

type
  [TTabela('MESA', 'M', 'Mesa', 'Mesas')]
  TMesaVO = class(TInterfacedObject, IBaseVO<TMesaVO>)
    private
      FId: integer;
      FNum_Cadeiras: integer;
      FTamanho: string;
      FStatus: string;
    public
      [TChavePrimaria('ID', 'Código', 'Códigos')]
      [TGridCadastro('ID', 'Código', 'Códigos', 5)]
      [TGridConsulta('ID', 'Código', 'Códigos', 5)]
      [TCampoFiltro('ID', True)]
      property Id: integer read FId write FId;
      [TCampoInteiro('NUM_CADEIRAS', 'Número de Cadeira', 'Número de Cadeiras')]
      [TGridCadastro('NUM_CADEIRAS', 'Número de Cadeira', 'Números de Cadeiras', 5)]
      [TGridConsulta('NUM_CADEIRAS', 'Número de Cadeira', 'Números de Cadeiras', 5)]
      property NumCadeiras: integer read FNum_Cadeiras write FNum_Cadeiras;
      [TCampoTexto('TAMANHO', 'Tamanho', 'Tamanhos', '', 80, False)]
      [TGridCadastro('TAMANHO', 'Tamanho', 'Tamanhos', 90)]
      [TGridConsulta('TAMANHO', 'Tamanho', 'Tamanhos', 90)]
      property Tamanho: string read FTamanho write FTamanho;
      [TCampoTexto('STATUS', 'Status', 'Status', '', 1, False)]
      property Status: string read FStatus write FStatus;
      constructor Create;
      destructor Destroy;override;
      class function New: IBaseVO<TMesaVO>;
      function toJson(): string;
      function fromJson(json: string): TMesaVO;
  end;

implementation

{ TMesaVO }

constructor TMesaVO.Create;
begin
  //
end;

destructor TMesaVO.Destroy;
begin
  //
  inherited;
end;

function TMesaVO.fromJson(json: string): TMesaVO;
begin
  Result := TJson.JsonToObject<TMesaVO>(json);
end;

class function TMesaVO.New: IBaseVO<TMesaVO>;
begin
   Result := Self.Create;
end;

function TMesaVO.toJson: string;
begin
  Result := TJson.ObjectToJsonString(Self);
end;

end.
