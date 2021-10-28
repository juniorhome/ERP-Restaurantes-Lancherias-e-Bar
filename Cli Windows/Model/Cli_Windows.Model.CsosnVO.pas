unit Cli_Windows.Model.CsosnVO;

interface

uses
   orm.IBaseVO, orm.Atributos, REST.json;

type
  [TTabela('CSOSN', 'CS','CSOSN','CSOSNs')]
  TCsosnVO = class(TInterfacedObject, IBaseVO<TCsosnVO>)
    private
      FId: integer;
      FCsosn: string;
      FDescricao: string;
    public
      [TChavePrimaria('ID', 'Código', 'Códigos')]
      property Id: integer read FId write FId;
      [TCampoTexto('CSOSN', 'Cód. CSOSN', 'Cód. CSOSNs', '', 20, False)]
      property Csosn: string read FCsosn write FCsosn;
      [TCampoTexto('DESCRICAO', 'Descrição', 'Descrições', '', 100, False)]
      property Descricao: string read FDescricao write FDescricao;
      constructor Create;
      destructor Destroy;override;
      class function New: IBaseVO<TCsosnVO>;
      function toJson(): string;
      function fromJson(json: string): TCsosnVO;
  end;

implementation

{ TCsosnVO }

constructor TCsosnVO.Create;
begin
  //
end;

destructor TCsosnVO.Destroy;
begin
  //
  inherited;
end;

function TCsosnVO.fromJson(json: string): TCsosnVO;
begin
   Result := TJson.JsonToObject<TCsosnVO>(json);
end;

class function TCsosnVO.New: IBaseVO<TCsosnVO>;
begin
  Result := Self.Create;
end;

function TCsosnVO.toJson: string;
begin
  Result := TJson.ObjectToJsonString(Self);
end;

end.
