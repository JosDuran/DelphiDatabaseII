unit Data;

interface
                              
uses
  Windows, SysUtils, Classes, pFIBScript, FIBDatabase, Dialogs,pFIBDatabase,
  DB, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, Forms, IniFiles,
  DBClient, Provider, pFIBClientDataSet,  SIBEABase, SIBFIBEA, udbOther, ustdfunctions,
  JvMemoryDataset, pfibcachequeries, IBDatabase, IBSQL;
                            
type
  TDM = class(TDataModule)                       
    SidDatabase: TpFIBDatabase;
    SidTransaction: TpFIBTransaction;
    Script: TpFIBScript;
    pFIBClientes: TpFIBDataSet;
    pFIBUsuarios: TpFIBDataSet;
    DataClientes: TDataSource;
    pFIBQuery: TpFIBQuery;
    pFIBTipoIndex: TpFIBDataSet;
    DataUsuarios: TDataSource;
    DataTipoIndex: TDataSource;
    DataLite: TpFIBDatabase;
    TransLite: TpFIBTransaction;
    ScriptLite: TpFIBScript;
    pFIBQueryLite: TpFIBQuery;
    pFIBDataSet: TpFIBDataSet;
    SIBfibEventAlerter1: TSIBfibEventAlerter;
    mdImagenes: TJvMemoryData;
    mdImagenespathimg: TStringField;
    mdImagenesXRes: TIntegerField;
    mdImagenesYRes: TIntegerField;
    mdImagenesMarked: TSmallintField;
    pFIBClientesCOD_CLIENTE: TFIBIntegerField;
    pFIBClientesRAZONSOCIAL: TFIBStringField;
    pFIBClientesRUC: TFIBStringField;
    pFIBClientesTELEFONO: TFIBStringField;
    pFIBClientesFAX: TFIBStringField;
    pFIBClientesEMAIL: TFIBStringField;
    pFIBClientesCONTACTO: TFIBStringField;
    pFIBClientesDIRECCION: TFIBStringField;
    pFIBClientesCOD_USUARIO: TFIBStringField;
    pFIBClientesFECHACARGA: TFIBDateTimeField;
    pFIBTipoIndexCOD_TIPOINDEX: TFIBIntegerField;
    pFIBTipoIndexNOM_TIPOINDEX: TFIBStringField;
    TransExtra: TpFIBTransaction;
    ScriptExtra: TpFIBScript;
    QueryExtra: TpFIBQuery;
    DatabaseExtra: TpFIBDatabase;
    pFIBUsuariosCOD_USUARIO: TFIBStringField;
    pFIBUsuariosNOM_USUARIO: TFIBStringField;
    pFIBUsuariosCLAVE: TFIBStringField;
    pFIBUsuariosFECHAINGRESO: TFIBDateTimeField;
    pFIBUsuariosFECHAINICIO: TFIBDateTimeField;
    pFIBUsuariosFECHATERMINO: TFIBDateTimeField;
    pFIBUsuariosULT_PERFIL: TFIBIntegerField;
    pFIBUsuariosEMAIL: TFIBStringField;
    pFIBUsuariosESACTIVO: TFIBSmallIntField;
    procedure pFIBClientesBeforePost(DataSet: TDataset);
    procedure pFIBUsuariosBeforePost(DataSet: TDataSet);
    procedure pFIBAccesosBeforePost(DataSet: TDataSet);
    procedure pFIbLotesBeforePost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure pFIBRegistrosBeforeEdit(DataSet: TDataSet);
    procedure pFIBRegistrosBeforeDelete(DataSet: TDataSet);
    procedure pFIBClientesBeforeDelete(DataSet: TDataSet);
    procedure pFIBClientesAfterPost(DataSet: TDataSet);
    procedure pFIBClientesAfterDelete(DataSet: TDataSet);
    procedure pFIBUsuariosBeforeDelete(DataSet: TDataSet);
    procedure pFIBUsuariosAfterDelete(DataSet: TDataSet);
    procedure pFIBUsuariosAfterPost(DataSet: TDataSet);
    procedure pFIBAccesosBeforeDelete(DataSet: TDataSet);
    procedure pFIBAccesosAfterDelete(DataSet: TDataSet);
    procedure pFIBAccesosAfterPost(DataSet: TDataSet);
    procedure pFIBUsuariosNewRecord(DataSet: TDataSet);
    procedure SIBfibEventAlerter1EventAlert(Sender: TObject;
      EventName: String; EventCount: Integer);
