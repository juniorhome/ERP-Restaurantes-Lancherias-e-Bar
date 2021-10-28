unit Cli_Windows.Model.CrtVO;

interface

uses
    orm.IBaseVO, orm.Atributos, REST.json;
Type
  [TTabela('CRT', 'CR', 'CRT', 'CRTs')]
  TCrtVO = class(TInterfacedObject, IBaseVO<TCrtVO>)
    private
      FId: integer;
      FCrt: string;
      FDescricao: string;
    public
      [TChavePrimaria('ID', 'Código', 'Códigos')]
      property Id: integer read FId write FId;
      [TCampoTexto('CRT', 'Cód. CRT', 'Cód. CRTs', '', 80, False)]
      property Crt: string read FCrt write FCrt;
      [TCampoTexto('DESCRICAO', 'Descrição', 'Descrições', '', 80, False)]
      property Descricao: string read FDescricao write FDescricao;
      constructor Create;
      destructor Destroy;override;
      class function New: IBaseVO<TCrtVO>;
      function toJson(): string;
      function fromJson(json: string): TCrtVO;
  end;

implementation

{ TCrtVO }

constructor TCrtVO.Create;
begin
   //
end;

destructor TCrtVO.Destroy;
begin
  //
  inherited;
end;

function TCrtVO.fromJson(json: string): TCrtVO;
begin
  Result := TJson.JsonToObject<TCrtVO>(json);
end;

class function TCrtVO.New: IBaseVO<TCrtVO>;
begin
   Result := Self.Create;
end;

function TCrtVO.toJson: string;
begin
   Result := TJson.ObjectToJsonString(Self);
end;

end.
