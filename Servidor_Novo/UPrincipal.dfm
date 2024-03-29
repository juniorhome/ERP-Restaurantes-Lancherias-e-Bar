object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Tela de Configura'#231#227'o do  Servidor'
  ClientHeight = 386
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlConfigServidor: TPanel
    Left = 0
    Top = 0
    Width = 645
    Height = 105
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 4
      Top = 51
      Width = 30
      Height = 13
      Caption = 'Porta:'
    end
    object Label2: TLabel
      Left = 53
      Top = 51
      Width = 40
      Height = 13
      Caption = 'Usu'#225'rio:'
    end
    object Label3: TLabel
      Left = 177
      Top = 51
      Width = 34
      Height = 13
      Caption = 'Senha:'
    end
    object Label4: TLabel
      Left = 116
      Top = 16
      Width = 367
      Height = 24
      Alignment = taCenter
      Caption = 'CONFIGURA'#199#195'O DO SERVIDOR REST DW'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label5: TLabel
      Left = 301
      Top = 51
      Width = 76
      Height = 13
      Caption = 'Outras Op'#231#245'es:'
    end
    object lblStatusServidor: TLabel
      Left = 421
      Top = 74
      Width = 140
      Height = 19
      Caption = 'lblStatusServidor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 421
      Top = 51
      Width = 93
      Height = 13
      Caption = 'Status do Servidor:'
    end
    object edtPorta: TEdit
      Left = 4
      Top = 70
      Width = 45
      Height = 21
      TabOrder = 0
      Text = '8082'
    end
    object edtUsuario: TEdit
      Left = 53
      Top = 70
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'testeserver'
    end
    object edtSenha: TEdit
      Left = 177
      Top = 70
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'testeserver'
    end
    object CheckBox1: TCheckBox
      Left = 301
      Top = 70
      Width = 97
      Height = 17
      Caption = 'Autentica'#231#227'o'
      TabOrder = 3
    end
  end
  object pnlConfigBanco: TPanel
    Left = 0
    Top = 105
    Width = 645
    Height = 281
    Align = alClient
    TabOrder = 1
    object Label6: TLabel
      Left = 116
      Top = 6
      Width = 349
      Height = 24
      Alignment = taCenter
      Caption = 'CONFIGURA'#199#195'O DO BANCO DE DADOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 8
      Top = 48
      Width = 33
      Height = 13
      Caption = 'Driver:'
    end
    object Label8: TLabel
      Left = 109
      Top = 48
      Width = 40
      Height = 13
      Caption = 'Usu'#225'rio:'
    end
    object Label9: TLabel
      Left = 264
      Top = 48
      Width = 34
      Height = 13
      Caption = 'Senha:'
    end
    object Label10: TLabel
      Left = 8
      Top = 148
      Width = 92
      Height = 13
      Caption = 'Caminho do Banco:'
    end
    object Label11: TLabel
      Left = 387
      Top = 48
      Width = 28
      Height = 13
      Caption = 'Local:'
    end
    object Label12: TLabel
      Left = 8
      Top = 195
      Width = 57
      Height = 13
      Caption = 'Framework:'
    end
    object Label13: TLabel
      Left = 8
      Top = 96
      Width = 65
      Height = 13
      Caption = 'Caminho DLL:'
    end
    object Label14: TLabel
      Left = 241
      Top = 217
      Width = 37
      Height = 13
      Caption = 'Label14'
    end
    object Label15: TLabel
      Left = 498
      Top = 48
      Width = 30
      Height = 13
      Caption = 'Porta:'
    end
    object cmbDriver: TComboBox
      Left = 8
      Top = 64
      Width = 97
      Height = 21
      TabOrder = 0
      Items.Strings = (
        'FIREBIRD'
        'POSTGRESQL'
        'MYSQL'
        'SQL SERVER'
        'ORACLE')
    end
    object edtUsuarioBanco: TEdit
      Left = 110
      Top = 64
      Width = 150
      Height = 21
      TabOrder = 1
    end
    object edtSenhaBanco: TEdit
      Left = 264
      Top = 64
      Width = 120
      Height = 21
      TabOrder = 2
    end
    object edtCaminhoBanco: TEdit
      Left = 8
      Top = 164
      Width = 534
      Height = 21
      TabOrder = 3
    end
    object edtLocal: TEdit
      Left = 387
      Top = 64
      Width = 108
      Height = 21
      TabOrder = 4
    end
    object edtCaminhoDLL: TEdit
      Left = 8
      Top = 112
      Width = 534
      Height = 21
      TabOrder = 5
    end
    object cmbFramework: TComboBox
      Left = 8
      Top = 209
      Width = 145
      Height = 21
      TabOrder = 6
      Items.Strings = (
        'ADO'
        'DBEXPRESS'
        'FIREDAC'
        'ZEOS')
    end
    object btnConectar: TButton
      Left = 408
      Top = 232
      Width = 75
      Height = 25
      Caption = 'Conectar'
      TabOrder = 7
      OnClick = btnConectarClick
    end
    object btnDesconectar: TButton
      Left = 486
      Top = 232
      Width = 75
      Height = 25
      Caption = 'Desconectar'
      TabOrder = 8
      OnClick = btnDesconectarClick
    end
    object btnSair: TButton
      Left = 565
      Top = 232
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 9
      OnClick = btnSairClick
    end
    object btnGerarArquivo: TButton
      Left = 160
      Top = 208
      Width = 75
      Height = 25
      Caption = 'Gerar Arquivo'
      TabOrder = 10
      OnClick = btnGerarArquivoClick
    end
    object btnMinimizar: TButton
      Left = 8
      Top = 240
      Width = 75
      Height = 25
      Caption = 'Minimizar'
      TabOrder = 11
      OnClick = btnMinimizarClick
    end
    object edtPortaBanco: TEdit
      Left = 498
      Top = 64
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 12
    end
  end
  object RESTDWServicePooler: TRESTDWIdServicePooler
    Active = False
    CORS = False
    CORS_CustomHeaders.Strings = (
      'Access-Control-Allow-Origin=*'
      
        'Access-Control-Allow-Methods=GET, POST, PATCH, PUT, DELETE, OPTI' +
        'ONS'
      
        'Access-Control-Allow-Headers=Content-Type, Origin, Accept, Autho' +
        'rization, X-CUSTOM-HEADER')
    PathTraversalRaiseError = True
    RequestTimeout = -1
    ServicePort = 8082
    ProxyOptions.ProxyPort = 0
    AuthenticationOptions.AuthorizationOption = rdwAOBasic
    AuthenticationOptions.OptionParams.AuthDialog = True
    AuthenticationOptions.OptionParams.CustomDialogAuthMessage = 'Protected Space...'
    AuthenticationOptions.OptionParams.Custom404TitleMessage = '(404) The address you are looking for does not exist'
    AuthenticationOptions.OptionParams.Custom404BodyMessage = '404'
    AuthenticationOptions.OptionParams.Custom404FooterMessage = 'Take me back to <a href="./">Home REST Dataware'
    AuthenticationOptions.OptionParams.Username = 'testserver'
    AuthenticationOptions.OptionParams.Password = 'testserver'
    Encoding = esUtf8
    RootPath = '/'
    ForceWelcomeAccess = False
    CriptOptions.Use = False
    CriptOptions.Key = 'RDWBASEKEY256'
    EncodeErrors = False
    SSLVersions = []
    SSLVerifyMode = []
    SSLVerifyDepth = 0
    SSLMode = sslmUnassigned
    SSLMethod = sslvSSLv2
    Left = 568
    Top = 16
  end
  object TrayIcon: TTrayIcon
    BalloonHint = 'Servidor RDW pronto.'
    BalloonTitle = 'Mensagens do Servidor'
    BalloonFlags = bfInfo
    PopupMenu = PopupMenu1
    Left = 576
    Top = 113
  end
  object PopupMenu1: TPopupMenu
    Left = 576
    Top = 193
    object Conectar1: TMenuItem
      Caption = 'Conectar'
      OnClick = Conectar1Click
    end
    object Excluiroarquivoini1: TMenuItem
      Caption = 'Excluir o arquivo ini'
      OnClick = Excluiroarquivoini1Click
    end
    object Desconectar1: TMenuItem
      Caption = 'Desconectar'
      OnClick = Desconectar1Click
    end
    object Mostraratela1: TMenuItem
      Caption = 'Mostrar a tela'
      OnClick = Mostraratela1Click
    end
    object Mostraratela2: TMenuItem
      Caption = 'Sair'
      OnClick = Mostraratela2Click
    end
  end
end