//    procedure pFIbLotesAfterPost(DataSet: TDataSet);
  private
    FReadOnly: Boolean;
    FVersion: Integer;
    FFileName: String;
    FSeparator: String;
    FServer: String;

    // created by Jose Duran
    fDataBaseName: string;
    fLastError: string;
    fSetupDatabase: boolean;
    fIntransaction: boolean;

    FCod_Documento: Integer;
    FCod_Cliente: Integer;
    FCod_Lote: Integer;
    FActvId: integer;

  //  FCanCallBrowse: boolean;
    procedure SetFileName(const Value: String);
    procedure SetReadOnly(const Value: Boolean);
    procedure SetVersion(const Value: Integer);
    procedure SetSeparator(const Value: String);
    procedure SetServer(const Value: String);

    // created by Jose Duran

//    procedure SetupDatabase;



    { Private declarations }
  public
    { Public declarations }
    property FileName : String read FFileName write SetFileName;
    property ReadOnly : Boolean read FReadOnly write SetReadOnly;
    Property Version  : Integer read FVersion write SetVersion;
    property Separator : String read FSeparator write SetSeparator;
    property Server : String read FServer write SetServer;
//    function  GetCodClient: Integer;
    procedure ExecuteSQL(sqlstr: string);
    function  GetCodLote: Integer;
//    function  GetFieldNames(TableName : String): String;
    function  GetDateServer: TDateTime;
    function  GetCodDocument(Cod_Cliente : Integer):Integer;
    function  GetDocument(ALote: integer): integer;
    function  Getclient(ALote: integer): integer;
    function  GetMaxRecord(Tabla : String):Integer ;
    function  GetMaxItem (Tabla : String; ID : Integer): Integer;
    function  BuscarTABLE_NAME(TableName : String): Boolean;
    function  SumRecord(Tabla: String; Lote : Integer; Campo : String): Integer;
    function  TotalImagen(TableRecord, TableImagen: String; Cod_Lote: Integer) : Integer;
    function  TotalRecord(TableRecord : String; Cod_Lote: Integer): Integer;
		function  TotalChequeados(TableRecord : String; Cod_Lote: Integer): Integer;
    function  ObtenerPermiso(Const User_ID : String; Option : Integer): Boolean;
    function  PendienteAprobacion : Boolean;
//    function  GetHints: String;
    function  CreateTarget : String;
//    function  CreateTargetDetail: String;
    procedure PrepareAuditoria(DataSet : TDataSet);
//    procedure ConfirmAuditoria(DataSet : TDataSet);
		procedure SQLImageTable(Table: String);
    procedure DoManageException(e:exception;asql:string);
    procedure ExecuteScript3(SQLs: string );
    //procedure ExecuteSQL(SQLs: string; Query : TpFIBQuery); overload;
//    procedure ExecuteScript(SQLs: string; AutoCommit: Boolean=True);
    procedure CloseDataSet;
    procedure OpendataSet;
    procedure CAndOpenDataSets;
    procedure LoadIni;
//    procedure Create_Struct(Lines : TStrings);
//    procedure BrowseLote(ACodLote: integer);
//    property CanCallBrowse: boolean read FCanCallBrowse write FCanCallBrowse;

  //created by Jose Duran
    Function GetNewDataSet(SQLStr: string): tpfibdataset;
    function GetNewDataSet2(SQLStr: string): tpfibDataset;
//    Function GetDataSetV2(SQLStr: string; var ADataSet: tpfibDataSet): boolean;
    procedure FreeDataSet(var ADataSet: TpfibDataset); Overload;
    procedure FreeDataSet(var ADataSet: TDataset); Overload;
    procedure FreeDataSet2(var ADataSet: TpfibDataset);
 //   procedure ExeSql(sqlstr: string; BatchProccess: boolean = false);
//    procedure ExeSqlV2(sqlstr: string; BatchProccess: boolean = false);
//    procedure ExeSqlV3(sqlstr: string);
    //procedure ExecWithoutCommit(sqlStr: string);


//    procedure SetPosition;
//    procedure RememberPosition;
//    function GetKeyFieldList: string;
//    function GetMarkedFieldList: string;
//    function ExistFieldsMarked: boolean;
    function ExistFieldsMarked2(ALote: integer): boolean;
    //function GetDataSetV3(SQLStr: string;
              //var ADataSet: tpFibDataSet): boolean;

    Procedure Liberar();
