unit Cli_Windows.Model.CstPisVO;

interface

uses
     orm.IBaseVO, orm.Atributos, REST.json;

type
  [TTabela('CST_PIS', 'CPIS', 'CST PIS', 'CSTs PIS')]
  TCstPisVO = class(TInterfacedObject, IBaseVO<TCstPisVO>)
    private
      FId: integer;
      FCst: string;
      FDescricao: string;
    public
      [TChavePrimaria('ID', 'C�digo', 'C�digos')]
      property Id: integer read FId write FId;
      [TCampoTexto('CST', 'C�d. CST', 'C�d. CST', '', 20, False)]
      property Cst: string read FCst write FCst;
      [TCampoTexto('DESCRICAO', 'Descri��o', 'Descri��es', '', 100, False)]
      property Descricao: string read FDescricao write FDescricao;
      constructor Create;
      destructor Destroy;override;
      class function New: IBaseVO<TCstPisVO>;
      function toJson(): string;
      function fromJson(json: string): TCstPisVO;
  end;

implementation

{ TCstPisVO }

constructor TCstPisVO.Create;
begin
  //
end;

destructor TCstPisVO.Destroy;
begin
  //
  inherited;
end;

function TCstPisVO.fromJson(json: string): TCstPisVO;
begin
  Result := TJson.JsonToObject<TCstPisVO>(json);
end;

class function TCstPisVO.New: IBaseVO<TCstPisVO>;
begin
  Result := Self.Create;
end;

function TCstPisVO.toJson: string;
begin
   Result := TJson.ObjectToJsonString(Self);
end;

end.
