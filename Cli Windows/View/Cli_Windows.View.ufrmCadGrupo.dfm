inherited frmCadGrupo: TfrmCadGrupo
  Caption = 'frmCadGrupo'
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 1113
  ExplicitHeight = 527
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlCadastro: TPanel
      inherited pnlBotoes: TPanel [0]
        inherited pnlBotaoSalvar: TPanel
          inherited btnSalvar: TSpeedButton
            OnClick = btnSalvarClick
          end
        end
        inherited pnlBotaoCancelar: TPanel
          inherited btnCancelar: TSpeedButton
            OnClick = btnCancelarClick
          end
        end
      end
      inherited pnlCampos: TPanel [1]
        object pnlId: TPanel
          Left = 6
          Top = 10
          Width = 123
          Height = 41
          BevelOuter = bvNone
          TabOrder = 0
          object Label5: TLabel
            Left = 0
            Top = 0
            Width = 123
            Height = 13
            Align = alTop
            Caption = 'ID:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 14
          end
          object edtId: TEdit
            Left = 0
            Top = 13
            Width = 123
            Height = 28
            Align = alClient
            BorderStyle = bsNone
            Color = 8454143
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object pnlDescricao: TPanel
          Left = 140
          Top = 10
          Width = 277
          Height = 41
          BevelOuter = bvNone
          TabOrder = 1
          object Label6: TLabel
            Left = 0
            Top = 0
            Width = 277
            Height = 13
            Align = alTop
            Caption = 'DESCRI'#199#195'O:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 63
          end
          object edtDescricao: TEdit
            Left = 0
            Top = 13
            Width = 277
            Height = 28
            Align = alClient
            BorderStyle = bsNone
            CharCase = ecUpperCase
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
      end
    end
    inherited pnlListagem: TPanel
      inherited pnlGrid: TPanel
        inherited dbgGeral: TDBGrid
          OnDblClick = dbgGeralDblClick
        end
      end
    end
  end
end
