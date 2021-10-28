unit Cli_Windows.Model.ReservaVO;

interface

uses orm.IBaseVO, orm.Atributos, REST.json;

type
  TReservaVO = class(TInterfacedObject, IBaseVO<TReservaVO>)
    private
      FId: integer;
      FData: TDate;
      FHorario: TDateTime;
      FCliente: string;
      FTelefone: string;
      FStatus: string;
      FIdMesa: integer;
      FTamanhoMesa: string;
    public
      property Id: integer read FId write FId;
      property Data: TDate read FData write FData;
      property Horario: TDateTime read FHorario write FHorario;
      property Cliente: string read FCliente write FCliente;
      property Telefone: string read FTelefone write FTelefone;
      property Status: string read FStatus write FStatus;
      property IdMesa: integer read FIdMesa write FIdMesa;
      property TamanhoMesa: string read FTamanhoMesa write FTamanhoMesa;
      constructor Create;
      destructor Destroy;override;
      class function New: IBaseVO<TReservaVO>;
      function toJson(): string;
      function fromJson(json: string): TReservaVO;
  end;

implementation

{ ReservaVO }

constructor TReservaVO.Create;
begin
  //
end;

destructor TReservaVO.Destroy;
begin
  //
  inherited;
end;

function TReservaVO.fromJson(json: string): TReservaVO;
begin
  Result := TJson.JsonToObject<TReservaVO>(json);
end;

class function TReservaVO.New: IBaseVO<TReservaVO>;
begin
   Result := Self.Create;
end;

function TReservaVO.toJson: string;
begin
   Result := TJson.ObjectToJsonString(Self);
end;

end.
