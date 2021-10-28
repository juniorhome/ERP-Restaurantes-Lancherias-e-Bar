unit Cli_Windows.View.ufrmCadBasico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Rtti,
  orm.Atributos, orm.IBaseVO;

type
  TfrmCadBasico = class(TForm)
    pnlFundo: TPanel;
    pnlListagem: TPanel;
    pnlCadastro: TPanel;
    pnlPesquisa: TPanel;
    edtPesquisar: TEdit;
    btnPesquisar: TSpeedButton;
    Label1: TLabel;
    cmbFiltros: TComboBox;
    Label2: TLabel;
    pnlGrid: TPanel;
    dbgGeral: TDBGrid;
    dsGeral: TDataSource;
    cdsGeral: TClientDataSet;
    pnlBotoes: TPanel;
    pnlBotaoSalvar: TPanel;
    pnlBotaoCancelar: TPanel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    pnlCampos: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ArredondarCantos(componente: TWinControl; y: string);
    procedure CarregarCombo(AObj: TObject);
    procedure MontarGrid(AObj: TObject);
  end;

var
  frmCadBasico: TfrmCadBasico;

implementation

{$R *.dfm}

{ TfrmCadBasico }

procedure TfrmCadBasico.ArredondarCantos(componente: TWinControl; y: string);
var
  bx: TRect;
  mdo: HRGN;
begin
  with componente do
  begin
    bx := ClientRect;
    mdo := CreateRoundRectRgn(bx.Left, bx.Top, bx.Right, bx.Bottom, StrToInt(y), StrToInt(y));
    Perform(EM_GETRECT, 0, lParam(@bx));
    InflateRect(bx, -4, -4);
    Perform(EM_SETRECTNP, 0, lParam(@bx));
    SetWindowRgn(Handle, mdo, True);
    Invalidate;
  end;
end;

procedure TfrmCadBasico.CarregarCombo(AObj: TObject);
var contexto: TRttiContext;
propriedade: TRttiProperty;
tipo: TRttiType;
atributo: TCustomAttribute;
begin
   contexto := TRttiContext.Create(nil);
   try
     tipo := contexto.GetType(AObj.ClassInfo);

     for propriedade in tipo.GetProperties do
       for atributo in propriedade.GetAttributes do
       begin
         if atributo is TCampoFiltro then
           cmbFiltros.Items.Add(TCampoFiltro(atributo).Nome);
       end;

   finally
     contexto.Free;
   end;
end;

procedure TfrmCadBasico.FormCreate(Sender: TObject);
begin
   ArredondarCantos(pnlPesquisa, '100');
   ArredondarCantos(edtPesquisar, '100');
   ArredondarCantos(pnlListagem, '100');
end;

procedure TfrmCadBasico.MontarGrid(AObj: TObject);
var
  contexto: TRttiContext;
  tipo: TRttiType;
  propriedade: TRttiProperty;
  atributo: TCustomAttribute;
  contador: integer;
begin
   contador := 0;
   contexto := TRttiContext.Create(nil);
   try
     tipo := contexto.GetType(AObj.ClassInfo);
     for propriedade in tipo.GetProperties do
       for atributo in propriedade.GetAttributes do
       begin
         if atributo is TGridCadastro then
         begin
           dbgGeral.Columns.Insert(contador);
           dbgGeral.Columns[contador].FieldName := TGridCadastro(atributo).Nome;
           dbgGeral.Columns[contador].Title.Caption := TGridCadastro(atributo).CaptionSingular;
           dbgGeral.Columns[contador].Title.Alignment := taCenter;
           dbgGeral.Columns[contador].Font.Style := [fsBold];
           dbgGeral.Columns[contador].Width := TGridCadastro(atributo).Tamanho;
           inc(contador);
         end;
       end;
   finally
     contexto.Free;
   end;
end;

end.
