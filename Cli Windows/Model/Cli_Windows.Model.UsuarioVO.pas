unit Cli_Windows.Model.UsuarioVO;

interface

uses
    orm.IBaseVO, orm.Atributos, REST.json;

type
  [TTabela('USUARIO', 'U', 'Usu�rio', 'Usu�rios')]
  TUsuarioVO = class(TInterfacedObject, IBaseVO<TUsuarioVO>)
    private
       FId: integer;
       FNome: string;
       FLogin: string;
       FSenha: string;
       FFoto: string;
       FAtivo: string;
    public
      [TChavePrimaria('ID', 'C�digo', 'C�digos')]
       property Id: integer read FId write FId;
       [TCampoTexto('NOME', 'Nome', 'Nomes', '', 100, False)]
       property Nome: string read FNome write FNome;
       [TCampoTexto('LOGIN', 'Login', 'Logins', '', 150, False)]
       property Login: string read FLogin write FLogin;
       [TCampoTexto('SENHA', 'Senha', 'Senhas', '', 10, False)]
       property Senha: string read FSenha write FSenha;
       [TCamppoTexto('FOTO', 'Foto', 'Fotos', '', 255, False)]
       property Foto: string read FFoto write FFoto;
       [TCampoTexto('ATIVO', 'Ativo', 'Ativos', '', 1, False)]
       property Ativo: string read FAtivo write FAtivo;
       constructor Create;
       destructor Destroy;override;
       class function New: IBaseVO<TUsuarioVO>;
       function toJson(): string;
       function fromJson(json: string): TUsuarioVO;
  end;

implementation

{ TUsuarioVO }

constructor TUsuarioVO.Create;
begin
  //
end;

destructor TUsuarioVO.Destroy;
begin
  //
  inherited;
end;

function TUsuarioVO.fromJson(json: string): TUsuarioVO;
begin
  Result := TJson.JsonToObject<TUsuarioVO>(json);
end;

class function TUsuarioVO.New: IBaseVO<TUsuarioVO>;
begin
   Result := Self.Create;
end;

function TUsuarioVO.toJson: string;
begin
  Result := TJson.ObjectToJsonString(Self);
end;

end.
