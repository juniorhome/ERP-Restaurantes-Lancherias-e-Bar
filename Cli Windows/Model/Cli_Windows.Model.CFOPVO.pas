unit Cli_Windows.Model.CFOPVO;

interface

uses
    orm.IBaseVO, orm.Atributos, REST.json;

 type
   [TTabela('CFOP','CF','CFOP','CFOPs')]
   TCFOPVO = class(TInterfacedObject, IBaseVO<TCFOPVO>)
     private
       FId: integer;
       FCfop: string;
       FDescricao: string;
     public
       [TChavePrimaria('ID','Código','Códigos')]
       property Id: integer read FId write FId;
       [TCampoTexto('CFOP','Cód. CFOP','Cód. CFOPs', '', 20, False)]
       property Cfop: string read FCfop write FCfop;
       [TCampoTexto('DESCRICAO','Descrição','Descrições','',200,False)]
       property Descricao: string read FDescricao write FDescricao;
       constructor Create;
       destructor Destroy;override;
       class function New: IBaseVO<TCfopVO>;
       function toJson(): string;
       function fromJson(json: string): TCFOPVO;
   end;

implementation

{ TCFOPVO }

constructor TCFOPVO.Create;
begin
  //
end;

destructor TCFOPVO.Destroy;
begin
  //
  inherited;
end;

function TCFOPVO.fromJson(json: string): TCFOPVO;
begin
  Result := TJson.JsonToObject<TCFOPVO>(json);
end;

class function TCFOPVO.New: IBaseVO<TCfopVO>;
begin
  Result := Self.Create;
end;

function TCFOPVO.toJson: string;
begin
   Result := TJson.ObjectToJsonString(Self);
end;

end.
