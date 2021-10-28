unit Cli_Windows.Model.CstIcmsVO;

interface

uses
    orm.IBaseVO, orm.Atributos, REST.json;

type
  [TTabela('CST_ICMS', 'CI', 'CST ICMS', 'CSTs ICMS')]
  TCstIcmsVO = class(TInterfacedObject, IBaseVO<TCstIcmsVO>)
     private
        FId: integer;
        FCst: string;
        FDescricao: string;
     public
        [TChavePrimaria('ID', 'Código', 'Códigos')]
        property Id: integer read FId write FId;
        [TCampoTexto('CST', 'CST', 'CSTs', '', 20, False)]
        property Cst: string read FCst write FCst;
        [TCampoTexto('DESCRICAO', 'Descrição', 'Descrições', '', 100, False)]
        property Descricao: string read FDescricao write FDescricao;
        constructor Create;
        destructor Destroy;override;
        class function New: IBaseVO<TCstIcmsVO>;
        function toJson(): string;
        function fromJson(json: string): TCstIcmsVO;
  end;

implementation

{ TCstIcmsVO }

constructor TCstIcmsVO.Create;
begin
  //
end;

destructor TCstIcmsVO.Destroy;
begin
  //
  inherited;
end;

function TCstIcmsVO.fromJson(json: string): TCstIcmsVO;
begin
  Result := TJson.JsonToObject<TCstIcmsVO>(json);
end;

class function TCstIcmsVO.New: IBaseVO<TCstIcmsVO>;
begin
  Result := Self.Create;
end;

function TCstIcmsVO.toJson: string;
begin
   Result := TJson.ObjectToJsonString(Self);
end;

end.
