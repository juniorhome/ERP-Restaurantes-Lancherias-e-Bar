unit Cli_Windows.Model.NcmVO;

interface

uses
    orm.IBaseVO, orm.Atributos, REST.json;

type
  [TTabela('NCM', 'N', 'NCM', 'NCM')]
  TNcmVO = class(TInterfacedObject, IBaseVO<TNcmVO>)
    private
      FId: integer;
      FNcm: string;
      FDescricao: string;
    public
      [TChavePrimaria('ID', 'Código', 'Códigos')]
      property Id: integer read FId write FId;
      [TCampoTexto('NCM', 'Cód. NCM', 'Cód. NCM', '', 20, False)]
      property Ncm: string read FNcm write FNcm;
      [TCampoTexto('DESCRICAO', 'Descrição', 'Descrições', '', 200, False)]
      property Descricao: string read FDescricao write FDescricao;
      constructor Create;
      destructor Destroy;override;
      class function New: IBaseVO<TNcmVO>;
      function toJson(): string;
      function fromJson(json: string): TNcmVO;
  end;

implementation

{ TNcmVO }

constructor TNcmVO.Create;
begin
  //
end;

destructor TNcmVO.Destroy;
begin
  //
  inherited;
end;

function TNcmVO.fromJson(json: string): TNcmVO;
begin
   Result := TJson.JsonToObject<TNcmVO>(json);
end;

class function TNcmVO.New: IBaseVO<TNcmVO>;
begin
   Result := Self.Create;
end;

function TNcmVO.toJson: string;
begin
  Result := TJson.ObjectToJsonString(Self);
end;

end.
