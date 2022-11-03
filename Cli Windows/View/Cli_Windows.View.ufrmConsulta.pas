unit Cli_Windows.View.ufrmConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Datasnap.DBClient, System.Rtti,orm.Atributos, orm.lib.Biblioteca;

type
  TfrmConsulta = class(TForm)
    dbgConsulta: TDBGrid;
    dsConsulta: TDataSource;
    cdsConsulta: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MontarGrid(obj: TObject);
    procedure CarregarObjeto(obj: TObject);
  end;

var
  frmConsulta: TfrmConsulta;

implementation

{$R *.dfm}

{ TfrmConsulta }

procedure TfrmConsulta.CarregarObjeto(obj: TObject);
var
   contexto: TRttiContext;
   tipo: TRttiType;
   propriedade: TRttiProperty;
   atributo: TCustomAttribute;
begin
   contexto := TRttiContext.Create;
   try
     tipo := contexto.GetType(obj.ClassInfo);
     for propriedade in tipo.GetProperties do
       for atributo in propriedade.GetAttributes do
       begin
         if atributo is TChavePrimaria then
           propriedade.SetValue(obj, cdsConsulta.FieldByName(TChavePrimaria(atributo).Nome).AsInteger);
         if atributo is TCampoTexto then
           propriedade.SetValue(obj, cdsConsulta.FieldByName(TCampoTexto(atributo).Nome).AsString);
         if atributo is TCampoInteiro then
           propriedade.SetValue(obj, cdsConsulta.FieldByName(TCampoInteiro(atributo).Nome).AsInteger);
         if atributo is TCampoData then
           propriedade.SetValue(obj, cdsConsulta.FieldByName(TCampoData(atributo).Nome).AsDateTime);
         if atributo is TCampoDataHora then
           propriedade.SetValue(obj, cdsConsulta.FieldByName(TCampoDataHora(atributo).Nome).AsDateTime);
         if atributo is TCampoExtended then
           propriedade.SetValue(obj, cdsConsulta.FieldByName(TCampoExtended(atributo).Nome).AsExtended);
         if atributo is TCampoMonetario then
           propriedade.SetValue(obj, cdsConsulta.FieldByName(TCampoMonetario(atributo).Nome).AsCurrency);
         if atributo is TCampoBooleano then
           propriedade.SetValue(obj, cdsConsulta.FieldByName(TCampoBooleano(atributo).Nome).AsBoolean);
         if atributo is TChaveEstrangeira then
            propriedade.SetValue(obj, cdsConsulta.FieldByName(TChaveEstrangeira(atributo).Nome).AsInteger);
       end;
   finally
     contexto.Free;
   end;
end;

procedure TfrmConsulta.MontarGrid(obj: TObject);
var
    contexto: TRttiContext;
    tipo: TRttiType;
    propriedade: TRttiProperty;
    atributo: TCustomAttribute;
    contador: integer;
begin
   contador := 0;
   contexto := TRttiContext.Create;
   try
     tipo := contexto.GetType(obj.ClassInfo);
     for propriedade in tipo.GetProperties do
       for atributo in propriedade.GetAttributes do
       begin
         if atributo is TGridConsulta then
         begin
           dbgConsulta.Columns.Insert(contador);
           dbgConsulta.Columns[contador].FieldName := TGridConsulta(atributo).Nome;
           dbgConsulta.Columns[contador].Title.Caption := TGridConsulta(atributo).CaptionSingular;
           dbgConsulta.Columns[contador].Title.Alignment := taCenter;
           dbgConsulta.Columns[contador].Title.Font.Style := [fsBold];
           dbgConsulta.Columns[contador].Width := TGridConsulta(atributo).Tamanho;
         end;
         inc(contador);
       end;
   finally
     contexto.Free;
   end;
end;

end.