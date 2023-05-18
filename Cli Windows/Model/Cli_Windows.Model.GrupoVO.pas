unit Cli_Windows.Model.GrupoVO;

interface

uses orm.Atributos, orm.IBaseVO, REST.Json;

type
  [TTabela('GRUPO', 'G', 'Grupo', 'Grupos')]
  TGrupoVO = class(TInterfacedObject, IBaseVO<TGrupoVO>)
   private
     FId: integer;
     FDescricao: string;
   public
     [TChavePrimaria('ID', 'C�digo', 'C�digos')]
     [TGridCadastro('ID',  'C�digo', 'C�digos', 8)]
     [TGridConsulta('ID', 'C�digo', 'C�digos', 8)]
     [TCampoFiltro('ID', True) ]
     property ID: integer read FId write FId;
     [TCampoTexto('DESCRICAO', 'Descri��o', 'Descri��es', '', 80 , False)]
     [TGridCadastro('DESCRICAO', 'Descri��o', 'Descri��es', 92)]
     [TGridConsulta('DESCRICAO', 'Descri��o', 'Descri��es', 92)]
     [TCampoFiltro('DESCRICAO', True)]
     property Descricao: string read FDescricao write FDescricao;
     function toJson(): string;
     function fromJson(json: string): TGrupoVO;
  end;

implementation

{ TGrupoVO }

function TGrupoVO.fromJson(json: string): TGrupoVO;
begin
  Result := TJson.JsonToObject<TGrupoVO>(json);
end;

function TGrupoVO.toJson: string;
begin
   Result := TJson.ObjectToJsonString(Self);
end;

end.