//    function GetNewDataSet(SQLStr: string): TpFibDataset;
    procedure SaveErrorToDBServerlog(SQLStr: string);
    procedure ExecuteScriptSysdba(SQLStr: string);
//    procedure ValidateImgExist(ALote: integer);
    function GetNameLote(iLote: integer): string;
    function GetFieldNames2(IdCliente: integer; IdDoc: integer): String;
    function GetNextGeneratorValue(AGenName: string): integer;
    function GetNewLote: Integer;
    function GetFieldNames3(IdCliente: integer; IdDoc: integer; Aliastbl: string): String;
    function GetFieldNames4(IdCliente: integer; IdDoc: integer; Aliastbl: string): String;
    function GetFieldNames5(IdCliente: integer; IdDoc: integer; Aliastbl: string): String;

  end;


var
  DM: TDM;

implementation

uses Globales ;

{$R *.dfm}

{ TDM }

procedure TDM.DoManageException(e: Exception; asql: string);
begin
  MessageBox(0, pchar('Ha ocurrido un error, por favor comun�quese con su administrador de sistema '+
                'y reporte el siguiente error:'+#13+#10+
                 e.message+' SQL: '+asql), 'ERROR-GEN', MB_ICONERROR or MB_OK or MB_TOPMOST or MB_APPLMODAL);
end;

procedure TDM.ExecuteScript3(SQLs: string);
begin
  Script.Database:=SidDatabase;
  Script.Transaction:=SidTransaction;
  Script.Script.Clear;
  Script.Script.Text := SQLs;
  Script.Transaction.StartTransaction;
  Try
    Script.ExecuteScript;
    Script.Transaction.CommitRetaining;
  Except
    on e:exception do
    	Begin
        Script.Transaction.RollbackRetaining;


	      DoManageException(e,'');
        SaveErrorToDBServerlog(SQLs);
  	    Raise;
    	End;
  End;

End;


procedure Tdm.ExecuteSQL(sqlstr: string);
begin
  //SetupDatabase;
  SidDatabase.Execute(sqlstr);
  if SidDatabase.DefaultTransaction.InTransaction then
    sidDatabase.DefaultTransaction.CommitRetaining;

end;




procedure TDM.LoadIni;
Var
	Archivo : TIniFile;
  Embedded: String;
begin
	Archivo := TIniFile.Create(ExtractFileDir(Application.ExeName)+'\Config.INI');
  SidDatabase.Connected 								:= False;
  DatabaseExtra.Connected := false;
  SidDatabase.SQLDialect 							:= Archivo.ReadInteger('DATABASE','SQLDialect',3);
  DatabaseExtra.SqlDialect := sidDatabase.sqlDialect;
	Embedded 													:= Archivo.ReadString('DATABASE','EMBEDDED','');
  if Embedded = 'SI' then
  	Begin
		  SidDatabase.DBName								:= Archivo.ReadString('DATABASE' ,'PATH','');
      SidDatabase.LibraryName					:= ExtractFilePath(Application.ExeName)+'\ssg_db.dll';
    End
  Else
  	Begin
		  SidDatabase.DBName								:= Archivo.ReadString('DATABASE' ,'SERVER','')+':'+Archivo.ReadString('DATABASE' ,'PATH','');
      DatabaseExtra.DBName :=  SidDatabase.DBName;
	    SidDatabase.LibraryName					:= ExtractFilePath(Application.ExeName)+'\fb_db.dll';
      DatabaseExtra.LibraryName := SidDatabase.LibraryName;
    End;

  SidDatabase.ConnectParams.UserName		:= Archivo.ReadString('DATABASE' ,'USER_NAME','');
  DatabaseExtra.ConnectParams.UserName		:= 'SYSDBA';
  SidDatabase.ConnectParams.Password		:= Archivo.ReadString('DATABASE' ,'PASSWORD','');
  DatabaseExtra.ConnectParams.Password := 'masterkey';
  SidDatabase.ConnectParams.RoleName		:= Archivo.ReadString('DATABASE' ,'sql_role_name','');
  DatabaseExtra.ConnectParams.RoleName:= 'SIDSTD';
  Try
	  SidDatabase.Connected := True;
  Except
    on e:exception do
    	Begin
		    Archivo.Free;
	      DoManageException(e,'');
				Application.Terminate;
        Exit;
  	    Raise;
    	End;
  End;
	Archivo.Free;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
	SidDataBase.Connected := False;
	LoadIni;
  SidTransaction.Active :=true;
  fDataBaseName := GetDBName;
  fSetupDatabase := true;
