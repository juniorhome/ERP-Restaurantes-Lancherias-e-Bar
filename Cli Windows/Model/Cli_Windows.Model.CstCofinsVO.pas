unit Cli_Windows.Model.CstCofinsVO;

interface

uses
   orm.IBaseVO, orm.Atributos, REST.json;

type
  [TTabela('CST_COFINS', 'CO', 'CST Cofins', 'CSTs Cofins')]
  TCstCofinsVO = class(TInterfacedObject, IBaseVO<TCstCofinsVO>)
  private
    FId: integer;
    FCst: string;
    FDescricao: string;
  public
    [TChavePrimaria('ID', 'C�digo', 'C�digos')]
    property Id: integer read FId write FId;
    [TCampoTexto('CST', 'CST', 'CSTs', '', 20, False)]
    property Cst: string read FCst write FCst;
    [TCampoTexto('DESCRICAO', 'Descri��o', 'Descri��es', '', 100, False)]
    property Descricao: string read FDescricao write FDescricao;
    constructor Create;
    destructor Destroy;override;
    class function New: IBaseVO<TCstCofinsVO>;
    function toJson(): string;
    function fromJson(json: string): TCstCofinsVO;
  end;

implementation

{ TCstCofinsVO }

constructor TCstCofinsVO.Create;
begin
  //
end;

destructor TCstCofinsVO.Destroy;
begin
  //
  inherited;
end;

function TCstCofinsVO.fromJson(json: string): TCstCofinsVO;
begin
  Result := TJson.JsonToObject<TCstCofinsVO>(json);
end;

class function TCstCofinsVO.New: IBaseVO<TCstCofinsVO>;
begin
   Result := Self.Create;
end;

function TCstCofinsVO.toJson: string;
begin
  Result := TJson.ObjectToJsonString(Self);
end;

end.
