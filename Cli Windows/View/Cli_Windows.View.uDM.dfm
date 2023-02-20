object DMCliente: TDMCliente
  OldCreateOrder = False
  Height = 159
  Width = 381
  object RESTDWDataBase1: TRESTDWDataBase
    Active = False
    Compression = True
    CriptOptions.Use = False
    CriptOptions.Key = 'RDWBASEKEY256'
    AuthenticationOptions.AuthorizationOption = rdwAONone
    Proxy = False
    ProxyOptions.Port = 8888
    PoolerService = '127.0.0.1'
    PoolerPort = 8082
    StateConnection.AutoCheck = False
    StateConnection.InTime = 1000
    RequestTimeOut = 10000
    ConnectTimeOut = 3000
    EncodeStrings = True
    Encoding = esUtf8
    StrsTrim = False
    StrsEmpty2Null = False
    StrsTrim2Len = True
    HandleRedirects = False
    RedirectMaximum = 0
    ParamCreate = True
    FailOver = False
    FailOverConnections = <>
    FailOverReplaceDefaults = False
    ClientConnectionDefs.Active = False
    UserAgent = 
      'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, l' +
      'ike Gecko) Chrome/41.0.2227.0 Safari/537.36'
    Left = 40
    Top = 32
  end
  object RESTDWClientSQL1: TRESTDWClientSQL
    Active = False
    Filtered = False
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    BinaryCompatibleMode = False
    MasterCascadeDelete = True
    BinaryRequest = False
    Datapacks = -1
    DataCache = False
    MassiveType = mtMassiveCache
    Params = <>
    DataBase = RESTDWDataBase1
    CacheUpdateRecords = True
    AutoCommitData = False
    AutoRefreshAfterCommit = False
    ThreadRequest = False
    RaiseErrors = True
    ActionCursor = crSQLWait
    ReflectChanges = False
    Left = 152
    Top = 32
  end
  object DWClientEvents1: TDWClientEvents
    CriptOptions.Use = False
    CriptOptions.Key = 'RDWBASEKEY256'
    RESTClientPooler = RESTClientPooler1
    Events = <>
    Left = 256
    Top = 32
  end
  object RESTClientPooler1: TRESTClientPooler
    DataCompression = True
    Encoding = esUtf8
    hEncodeStrings = True
    ThreadRequest = False
    Host = 'localhost'
    AuthenticationOptions.AuthorizationOption = rdwAONone
    ProxyOptions.BasicAuthentication = False
    ProxyOptions.ProxyPort = 0
    RequestTimeOut = 10000
    ConnectTimeOut = 3000
    AllowCookies = False
    RedirectMaximum = 0
    HandleRedirects = False
    FailOver = False
    FailOverConnections = <>
    FailOverReplaceDefaults = False
    BinaryRequest = False
    CriptOptions.Use = False
    CriptOptions.Key = 'RDWBASEKEY256'
    UserAgent = 
      'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, l' +
      'ike Gecko) Chrome/41.0.2227.0 Safari/537.36'
    Left = 264
    Top = 96
  end
end
