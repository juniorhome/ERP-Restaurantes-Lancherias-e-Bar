unit Cli_Windows.Model.UfVO;

interface

uses
   orm.IBaseVO, orm.Atributos, REST.Json;

type
  [TTabela('UF','U','Estado','Estados')]
  TUFVO = class(TInterfacedObject, IBaseVO<TUFVO>)
    private
      FId: integer;
      FUf: string;
    public
      [TChavePrimaria('ID','Código','Códigos')]
      property Id: integer read FId write FId;
      [TCampoTexto('UF','Estado','Estados','',2,False)]
      property Uf: string read FUf write FUf;
      constructor Create;
      destructor Destroy;override;
      class function New: IBaseVO<TUFVO>;
      function toJson(): string;
      function fromJson(json: string): TUFVO;
  end;

implementation

{ TUFVO }

constructor TUFVO.Create;
begin
  //
end;

destructor TUFVO.Destroy;
begin
  //
  inherited;
end;

function TUFVO.fromJson(json: string): TUFVO;
begin
  Result := TJson.JsonToObject<TUFVO>(json);
end;

class function TUFVO.New: IBaseVO<TUFVO>;
begin
   Result := Self.Create;
end;

function TUFVO.toJson: string;
begin
  Result := TJson.ObjectToJsonString(Self);
end;

end.
