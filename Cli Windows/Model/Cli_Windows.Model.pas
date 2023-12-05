unit Cli_Windows.Model;

interface

uses
  Cli_Windows.Model.Interfaces, Cli_Windows.model.Grupo.Interfaces,
  Cli_Windows.model.Grupo;

type
  TModel = class(TInterfacedObject, iModel)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iModel;
      function Grupo: iModelGrupo;
  end;

implementation

{ TModel }

constructor TModel.Create;
begin
  //construtor vazio!!!!!!!!!
end;

destructor TModel.Destroy;
begin

  inherited;
end;

function TModel.Grupo: iModelGrupo;
begin
   Result := TModelGrupo.New;
end;

class function TModel.New: iModel;
begin
   Result := Self.Create;
end;

end.