end;
















procedure Tdm.FreeDataSet(var ADataSet: TpfibDataset);
begin
 // AFibTransaction:=ADataSet.Transaction;
  try
  ADataset.close;
  ADataset.DisableControls;
  ADataset.Transaction:= nil;
  FreeAndNil(ADataSet);
  ADataset:= nil;
  except
    showmessage('no se pudo liberar dataset');
  end;
end;


procedure Tdm.FreeDataSet2(var ADataSet: TpfibDataset);
begin
 // AFibTransaction:=ADataSet.Transaction;
  try
  FreeAndNil(ADataSet);
  ADataset:= nil;
  except
    showmessage('no se pudo liberar dataset');
  end;
end;

function Tdm.GetNewDataSet(SQLStr: string): tpfibDataset;
var
  AFibDataSet: TpFIBDataSet;
begin
  if SidDatabase.DefaultTransaction.InTransaction then
    SidDatabase.CommitRetaining;

  try

    AFibDataSet := TpFIBDataSet.Create(nil);
    AFibDataSet.Database:=SidDatabase;
    AFibDataSet.Transaction:=SidDatabase.defaultTransaction;
//    AFibDataSet.Transaction.DefaultDatabase:=SidDatabase;
  //  AFibDataSet.Transaction.TRParams.Clear;
    AFibDataset.QSelect.SQL.Clear;
    AFibDataSet.QSelect.SQL.Text := SQLStr;
    AFibDataSet.Open;
    result:= AFibDataSet;
    result.Last;
    result.First;
    FLastError := '';
  except
    //SaveErrorToDBServerlog(SQLStr);
    FreeDataSet(Result);
    FLastError := ' Error al traer este dataset: ' + SQLStr ;
    raise exception.Create(FLastError);
  end;
end;

function Tdm.GetNewDataSet2(SQLStr: string): tpfibDataset;
var
  AFibDataSet: TpFIBDataSet;
begin
  if SidDatabase.DefaultTransaction.InTransaction then
    SidDatabase.CommitRetaining;

  try

    AFibDataSet := TpFIBDataSet.Create(nil);
    AFibDataSet.Database:=SidDatabase;
    AFibDataSet.Transaction:=SidDatabase.defaultTransaction;
    AFibDataSet.Transaction.DefaultDatabase:=SidDatabase;
    AFibDataSet.Transaction.TRParams.Clear;
    AFibDataset.QSelect.SQL.Clear;
    AFibDataSet.QSelect.SQL.Text := SQLStr;
    AFibDataSet.Open;
    result:= AFibDataSet;
    result.Last;
    result.First;
    FLastError := '';
  except
    SaveErrorToDBServerlog(SQLStr);
    FreeDataSet(Result);
    FLastError := ' Error al traer este dataset: ' + SQLStr ;
    raise exception.Create(FLastError);
  end;
end;



function TDM.ExistFieldsMarked2(ALote: integer): boolean;
var
  SQLStr: string;
  ADataSet: tpFibDataSet;
  ADoc: integer;
  ACliente: integer;
begin
  ADoc := GetDocument(ALote);
  ACliente := Getclient(ALote);
  SQLStr := 'SELECT * FROM CAMPOS WHERE COD_DOCUMENTO = ' + IntToStr(ADoc) +
            ' AND COD_CLIENTE = ' + IntToStr(ACliente) +  ' AND  FOR_REPORT > 0';
  Adataset := dm.GetNewDataSet(SQLStr);
  result := ADataset.RecordCount >0 ;
  dm.freeDataset(ADataset);
end;







procedure TDM.SaveErrorToDBServerlog(SQLStr: string);
var
  SQLStrE: string;
  AclientProc: string;
  AIpCli: string;
  Ast: string;
  AUser: string;
  AStream: TStringStream;
  AServerProc: string;
  ALote: integer;
