object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 315
  Top = 208
  Height = 640
  Width = 907
  object SidDatabase: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'sql_role_name=')
    DefaultTransaction = SidTransaction
    DefaultUpdateTransaction = SidTransaction
    SQLDialect = 3
    Timeout = 0
    UseRepositories = []
    WaitForRestoreConnect = 0
    Left = 768
    Top = 512
  end
  object SidTransaction: TpFIBTransaction
    DefaultDatabase = SidDatabase
    TimeoutAction = TARollback
    CSMonitorSupport.Enabled = csmeDatabaseDriven
    Left = 688
    Top = 512
  end
  object Script: TpFIBScript
    Database = SidDatabase
    Transaction = SidTransaction
    Terminator = ';'
    Left = 616
    Top = 512
  end
  object pFIBClientes: TpFIBDataSet
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted, cusDeleted, cusUninserted, cusDeletedApplied]
    UpdateSQL.Strings = (
      'UPDATE CLIENTES'
      'SET '
      '    RAZONSOCIAL = :RAZONSOCIAL,'
      '    RUC = :RUC,'
      '    TELEFONO = :TELEFONO,'
      '    FAX = :FAX,'
      '    EMAIL = :EMAIL,'
      '    CONTACTO = :CONTACTO,'
      '    DIRECCION = :DIRECCION,'
      '    COD_USUARIO = :COD_USUARIO,'
      '    FECHACARGA = :FECHACARGA'
      'WHERE'
      '    COD_CLIENTE = :OLD_COD_CLIENTE'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    CLIENTES'
      'WHERE'
      '        COD_CLIENTE = :OLD_COD_CLIENTE'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO CLIENTES('
      '    COD_CLIENTE,'
      '    RAZONSOCIAL,'
      '    RUC,'
      '    TELEFONO,'
      '    FAX,'
      '    EMAIL,'
      '    CONTACTO,'
      '    DIRECCION,'
      '    COD_USUARIO,'
      '    FECHACARGA,'
      'ESTADOCLI'
      ''
      ')'
      'VALUES('
      '    :COD_CLIENTE,'
      '    :RAZONSOCIAL,'
      '    :RUC,'
      '    :TELEFONO,'
      '    :FAX,'
      '    :EMAIL,'
      '    :CONTACTO,'
      '    :DIRECCION,'
      '    :COD_USUARIO,'
      '    :FECHACARGA,'
      '0'
      ''
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    COD_CLIENTE,'
      '    RAZONSOCIAL,'
      '    RUC,'
      '    TELEFONO,'
      '    FAX,'
      '    EMAIL,'
      '    CONTACTO,'
      '    DIRECCION,'
      '    COD_USUARIO,'
      '    FECHACARGA'
      ''
      'FROM'
      '    CLIENTES '
      'WHERE'
      '        (COD_CLIENTE = :OLD_COD_CLIENTE ) AND (ESTADOCLI <> 99)')
    SelectSQL.Strings = (
      'SELECT'
      '    COD_CLIENTE,'
      '    RAZONSOCIAL,'
      '    RUC,'
      '    TELEFONO,'
      '    FAX,'
      '    EMAIL,'
      '    CONTACTO,'
      '    DIRECCION,'
      '    COD_USUARIO,'
      '    FECHACARGA'
      'FROM'
      '    CLIENTES '
      'where'
      '   (ESTADOCLI <> 99)'
      ' ')
    AfterDelete = pFIBClientesAfterDelete
    AfterPost = pFIBClientesAfterPost
    BeforeDelete = pFIBClientesBeforeDelete
    BeforePost = pFIBClientesBeforePost
    Transaction = SidTransaction
    Database = SidDatabase
    AutoCommit = True
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 32
    poSQLINT64ToBCD = True
    object pFIBClientesCOD_CLIENTE: TFIBIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object pFIBClientesRAZONSOCIAL: TFIBStringField
      FieldName = 'RAZONSOCIAL'
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBClientesRUC: TFIBStringField
      FieldName = 'RUC'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBClientesTELEFONO: TFIBStringField
      FieldName = 'TELEFONO'
      EmptyStrToNull = True
    end
    object pFIBClientesFAX: TFIBStringField
      FieldName = 'FAX'
      EmptyStrToNull = True
    end
    object pFIBClientesEMAIL: TFIBStringField
      FieldName = 'EMAIL'
      EmptyStrToNull = True
    end
    object pFIBClientesCONTACTO: TFIBStringField
      FieldName = 'CONTACTO'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBClientesDIRECCION: TFIBStringField
      FieldName = 'DIRECCION'
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBClientesCOD_USUARIO: TFIBStringField
      FieldName = 'COD_USUARIO'
      EmptyStrToNull = True
    end
    object pFIBClientesFECHACARGA: TFIBDateTimeField
      FieldName = 'FECHACARGA'
    end
  end
  object pFIBUsuarios: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE USUARIOS'
      'SET '
      '    NOM_USUARIO = :NOM_USUARIO,'
      '    CLAVE = :CLAVE,'
      '    FECHAINGRESO = :FECHAINGRESO,'
      '    FECHAINICIO = :FECHAINICIO,'
      '    FECHATERMINO = :FECHATERMINO,'
      '    EMAIL = :EMAIL,'
      '    ULT_PERFIL = :ULT_PERFIL,'
      '    ESACTIVO = :ESACTIVO'
      ''
      'WHERE'
      '    COD_USUARIO = :OLD_COD_USUARIO'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    USUARIOS'
      'WHERE'
      '        COD_USUARIO = :OLD_COD_USUARIO'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO USUARIOS('
      '    COD_USUARIO,'
      '    NOM_USUARIO,'
      '    CLAVE,'
      '    FECHAINGRESO,'
      '    FECHAINICIO,'
      '    FECHATERMINO,'
      '    EMAIL,'
      '    ULT_PERFIL,'
      '    ESACTIVO'
      ''
      ')'
      'VALUES('
      '    :COD_USUARIO,'
      '    :NOM_USUARIO,'
      '    :CLAVE,'
      '    :FECHAINGRESO,'
      '    :FECHAINICIO,'
      '    :FECHATERMINO,'
      '    :EMAIL,'
      '    :ULT_PERFIL,'
      '    :ESACTIVO'
      ''
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    COD_USUARIO,'
      '    NOM_USUARIO,'
      '    CLAVE,'
      '    FECHAINGRESO,'
      '    FECHAINICIO,'
      '    FECHATERMINO,'
      '    EMAIL,'
      '    ULT_PERFIL,'
      '    ESACTIVO'
      ''
      'FROM'
      '    USUARIOS '
      ''
      ' WHERE '
      '        USUARIOS.COD_USUARIO = :OLD_COD_USUARIO'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    COD_USUARIO,'
      '    NOM_USUARIO,'
      '    CLAVE,'
      '    FECHAINGRESO,'
      '    FECHAINICIO,'
      '    FECHATERMINO,'
      '    EMAIL,'
      '    ULT_PERFIL,'
      '    ESACTIVO'
      ''
      ''
      'FROM'
      '    USUARIOS ')
    AfterDelete = pFIBUsuariosAfterDelete
    AfterPost = pFIBUsuariosAfterPost
    BeforeDelete = pFIBUsuariosBeforeDelete
    BeforePost = pFIBUsuariosBeforePost
    OnNewRecord = pFIBUsuariosNewRecord
    Transaction = SidTransaction
    Database = SidDatabase
    AutoCommit = True
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 400
    Top = 8
    poSQLINT64ToBCD = True
    object pFIBUsuariosCOD_USUARIO: TFIBStringField
      FieldName = 'COD_USUARIO'
      EmptyStrToNull = True
    end
    object pFIBUsuariosNOM_USUARIO: TFIBStringField
      FieldName = 'NOM_USUARIO'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBUsuariosCLAVE: TFIBStringField
      FieldName = 'CLAVE'
      Size = 40
      EmptyStrToNull = True
    end
    object pFIBUsuariosFECHAINGRESO: TFIBDateTimeField
      DefaultExpression = 'CURRENT_TIMESTAMP'
      FieldName = 'FECHAINGRESO'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
    object pFIBUsuariosFECHAINICIO: TFIBDateTimeField
      FieldName = 'FECHAINICIO'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
    object pFIBUsuariosFECHATERMINO: TFIBDateTimeField
      FieldName = 'FECHATERMINO'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
    object pFIBUsuariosEMAIL: TFIBStringField
      FieldName = 'EMAIL'
      Size = 40
      EmptyStrToNull = True
    end
    object pFIBUsuariosULT_PERFIL: TFIBIntegerField
      FieldName = 'ULT_PERFIL'
    end
    object pFIBUsuariosESACTIVO: TFIBSmallIntField
      FieldName = 'ESACTIVO'
    end
  end
  object DataClientes: TDataSource
    DataSet = pFIBClientes
    Left = 32
    Top = 48
  end
  object pFIBQuery: TpFIBQuery
    Transaction = SidTransaction
    Database = SidDatabase
    SQL.Strings = (
      
        'Select Case When Max(Cod_Cliente) is Null then 1 When Max(Cod_Cl' +
        'iente) is not null then Max(Cod_Cliente) + 1 end as MAXID from C' +
        'lientes')
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 544
    Top = 512
  end
  object pFIBTipoIndex: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TIPOINDEX'
      'SET '
      '    NOM_TIPOINDEX = :NOM_TIPOINDEX'
      'WHERE'
      '    COD_TIPOINDEX = :OLD_COD_TIPOINDEX'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TIPOINDEX'
      'WHERE'
      '        COD_TIPOINDEX = :OLD_COD_TIPOINDEX'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO TIPOINDEX('
      '    COD_TIPOINDEX,'
      '    NOM_TIPOINDEX'
      ')'
      'VALUES('
      '    :COD_TIPOINDEX,'
      '    :NOM_TIPOINDEX'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    COD_TIPOINDEX,'
      '    NOM_TIPOINDEX'
      'FROM'
      '    TIPOINDEX '
      ' WHERE '
      '        TIPOINDEX.COD_TIPOINDEX = :OLD_COD_TIPOINDEX'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    COD_TIPOINDEX,'
      '    NOM_TIPOINDEX'
      'FROM'
      '    TIPOINDEX ')
    Transaction = SidTransaction
    Database = SidDatabase
    AutoCommit = True
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 720
    Top = 8
    poSQLINT64ToBCD = True
    object pFIBTipoIndexCOD_TIPOINDEX: TFIBIntegerField
      FieldName = 'COD_TIPOINDEX'
    end
    object pFIBTipoIndexNOM_TIPOINDEX: TFIBStringField
      FieldName = 'NOM_TIPOINDEX'
      Size = 30
      EmptyStrToNull = True
    end
  end
  object DataUsuarios: TDataSource
    DataSet = pFIBUsuarios
    Left = 312
    Top = 32
  end
  object DataTipoIndex: TDataSource
    DataSet = pFIBTipoIndex
    Left = 720
    Top = 56
  end
  object DataLite: TpFIBDatabase
    DefaultTransaction = TransLite
    DefaultUpdateTransaction = TransLite
    SQLDialect = 1
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 768
    Top = 392
  end
  object TransLite: TpFIBTransaction
    DefaultDatabase = DataLite
    TimeoutAction = TARollback
    CSMonitorSupport.Enabled = csmeDatabaseDriven
    Left = 688
    Top = 392
  end
  object ScriptLite: TpFIBScript
    Database = DataLite
    Transaction = TransLite
    Terminator = ';'
    Left = 616
    Top = 392
  end
  object pFIBQueryLite: TpFIBQuery
    Transaction = TransLite
    Database = DataLite
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 840
    Top = 392
  end
  object pFIBDataSet: TpFIBDataSet
    Transaction = SidTransaction
    Database = SidDatabase
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 432
    Top = 104
  end
  object SIBfibEventAlerter1: TSIBfibEventAlerter
    Events.Strings = (
      'new_employee')
    OnEventAlert = SIBfibEventAlerter1EventAlert
    Database = SidDatabase
    AutoRegister = True
    Left = 160
    Top = 24
  end
  object mdImagenes: TJvMemoryData
    FieldDefs = <
      item
        Name = 'pathimg'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'XRes'
        DataType = ftInteger
      end
      item
        Name = 'YRes'
        DataType = ftInteger
      end
      item
        Name = 'Marked'
        DataType = ftSmallint
      end>
    Left = 480
    Top = 232
    object mdImagenespathimg: TStringField
      FieldName = 'pathimg'
    end
    object mdImagenesXRes: TIntegerField
      FieldName = 'XRes'
    end
    object mdImagenesYRes: TIntegerField
      FieldName = 'YRes'
    end
    object mdImagenesMarked: TSmallintField
      FieldName = 'Marked'
    end
  end
  object TransExtra: TpFIBTransaction
    DefaultDatabase = DatabaseExtra
    TimeoutAction = TARollback
    CSMonitorSupport.Enabled = csmeDatabaseDriven
    Left = 736
    Top = 248
  end
  object ScriptExtra: TpFIBScript
    Database = DatabaseExtra
    Transaction = TransExtra
    Terminator = ';'
    Left = 664
    Top = 248
  end
  object QueryExtra: TpFIBQuery
    Transaction = TransExtra
    Database = DatabaseExtra
    SQL.Strings = (
      
        'Select Case When Max(Cod_Cliente) is Null then 1 When Max(Cod_Cl' +
        'iente) is not null then Max(Cod_Cliente) + 1 end as MAXID from C' +
        'lientes')
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 592
    Top = 248
  end
  object DatabaseExtra: TpFIBDatabase
    DBName = 'ransagfir1:d:\data\digitalizadorprueba.fdb'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'sql_role_name=')
    DefaultTransaction = TransExtra
    DefaultUpdateTransaction = TransExtra
    SQLDialect = 3
    Timeout = 0
    UseRepositories = []
    WaitForRestoreConnect = 0
    Left = 816
    Top = 248
  end
end
