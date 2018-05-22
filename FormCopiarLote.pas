unit FormCopiarLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormStd, StdCtrls, Mask, JvExMask, JvToolEdit, ExtCtrls,
  DBCtrls, JvExControls, JvNavigationPane, UDGFunctions, Data, PfibDataset, UimgFunctions;

type
  TfrmCopiarLote = class(TfrmStd)
    edtOutDir: TJvDirectoryEdit;
    Label1: TLabel;
    JvNavPanelHeader: TJvNavPanelHeader;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    RAZONSOCIAL: TDBText;
    NOM_DOCUMENTO: TDBText;
    DBNOM_LOTE: TDBText;
    COD_LOTE: TDBText;
    Label7: TLabel;
    LBLTPC: TLabel;
    bAceptar: TButton;
    BCancelar: TButton;
    cboNomLibro: TComboBox;
    Label2: TLabel;
    procedure bAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure CopiaLote(ATpc: string);
  end;

implementation

{$R *.dfm}

{ TfrmCopiarLote }

class procedure TfrmCopiarLote.CopiaLote(ATpc: string);
var
  AFrmCopiarLote: TfrmCopiarLote;
begin
  try
    AFrmCopiarLote := TfrmCopiarLote.Create(Application);
    AFrmCopiarLote.LBLTPC.Caption := Atpc;
    AFrmCopiarLote.ShowModal;
  finally
    AFrmCopiarLote.Free;
  end;

end;

procedure TfrmCopiarLote.bAceptarClick(Sender: TObject);
var
  ALote: Integer;
  AOutDir: string;
  ANomLibro: string;
begin
  inherited;
  ALote := dm.pFIbLotes.fieldbyName('cod_lote').asInteger;
  AOutDir := edtOutDir.Text;
  if AOutDir = '' then
    raise exception.Create('Error, debe especificar carpeta de salida');
  ANomLibro := cboNomLibro.Text;
  if ANomLibro = '' then
    raise exception.Create('Debe especificar el nombre del libro');
  MarkImags(ALote);
  CopyLoteToFolder(ALote, AOutDir, ANomLibro);
  dm.SidTransaction.Commit;
  showmessage('copia realizada con exito');
end;

procedure TfrmCopiarLote.FormCreate(Sender: TObject);
var
  SQLStr: string;
  ACliente: integer;
  ADoc: integer;
  i: integer;
  ADataSet: tpFibDataset;
  AFieldName: string;
begin
  inherited;
  ACliente := dm.pfibdocumentos.fieldByName('cod_cliente').asInteger;
  ADoc := dm.pfibdocumentos.FieldByName('cod_documento').AsInteger;
  SQLStr := 'select * from campos where cod_cliente = ' + IntToStr(ACliente) + ' AND COD_DOCUMENTO = ' +
            IntToStr(ADoc);
  ADataSet:= dm.getNewDataSet(SQLStr );
  for i:= 0 to ADataSet.recordCount -1 do begin
    AfieldName := ADataset.fieldbyName('nom_campo').asString;
    cboNomLibro.Items.Add(AfieldName);
    ADataset.next;
  end;
  dm.freedataset(adataset);
end;

end.
