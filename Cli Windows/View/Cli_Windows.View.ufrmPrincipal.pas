unit Cli_Windows.View.ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.WinXCtrls, Vcl.CategoryButtons, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.Buttons, Vcl.StdCtrls,
  Cli_Windows.Model.PerfilUsuarioVO, Fabica_Objetos.IFactoryMethod,
  Fabrica_Objetos.FabricaObjeto, Cli_Windows.Controller.PerfilUsuarioController,
  orm.IBaseVO, Cli_Windows.Model.ConfiguracaoVO;

type
  TfrmPrincipal = class(TForm)
    pnlTitulo: TPanel;
    pnlFundo: TPanel;
    imgMenu: TImage;
    Image1: TImage;
    pnlMenu: TPanel;
    btnGeral: TSpeedButton;
    ImageList1: TImageList;
    btnDfe: TSpeedButton;
    btnEstoque: TSpeedButton;
    btnTributacao: TSpeedButton;
    btnFinanceiro: TSpeedButton;
    btnPedido: TSpeedButton;
    btnVenda: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    lblUsuario: TLabel;
    Label3: TLabel;
    lblDataHorario: TLabel;
    Label4: TLabel;
    lblCidade: TLabel;
    lblTemperatura: TLabel;
    imgFigura: TImage;
    btnSair: TSpeedButton;
    pnlGeral: TPanel;
    btnBanco: TSpeedButton;
    btnCartao: TSpeedButton;
    btnCidade: TSpeedButton;
    btnFormaPgto: TSpeedButton;
    btnMesa: TSpeedButton;
    btnPessoa: TSpeedButton;
    btnPlanoConta: TSpeedButton;
    pnlDfe: TPanel;
    btnNfe: TSpeedButton;
    btnNfce: TSpeedButton;
    btnNfse: TSpeedButton;
    pnlNfe: TPanel;
    btnCancelarNfe: TSpeedButton;
    btnEmitirNfe: TSpeedButton;
    btnInutilizar: TSpeedButton;
    pnlNfce: TPanel;
    btnCancelarNfce: TSpeedButton;
    btnEmitirNfce: TSpeedButton;
    btnInutilizarNfce: TSpeedButton;
    pnlNfse: TPanel;
    btnEmitirNfse: TSpeedButton;
    lblPerfil: TLabel;
    pnlEstoque: TPanel;
    btnCotacao: TSpeedButton;
    btnCompra: TSpeedButton;
    btnFornecedor: TSpeedButton;
    btnProduto: TSpeedButton;
    pnlFinanceiro: TPanel;
    btnCaixa: TSpeedButton;
    btnContaPagar: TSpeedButton;
    btnContaReceber: TSpeedButton;
    pnlTributacao: TPanel;
    btnCest: TSpeedButton;
    btnNcm: TSpeedButton;
    btnCalcularImposto: TSpeedButton;
    pnlSelecionado: TPanel;
    pnlPedido: TPanel;
    btnFazerPedido: TSpeedButton;
    btnRelat�rios: TSpeedButton;
    Timer1: TTimer;
    Button1: TButton;
    procedure imgMenuClick(Sender: TObject);
    procedure btnGeralMouseEnter(Sender: TObject);
    procedure btnDfeMouseEnter(Sender: TObject);
    procedure btnGeralMouseLeave(Sender: TObject);
    procedure btnDfeMouseLeave(Sender: TObject);
    procedure btnEstoqueMouseEnter(Sender: TObject);
    procedure btnFinanceiroMouseEnter(Sender: TObject);
    procedure btnEstoqueMouseLeave(Sender: TObject);
    procedure btnFinanceiroMouseLeave(Sender: TObject);
    procedure btnTributacaoMouseEnter(Sender: TObject);
    procedure btnTributacaoMouseLeave(Sender: TObject);
    procedure btnPedidoMouseEnter(Sender: TObject);
    procedure btnPedidoMouseLeave(Sender: TObject);
    procedure btnVendaMouseEnter(Sender: TObject);
    procedure btnVendaMouseLeave(Sender: TObject);
    procedure btnSairMouseEnter(Sender: TObject);
    procedure btnSairMouseLeave(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnBancoMouseEnter(Sender: TObject);
    procedure btnBancoMouseLeave(Sender: TObject);
    procedure btnGeralClick(Sender: TObject);
    procedure btnCartaoMouseEnter(Sender: TObject);
    procedure btnCidadeMouseEnter(Sender: TObject);
    procedure btnCartaoMouseLeave(Sender: TObject);
    procedure btnCidadeMouseLeave(Sender: TObject);
    procedure btnFormaPgtoMouseEnter(Sender: TObject);
    procedure btnFormaPgtoMouseLeave(Sender: TObject);
    procedure btnMesaMouseEnter(Sender: TObject);
    procedure btnMesaMouseLeave(Sender: TObject);
    procedure btnPessoaMouseEnter(Sender: TObject);
    procedure btnPessoaMouseLeave(Sender: TObject);
    procedure btnPlanoContaMouseEnter(Sender: TObject);
    procedure btnDfeClick(Sender: TObject);
    procedure btnNfceClick(Sender: TObject);
    procedure btnNfeClick(Sender: TObject);
    procedure btnNfseClick(Sender: TObject);
    procedure btnEstoqueClick(Sender: TObject);
    procedure btnFinanceiroClick(Sender: TObject);
    procedure btnTributacaoClick(Sender: TObject);
    procedure btnPedidoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pnlMenuMouseEnter(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FPerfil: TPerfilUsuarioVO;
    //FFabrica: IFactoryMethod<TPerfilUsuarioVO>;
    //FController: TPerfilUsuarioController<TPerfilUsuarioVO>;
  public
    { Public declarations }
    procedure IconBmp(Btn: TSpeedButton; ind: integer);
    procedure Focar(painel: TPanel; btn: TSpeedButton; focado: boolean);
    procedure MostrarEsconderPanel(painel: TPanel; btn: TSpeedButton; mostrar: boolean);
    procedure FocarSubMenu(painel: TPanel; btn: TSpeedButton; focar: boolean);
    procedure HabilitarBotaoMenu;
    procedure CarregarConfiguracao;
  end;

var
  frmPrincipal: TfrmPrincipal;
  bExpandido: boolean;

implementation

{$R *.dfm}

uses Cli_Windows.View.ufrmCadGrupo;

{ TfrmPrincipal }

procedure TfrmPrincipal.btnBancoMouseEnter(Sender: TObject);
begin
   FocarSubMenu(pnlGeral, (TComponent(Sender) as TSpeedButton), True);
end;

procedure TfrmPrincipal.btnBancoMouseLeave(Sender: TObject);
begin
  FocarSubMenu(pnlGeral, (TComponent(Sender) as TSpeedButton), False);
end;

procedure TfrmPrincipal.btnCartaoMouseEnter(Sender: TObject);
begin
   FocarSubMenu(pnlGeral, (TComponent(Sender) as TSpeedButton), True);
end;

procedure TfrmPrincipal.btnCartaoMouseLeave(Sender: TObject);
begin
  FocarSubMenu(pnlGeral, (TComponent(Sender) as TSpeedButton), False);
end;

procedure TfrmPrincipal.btnCidadeMouseEnter(Sender: TObject);
begin
  FocarSubMenu(pnlGeral, (TComponent(Sender) as TSpeedButton), True);
end;

procedure TfrmPrincipal.btnCidadeMouseLeave(Sender: TObject);
begin
  FocarSubMenu(pnlGeral, (TComponent(Sender) as TSpeedButton), False);
end;

procedure TfrmPrincipal.btnDfeClick(Sender: TObject);
begin
   pnlDfe.Visible := not pnlDfe.Visible;
end;

procedure TfrmPrincipal.btnDfeMouseEnter(Sender: TObject);
begin
   Focar(pnlSelecionado, (TComponent(Sender) as TSpeedButton), True);
end;

procedure TfrmPrincipal.btnDfeMouseLeave(Sender: TObject);
begin
  Focar(pnlSelecionado, (TComponent(Sender) as TSpeedButton), False);
end;

procedure TfrmPrincipal.btnEstoqueClick(Sender: TObject);
begin
   pnlEstoque.Visible := not pnlEstoque.Visible;
end;

procedure TfrmPrincipal.btnEstoqueMouseEnter(Sender: TObject);
begin
   Focar(pnlSelecionado, (TComponent(Sender) as TSpeedButton), True);
end;

procedure TfrmPrincipal.btnEstoqueMouseLeave(Sender: TObject);
begin
  Focar(pnlSelecionado, (TComponent(Sender) as TSpeedButton), False);
end;

procedure TfrmPrincipal.btnFinanceiroClick(Sender: TObject);
begin
   pnlFinanceiro.Visible := not pnlFinanceiro.Visible;
end;

procedure TfrmPrincipal.btnFinanceiroMouseEnter(Sender: TObject);
begin
   Focar(pnlSelecionado, (TComponent(Sender) as TSpeedButton), True);
end;

procedure TfrmPrincipal.btnFinanceiroMouseLeave(Sender: TObject);
begin
   Focar(pnlSelecionado, (TComponent(Sender) as TSpeedButton), False);
end;

procedure TfrmPrincipal.btnFormaPgtoMouseEnter(Sender: TObject);
begin
   FocarSubMenu(pnlGeral, (TComponent(Sender) as TSpeedButton), True);
end;

procedure TfrmPrincipal.btnFormaPgtoMouseLeave(Sender: TObject);
begin
  FocarSubMenu(pnlGeral, (TComponent(Sender) as TSpeedButton), False);
end;

procedure TfrmPrincipal.btnGeralClick(Sender: TObject);
begin
   pnlGeral.Visible := not pnlGeral.Visible;
end;

procedure TfrmPrincipal.btnGeralMouseEnter(Sender: TObject);
begin
   Focar(pnlSelecionado, (TComponent(Sender) as TSpeedButton), True);
end;

procedure TfrmPrincipal.btnGeralMouseLeave(Sender: TObject);
begin
  Focar(pnlSelecionado, (TComponent(Sender) as TSpeedButton), False);
end;

procedure TfrmPrincipal.btnMesaMouseEnter(Sender: TObject);
begin
   FocarSubMenu(pnlGeral, (TComponent(Sender) as TSpeedButton), True);
end;

procedure TfrmPrincipal.btnMesaMouseLeave(Sender: TObject);
begin
  FocarSubMenu(pnlGeral, (TComponent(Sender) as TSpeedButton), False);
end;

procedure TfrmPrincipal.btnNfceClick(Sender: TObject);
begin
   pnlNfce.Visible := not pnlNfce.Visible;
end;

procedure TfrmPrincipal.btnNfeClick(Sender: TObject);
begin
   pnlNfe.Visible := not pnlNfe.Visible;
end;

procedure TfrmPrincipal.btnNfseClick(Sender: TObject);
begin
   pnlNfse.Visible := not pnlNfse.Visible;
end;

procedure TfrmPrincipal.btnPedidoClick(Sender: TObject);
begin
   pnlPedido.Visible := not pnlPedido.Visible;
end;

procedure TfrmPrincipal.btnPedidoMouseEnter(Sender: TObject);
begin
   Focar(pnlSelecionado, (TComponent(Sender) as TSpeedButton), True);
end;

procedure TfrmPrincipal.btnPedidoMouseLeave(Sender: TObject);
begin
   Focar(pnlSelecionado, (TComponent(Sender) as TSpeedButton), False);
end;

procedure TfrmPrincipal.btnPessoaMouseEnter(Sender: TObject);
begin
  FocarSubMenu(pnlGeral, (TComponent(Sender) as TSpeedButton), True);
end;

procedure TfrmPrincipal.btnPessoaMouseLeave(Sender: TObject);
begin
  FocarSubMenu(pnlGeral, (TComponent(Sender) as TSpeedButton), False);
end;

procedure TfrmPrincipal.btnPlanoContaMouseEnter(Sender: TObject);
begin
  FocarSubMenu(pnlGeral, (TComponent(Sender) as TSpeedButton), True);
end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TfrmPrincipal.btnSairMouseEnter(Sender: TObject);
begin
  Focar(pnlSelecionado, (TComponent(Sender) as TSpeedButton), True);
end;

procedure TfrmPrincipal.btnSairMouseLeave(Sender: TObject);
begin
   Focar(pnlSelecionado, (TComponent(Sender) as TSpeedButton), False);
end;

procedure TfrmPrincipal.btnTributacaoClick(Sender: TObject);
begin
   pnlTributacao.Visible := not pnlTributacao.Visible;
end;

procedure TfrmPrincipal.btnTributacaoMouseEnter(Sender: TObject);
begin
   Focar(pnlSelecionado, (TComponent(Sender) as TSpeedButton), True);
end;

procedure TfrmPrincipal.btnTributacaoMouseLeave(Sender: TObject);
begin
   Focar(pnlSelecionado, (TComponent(Sender) as TSpeedButton), False);
end;

procedure TfrmPrincipal.btnVendaMouseEnter(Sender: TObject);
begin
   Focar(pnlSelecionado, (TComponent(Sender) as TSpeedButton), True);
end;

procedure TfrmPrincipal.btnVendaMouseLeave(Sender: TObject);
begin
  Focar(pnlSelecionado, (TComponent(Sender) as TSpeedButton), False);
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
var frm: TfrmCadGrupo;
begin
   frm := TfrmCadGrupo.Create(Self);
   try
      frm.Parent      := pnlFundo;
      frm.Align       := alClient;
      frm.BorderStyle := bsNone;
      frm.Show;
   finally
      FreeAndNil(frm);
   end;
end;

procedure TfrmPrincipal.CarregarConfiguracao;
var
   FConfig: TConfiguracaoVO;
begin
   FConfig := TConfiguracaoVO.Create;
   try
     //Carregar as configur��es do restaurante que vai usar o gestor.
   finally
     FConfig.Free;
   end;
end;

procedure TfrmPrincipal.Focar(painel: TPanel; btn: TSpeedButton;
  focado: boolean);
var i: integer;
begin
   if focado then
   begin
     for i := 0 to frmPrincipal.ComponentCount - 1 do
     begin
       if (frmPrincipal.Components[i] is TSpeedButton) and ((frmPrincipal.Components[i] as TSpeedButton).Tag = btn.Tag) then
       begin
         painel.Visible := True;
         painel.Left := btn.Left;
         painel.Top := btn.Top;
         (frmPrincipal.Components[i] as TSpeedButton).Font.Color := $004080FF;
         (frmPrincipal.Components[i] as TSpeedButton).Font.Style := [fsBold, fsUnderline];
         (frmPrincipal.Components[i] as TSpeedButton).Font.Size := 12;
       end;
     end;
   end
   else
   begin
     for i := 0 to frmPrincipal.ComponentCount - 1 do
     begin
       if frmPrincipal.Components[i] is TSpeedButton then
       begin
         painel.Visible := False;
         (frmPrincipal.Components[i] as TSpeedButton).Font.Color := clHotLight;
         (frmPrincipal.Components[i] as TSpeedButton).Font.Style := [fsBold];
         (frmPrincipal.Components[i] as TSpeedButton).Font.Size := 10;
       end;
     end;
   end;
end;

procedure TfrmPrincipal.FocarSubMenu(painel: TPanel; btn: TSpeedButton;
  focar: boolean);
var i, j: integer;
begin
   if focar then
   begin
     for i := 0 to frmPrincipal.ComponentCount - 1 do
     begin
       if (frmPrincipal.Components[i] is TSpeedButton) and ((frmPrincipal.Components[i] as TSpeedButton).Tag = btn.Tag) then
       begin
         (frmPrincipal.Components[i] as TSpeedButton).Font.Color := $004080FF;
         (frmPrincipal.Components[i] as TSpeedButton).Font.Style := [fsBold, fsUnderline];
         (frmPrincipal.Components[i] as TSpeedButton).Font.Size := 12;
       end;
     end;
   end
   else
   begin
    for j := 0 to frmPrincipal.ComponentCount - 1 do
     begin
       if (frmPrincipal.Components[j] is TSpeedButton) then
       begin
         (frmPrincipal.Components[j] as TSpeedButton).Font.Color := clHotLight;
         (frmPrincipal.Components[j] as TSpeedButton).Font.Style := [fsBold];
         (frmPrincipal.Components[j] as TSpeedButton).Font.Size := 10;
       end;
     end;
   end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  //FFabrica := TFabricaObjeto<TPerfilUsuarioVO>.Create;
  FPerfil := TPerfilUsuarioVO.Create;
  //FController := TPerfilUsuarioController<TPerfilUsuarioVO>.Create;
  pnlMenu.Enabled := False;
end;

procedure TfrmPrincipal.HabilitarBotaoMenu;
begin
   if pnlMenu.Width = 38 then
   begin
     btnGeral.Enabled := False;
     btnDfe.Enabled := False;
     btnEstoque.Enabled := False;
     btnTributacao.Enabled := False;
     btnFinanceiro.Enabled := False;
     btnPedido.Enabled := False;
     btnVenda.Enabled := False;
     btnSair.Enabled := False;
   end;

   if pnlMenu.Width = 115 then
   begin
     btnGeral.Enabled := True;
     btnDfe.Enabled := True;
     btnEstoque.Enabled := True;
     btnTributacao.Enabled := True;
     btnFinanceiro.Enabled := True;
     btnPedido.Enabled := True;
     btnVenda.Enabled := True;
     btnSair.Enabled := True;
   end;

end;

procedure TfrmPrincipal.IconBmp(Btn: TSpeedButton; ind: integer);
var
  bmp: TBitmap;
begin
   bmp := TBitmap.Create;
   try
     ImageList1.GetBitmap(ind, bmp);
     Btn.Glyph := bmp;
   finally
     bmp.Free;
   end;
end;

procedure TfrmPrincipal.imgMenuClick(Sender: TObject);
begin
   if bExpandido then
   begin
      pnlMenu.Width := 38;
      pnlMenu.Enabled := False;
   end
   else
   begin
      pnlMenu.Width := 115;
      pnlMenu.Enabled := True;
   end;
   bExpandido := not bExpandido;
end;

procedure TfrmPrincipal.MostrarEsconderPanel(painel: TPanel; btn: TSpeedButton;
  mostrar: boolean);
var i, j: integer;
begin
   if mostrar then
   begin
     for i := 0 to frmPrincipal.ComponentCount - 1 do
     begin
       if (frmPrincipal.Components[i] is TPanel) and ((frmPrincipal.Components[i] as TPanel).Tag = btn.Tag) then
          (frmPrincipal.Components[i] as TPanel).Visible := True;
     end;
     {for j := 0 to painel.ControlCount - 1 do
     begin
       if painel.Controls[j] is TSpeedButton then
       begin
         (painel.Controls[j] as TSpeedButton).Font.Color := $004080FF;
         (painel.Controls[j] as TSpeedButton).Font.Style := [fsBold, fsUnderline];
         (painel.Controls[j] as TSpeedButton).Font.Size := 12;
       end;
     end;}
   end
   else
   begin
     for j := 0 to frmPrincipal.ComponentCount - 1 do
     begin
       if (frmPrincipal.Components[j] is TPanel) and ((frmPrincipal.Components[j] as TPanel).Tag = btn.Tag) then
         (frmPrincipal.Components[j] as TPanel).Visible := False;
     end;
   end;
end;

procedure TfrmPrincipal.pnlMenuMouseEnter(Sender: TObject);
begin
  //HabilitarBotaoMenu;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
   lblDataHorario.Caption := DateTimeToStr(Now);
end;

end.
