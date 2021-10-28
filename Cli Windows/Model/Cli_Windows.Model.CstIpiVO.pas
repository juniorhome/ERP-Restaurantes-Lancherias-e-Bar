unit Cli_Windows.Model.CstIpiVO;

interface

uses
    orm.IBaseVO, orm.Atributos, REST.json;

type
  [TTabela('CST_IPI', 'CIP', 'CST IPI', 'CSTs IPI')]
  TCstIpiVO = class(TInterfacedObject, IBaseVO<TCstIpiVO>)
    private
       FId: integer;
       FCst: string;
       FDescricao: string;
    public
       [TChavePrimaria('ID', 'Código', 'Códigos')]
       property Id: integer read FId write FId;
       [TCampoTexto('CST', 'CST IPI', 'CSTs IPI', '', 20, False)]
       property Cst: string read FCst write FCst;
       [TCampoTexto('DESCRICAO', 'Descrição', 'Descrições', '', 100, False)]
       property Descricao: string read FDescricao write FDescricao;
       constructor Create;
       destructor Destroy;override;
       class function New: IBaseVO<TCstIpiVO>;
       function toJson(): string;
       function fromJson(json: string): TCstIpiVO;
  end;

implementation

{ TCstIpiVO }

constructor TCstIpiVO.Create;
begin
  //
end;

destructor TCstIpiVO.Destroy;
begin
  //
  inherited;
end;

function TCstIpiVO.fromJson(json: string): TCstIpiVO;
begin
   Result := TJson.JsonToObject<TCstIpiVO>(json);
end;

class function TCstIpiVO.New: IBaseVO<TCstIpiVO>;
begin
  Result := Self.Create;
end;

function TCstIpiVO.toJson: string;
begin
   Result := TJson.ObjectToJsonString(Self);
end;

end.