begin
  AStream:= TStringStream.Create(SqlStr);
  QueryExtra.SQL.Clear;
  AClientProc := 'EJECUTANDO SCRITP DESDE LA MISMA CAPA CLIENTE';
  AServerProc := 'NINGUNO';
  GetIPFromHost(AIpCli, Ast);
  AUser := VAR_GLOBAL_USER_ID;
  ALote :=-1;

  SQLStrE:= 'INSERT INTO SERVERLOG(sqerror, NOMPROCCLI, NOMPROCSERV, IPCLI, USUARIO, Lote) VALUES ('+
             ' :AError ' + ', ' + QuotedStr(AClientProc) + ', ' + QuotedStr(AServerProc) +
           ', ' + QuotedStr(AIpCli) + ', ' + QuotedStr(AUser) + ', '  + IntToStr(ALote) + ')';
  QueryExtra.SQL.Add(SQLStrE);
  QueryExtra.ParamByName('Aerror').LoadFromStream(AStream);
  QueryExtra.ExecQuery;
  QueryExtra.Transaction.CommitRetaining;

end;



function TDM.GetDocument(ALote: integer): integer;
var
  ADataset: tpfibDataset;
begin
  adataset := self.GetNewDataSet('select * from lotes where cod_lote = ' + IntToStr(ALote)) ;
  result := adataset.fieldByName('cod_documento').asInteger;
  dm.FreeDataSet(Adataset);
end;

function TDM.Getclient(ALote: integer): integer;
var
  ADataset: tpfibDataset;
begin
  adataset := self.GetNewDataSet('select * from lotes where cod_lote = ' + IntToStr(ALote)) ;
  result := adataset.fieldByName('cod_cliente').asInteger;
  dm.FreeDataSet(Adataset);
end;

procedure TDM.ExecuteScriptSysdba(SQLStr: string);
begin
  IF ScriptExtra.Transaction.InTransaction then
    ScriptExtra.Transaction.CommitRetaining;
  ScriptExtra.Script.Clear;
  ScriptExtra.Script.Add(sqlstr);
  try
    if not ScriptExtra.Database.Connected then
      scriptExtra.Database.Open;
    SCriptExtra.ExecuteScript;
    ScriptExtra.Transaction.CommitRetaining;
  except
    on e: exception do begin
        ScriptExtra.Transaction.RollbackRetaining;
	      DoManageException(e,'');
    end;
  end;


end;


function TDM.GetNameLote(iLote: integer): string;
var
  sqlstr: string;
  adataset: tpfibdataset;
begin
  sqlstr := 'select * from lotes where cod_lote = ' + InttoStr(iLote);
  adataset := self.GetNewDataSet(sqlstr);
  result := adataset.fieldbyName('nom_lote').asstring;
  dm.FreeDataSet(adataset);
end;


function TDM.GetFieldNames2(IdCliente: integer; IdDoc: integer): String;
var
	List : TStringList;
  ATableReg: string;
  SQLStr: string;
  ADataset: TpFibDataset;
begin
	//DM.pFIBCampos.DisableControls;
  //DM.pFIBCampos.First;
  List := TStringList.Create;
  SQLStr := 'SELECT * FROM CAMPOS WHERE COD_CLIENTE = ' + IntToStr(IdCliente) +
            ' AND COD_DOCUMENTO = ' + IntToStr(IdDoc);
  ADataset := dm.GetNewDataSet(sqlstr);
  ADataset.first;
  while not ADataset.Eof do
  	Begin
			List.Add(ADataset.FieldByName('NOM_CAMPO').AsString);
			ADataset.Next;
    End;
	//DM.pFIBCampos.EnableControls;
  List.Delimiter := ',';
  Result := List.DelimitedText;
  dm.FreeDataSet(ADataset);
  List.Free;
end;


// retorna todos los campos no comunes (entre tabla de img y reg) de una tabla de registros
function TDM.GetFieldNames3(IdCliente: integer; IdDoc: integer; Aliastbl: string): String;
var
	List : TStringList;
  ATableReg: string;
  SQLStr: string;
  ADataset: TpFibDataset;
  Afield: string;
