unit Cli_Windos.View.ufrmRelatorioBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, RLReport, Vcl.Buttons,
  Vcl.StdCtrls, Data.DB;

type
  TfrmRelatorioBase = class(TForm)
    pnlBotoes: TPanel;
    pnlRelatorio: TPanel;
    pnlBotaoImprimir: TPanel;
    pnlBotaoFechar: TPanel;
    Relat�rioBase: TRLReport;
    btnImprir: TSpeedButton;
    btnFechar: TSpeedButton;
    GroupBox1: TGroupBox;
    rdbVisualizar: TRadioButton;
    rdbImprimir: TRadioButton;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    lblTitulo: TRLLabel;
    imgLogo: TRLImage;
    lblRazaoSocial: TRLLabel;
    lblFantasia: TRLLabel;
    lblEndTel: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLPanel1: TRLPanel;
    lblCnpjIe: TRLLabel;
    procedure btnFecharClick(Sender: TObject);
    procedure btnImprirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FDs: TDataSource;
    procedure CarregarDS(); virtual; abstract;
    procedure MontarRelatorio(); virtual; abstract;
  end;

var
  frmRelatorioBase: TfrmRelatorioBase;

implementation

{$R *.dfm}

procedure TfrmRelatorioBase.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelatorioBase.btnImprirClick(Sender: TObject);
begin
   if rdbVisualizar.Checked then
     Relat�rioBase.Preview();
   if rdbImprimir.Checked then
     Relat�rioBase.Print;
end;

procedure TfrmRelatorioBase.FormCreate(Sender: TObject);
begin
   FDs := TDataSource.Create(Self);
end;

procedure TfrmRelatorioBase.FormDestroy(Sender: TObject);
begin
  FDs.Free;
end;

end.