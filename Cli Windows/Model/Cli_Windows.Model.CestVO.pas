unit Cli_Windows.Model.CestVO;

interface

uses orm.IBaseVO, orm.Atributos, REST.json;

type
  [TTabela('CEST', 'CE', 'CEST', 'CESTs')]
  TCESTVO = class(TInterfacedObject, IBaseVO<TCESTVO>)
  private
    FId: integer;
    FCest: string;
    FDescricao: string;
  public
    [TChavePrimaria('ID', 'Código', 'Códigos')]
    property Id: integer read FId write FId;
    [TCampoTexto('CEST','Cód. CEST', 'Cód. CESTs', '', 20, False)]
    property Cest: string read FCest write FCest;
    [TCampoTexto('DESCRICAO', 'Descrição', 'Descrições', '', 200, False)]
    property Descricao: string read FDescricao write FDescricao;
    constructor Create;
    destructor Destroy;override;
    class function New: IBaseVO<TCestVO>;
    function toJson(): string;
    function fromJson(json:string): TCESTVO;
  end;

implementation

{ TCESTVO }

constructor TCESTVO.Create;
begin
 //
end;

destructor TCESTVO.Destroy;
begin
  //
  inherited;
end;

function TCESTVO.fromJson(json: string): TCESTVO;
begin
   //Implementar a conversão para objeto.
   Result := TJson.JsonToObject<TCESTVO>(json);
end;

class function TCESTVO.New: IBaseVO<TCestVO>;
begin
  Result := Self.Create;
end;

function TCESTVO.toJson: string;
begin
  //implementar a conversão de objeto para json.
  Result := TJson.ObjectToJsonString(Self);
end;

end.
