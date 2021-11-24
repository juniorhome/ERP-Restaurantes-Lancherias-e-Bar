unit Cli_Windows.View.uFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    pnlLogin: TPanel;
    Shape1: TShape;
    pnlImagem: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.FormResize(Sender: TObject);
begin
   pnlLogin.Top := Round(frmLogin.Height / 2 - pnlLogin.Height / 2);
   pnlLogin.Left := Round(frmLogin.Width / 2 - pnlLogin.Width / 2);
end;

end.