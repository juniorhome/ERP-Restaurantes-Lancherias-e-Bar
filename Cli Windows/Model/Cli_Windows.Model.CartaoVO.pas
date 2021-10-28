unit Cli_Windows.Model.CartaoVO;

interface

uses
  orm.IBaseVO, orm.Atributos, REST.json;

type
  [TTabela('CARTAO','C','Cartão','Cartões')]
  TCartaoVO = class(TInterfacedObject, IBaseVO<TCartaoVO>)
    private
      FId: integer;
      FBandeira: string;
      FTaxa: double;
    public
      [TChavePrimaria('ID','Código','Códigos')]
      property Id: integer read FId write FId;
      [TCampoTexto('BANDEIRA','Bandeira','Bandeiras','',80,False)]
      property Bandeira: string read FBandeira write FBandeira;
      [TCampoExtended('TAXA','Taxa','Taxas','000000000000000.000',15,3)]
      property Taxa: double read FTaxa write FTaxa;
      constructor Create;
      destructor Destroy;override;
      class function New: IBaseVO<TCartaoVO>;
      function toJson(): string;
      function fromJson(json:string): TCartaoVO;
  end;
implementation

{ TCartaoVO }

constructor TCartaoVO.Create;
begin
  //
end;

destructor TCartaoVO.Destroy;
begin
  //
  inherited;
end;

function TCartaoVO.fromJson(json: string): TCartaoVO;
begin
   Result := TJson.JsonToObject<TCartaoVO>(json);
end;

class function TCartaoVO.New: IBaseVO<TCartaoVO>;
begin
   Result := Self.Create;
end;

function TCartaoVO.toJson: string;
begin
    Result := TJson.ObjectToJsonString(Self);
end;

end.