begin
	//DM.pFIBCampos.DisableControls;
  //DM.pFIBCampos.First;
  List := TStringList.Create;
  SQLStr := 'SELECT * FROM CAMPOS WHERE COD_CLIENTE = ' + IntToStr(IdCliente) +
            ' AND COD_DOCUMENTO = ' + IntToStr(IdDoc);
  ADataset := dm.GetNewDataSet(sqlstr);
  ADataset.first;
  while not ADataset.Eof do Begin
    AField := ADataset.FieldByName('NOM_CAMPO').AsString;
    if ((AField  <> 'COD_LOTE')  AND (AField <> 'FECHA_APRUEBA') AND (AFIELD <> 'ID')) THEN
      if AliasTbl = '' then
        List.Add(AField)
      else
        List.Add(Aliastbl + '.' + AField);
    ADataset.Next;
  End;
	//DM.pFIBCampos.EnableControls;
  List.Delimiter := ',';
  Result := List.DelimitedText;
  dm.FreeDataSet(ADataset);
  List.Free;
end;


function TDM.GetFieldNames5(IdCliente: integer; IdDoc: integer; Aliastbl: string): String;
var
	List : TStringList;
  ATableReg: string;
  SQLStr: string;
  ADataset: TpFibDataset;
  Afield: string;
begin
	//DM.pFIBCampos.DisableControls;
  //DM.pFIBCampos.First;
  List := TStringList.Create;
  SQLStr := 'SELECT * FROM CAMPOS WHERE COD_CLIENTE = ' + IntToStr(IdCliente) +
            ' AND COD_DOCUMENTO = ' + IntToStr(IdDoc);
  ADataset := dm.GetNewDataSet(sqlstr);
  ADataset.first;
  while not ADataset.Eof do Begin
    AField := ADataset.FieldByName('NOM_CAMPO').AsString;
    if ((AField  <> 'AUX1')  AND (AField <> 'FECHA_APRUEBA')) THEN
      if AliasTbl = '' then
        List.Add(AField)
      else
        List.Add(Aliastbl + '.' + AField);
    ADataset.Next;
  End;
	//DM.pFIBCampos.EnableControls;
  List.Delimiter := ',';
  Result := List.DelimitedText;
  dm.FreeDataSet(ADataset);
  List.Free;
end;

// retorna toda la lista de campos delimitada por comas de  la tabla de registros excepto el id que es un campo comun
function TDM.GetFieldNames4(IdCliente: integer; IdDoc: integer; Aliastbl: string): String;
var
	List : TStringList;
  ATableReg: string;
  SQLStr: string;
  ADataset: TpFibDataset;
  Afield: string;
begin
	//DM.pFIBCampos.DisableControls;
  //DM.pFIBCampos.First;
  List := TStringList.Create;
  SQLStr := 'SELECT * FROM CAMPOS WHERE COD_CLIENTE = ' + IntToStr(IdCliente) +
            ' AND COD_DOCUMENTO = ' + IntToStr(IdDoc);
  ADataset := dm.GetNewDataSet(sqlstr);
  ADataset.first;
  while not ADataset.Eof do Begin
    AField := ADataset.FieldByName('NOM_CAMPO').AsString;
    if  (AFIELD <> 'ID') THEN      //campo comun
      if AliasTbl = '' then
        List.Add(AField)
      else
        List.Add(Aliastbl + '.' + AField);
    ADataset.Next;
  End;
	//DM.pFIBCampos.EnableControls;
  List.Delimiter := ',';
  Result := List.DelimitedText;
  dm.FreeDataSet(ADataset);
  List.Free;
end;



procedure TDM.FreeDataSet(var ADataSet: TDataset);
begin
  Try
    FreeAndNil(ADataSet);
    ADataset:= nil;
  Except
    Showmessage('no se pudo liberar el dataset');
  end;
end;

function TDM.GetNextGeneratorValue(AGenName: string): integer;
var
  SQLStr: string;
  ADataset: tpfibDataset;
begin
  SQLStr := ' SELECT GEN_ID( ' + AGenName + ', 1 ) FROM RDB$DATABASE ';
  ADataset:= dm.GetNewDataSet(sqlstr);
  result := ADataset.fieldbyName('GEN_ID').AsInteger;
  dm.FreeDataSet(Adataset);
  //
end;

function tdm.GetNewLote: Integer;
var
  SQLStr: string;
  ADataset: tpfibdataset;
begin

  SQLStr:= ' Select Case When Max(Cod_Lote) is Null then 1 When Max(Cod_Lote) is not null ' +
          ' then Max(Cod_Lote) + 1 end as MAXID from LOTES';
  ADataset:=dm.GetNewDataSet(sqlstr);
	Result := ADataset.fields[0].asInteger;
  dm.FreeDataSet(ADataset);

end;



end.

