unit Cli_Windows.Model.CstIcmsSTVO;

interface

uses
    orm.IBaseVO, orm.Atributos, REST.json;

type
  [TTabela('CST_ICMS_ST', 'CIS', 'CST ICMS ST', 'CSTs ICMS ST')]
  TCstIcmsSTVO = class(TInterfacedObject, IBaseVO<TCstIcmsSTVO>)
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
       function toJson(): string;
       function fromJson(json: string): TCstIcmsSTVO;
  end;

implementation

{ TCstIcmsSTVO }

function TCstIcmsSTVO.fromJson(json: string): TCstIcmsSTVO;
begin
   Result := TJson.JsonToObject<TCstIcmsSTVO>(json);
end;

function TCstIcmsSTVO.toJson: string;
begin
   Result := TJson.ObjectToJsonString(Self);
end;

end.
