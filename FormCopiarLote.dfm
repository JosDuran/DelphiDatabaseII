inherited frmCopiarLote: TfrmCopiarLote
  Left = 345
  Top = 320
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'Copiar Lote'
  ClientHeight = 176
  ClientWidth = 537
  Font.Charset = ANSI_CHARSET
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 73
    Width = 537
    Height = 62
    object Label1: TLabel
      Left = 16
      Top = 14
      Width = 91
      Height = 13
      Caption = 'Directorio de salida'
    end
    object Label2: TLabel
      Left = 17
      Top = 36
      Width = 80
      Height = 13
      Caption = 'Nombre del Libro'
    end
    object edtOutDir: TJvDirectoryEdit
      Left = 144
      Top = 8
      Width = 377
      Height = 21
      DialogKind = dkWin32
      TabOrder = 0
    end
    object cboNomLibro: TComboBox
      Left = 144
      Top = 32
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
    end
  end
  inherited Panel2: TPanel
    Top = 135
    Width = 537
    Height = 41
    object bAceptar: TButton
      Left = 376
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = bAceptarClick
    end
    object BCancelar: TButton
      Left = 456
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
    end
  end
  object JvNavPanelHeader: TJvNavPanelHeader
    Left = 0
    Top = 0
    Width = 537
    Height = 73
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ColorFrom = 9748404
    ColorTo = 4355685
    ImageIndex = 0
    object Label9: TLabel
      Left = 8
      Top = 8
      Width = 53
      Height = 16
      Caption = 'Cliente :'
      Color = 9748404
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label10: TLabel
      Left = 8
      Top = 24
      Width = 115
      Height = 16
      Caption = 'Tipo Documental :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label11: TLabel
      Left = 8
      Top = 40
      Width = 38
      Height = 16
      Caption = 'Lote :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object RAZONSOCIAL: TDBText
      Left = 128
      Top = 8
      Width = 417
      Height = 17
      Color = 12639432
      DataField = 'RAZONSOCIAL'
      DataSource = DM.DataClientes
      Font.Charset = ANSI_CHARSET
      Font.Color = clLime
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object NOM_DOCUMENTO: TDBText
      Left = 128
      Top = 24
      Width = 433
      Height = 17
      DataField = 'NOM_DOCUMENTO'
      DataSource = DM.DataDocumentos
      Font.Charset = ANSI_CHARSET
      Font.Color = clLime
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object DBNOM_LOTE: TDBText
      Left = 176
      Top = 40
      Width = 369
      Height = 17
      DataField = 'NOM_LOTE'
      DataSource = DM.DataLotes
      Font.Charset = ANSI_CHARSET
      Font.Color = clLime
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object COD_LOTE: TDBText
      Left = 128
      Top = 40
      Width = 41
      Height = 17
      DataField = 'COD_LOTE'
      DataSource = DM.DataLotes
      Font.Charset = ANSI_CHARSET
      Font.Color = clLime
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label7: TLabel
      Left = 8
      Top = 56
      Width = 32
      Height = 16
      Caption = 'TPC :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object LBLTPC: TLabel
      Left = 128
      Top = 56
      Width = 4
      Height = 16
      Font.Charset = ANSI_CHARSET
      Font.Color = clLime
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
  end
end
