unit Cli_Windows.Model.FormaPgtoVO;

interface

uses
    orm.IBaseVO, orm.Atributos, REST.json;

type
  [TTabela('FORMA_PGTO', 'FP', 'Forma de Pagamento', 'Formas de Pagamentos')]
  TFormaPgtoVO = class(TInterfacedObject, IBaseVO<TFormaPgtoVO>)
    private
      FId: integer;
      FDescricao: string;
    public
      [TChavePrimaria('ID', 'Código', 'Códigos')]
      property Id: integer read FId write FId;
      [TCampoTexto('DESCRICAO', 'Descrição', 'Descrições', '', 80, False)]
      property Descricao: string read FDescricao write FDescricao;
      constructor Create;
      destructor Destroy;override;
      class function New: IBaseVO<TFormaPgtoVO>;
      function toJson(): string;
      function fromJson(json: string): TFormaPgtoVO;
  end;

implementation

{ TFormaPgtoVO }

constructor TFormaPgtoVO.Create;
begin
  //
end;

destructor TFormaPgtoVO.Destroy;
begin
  //
  inherited;
end;

function TFormaPgtoVO.fromJson(json: string): TFormaPgtoVO;
begin
  Result := TJson.JsonToObject<TFormaPgtoVO>(json);
end;

class function TFormaPgtoVO.New: IBaseVO<TFormaPgtoVO>;
begin
   Result := Self.Create;
end;

function TFormaPgtoVO.toJson: string;
begin
  Result := TJson.ObjectToJsonString(Self);
end;

end.
