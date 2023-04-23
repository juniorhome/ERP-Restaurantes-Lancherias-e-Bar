object DMCliente: TDMCliente
  OldCreateOrder = False
  Height = 159
  Width = 413
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
    DataBase = RESTDWIdDatabase1
    CacheUpdateRecords = True
    AutoCommitData = False
    AutoRefreshAfterCommit = False
    ThreadRequest = False
    RaiseErrors = True
    ReflectChanges = False
    Left = 64
    Top = 32
  end
  object RESTDWClientEvents1: TRESTDWClientEvents
    CriptOptions.Use = False
    CriptOptions.Key = 'RDWBASEKEY256'
    RESTClientPooler = RESTDWIdClientPooler1
    Events = <>
    Left = 328
    Top = 8
  end
  object RESTDWIdClientPooler1: TRESTDWIdClientPooler
    DataCompression = True
    Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    ContentEncoding = 'gzip, identity'
    ContentType = 'application/x-www-form-urlencoded'
    Charset = 'utf8'
    Encoding = esUtf8
    EncodedStrings = True
    ThreadRequest = False
    Host = 'localhost'
    AuthenticationOptions.AuthorizationOption = rdwAONone
    RequestTimeOut = 10000
    ConnectTimeOut = 3000
    AllowCookies = False
    RedirectMaximum = 0
    HandleRedirects = False
    ProxyOptions.ProxyPort = 0
    FailOver = False
    UseSSL = False
    FailOverConnections = <>
    FailOverReplaceDefaults = False
    BinaryRequest = False
    CriptOptions.Use = False
    CriptOptions.Key = 'RDWBASEKEY256'
    UserAgent = 
      'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, l' +
      'ike Gecko) Chrome/41.0.2227.0 Safari/537.36'
    PoolerNotFoundMessage = 'Pooler not found'
    SSLVersions = []
    SSLMode = sslmUnassigned
    Left = 184
    Top = 24
  end
  object RESTDWIdDatabase1: TRESTDWIdDatabase
    Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    ContentType = 'application/x-www-form-urlencoded'
    Charset = 'utf8'
    ContentEncoding = 'gzip, identity'
    Active = False
    Compression = True
    CriptOptions.Use = False
    CriptOptions.Key = 'RDWBASEKEY256'
    MyIP = '0.0.0.0'
    IgnoreEchoPooler = False
    AuthenticationOptions.AuthorizationOption = rdwAONone
    Proxy = False
    ProxyOptions.Port = 8888
    PoolerService = '127.0.0.1'
    PoolerPort = 8082
    PoolerName = 'FrmPrincipal.RESTDWServicePooler1'
    StateConnection.AutoCheck = False
    StateConnection.InTime = 1000
    RequestTimeOut = 10000
    ConnectTimeOut = 3000
    EncodedStrings = True
    Encoding = esUtf8
    StrsTrim = False
    StrsEmpty2Null = False
    StrsTrim2Len = True
    PoolerNotFoundMessage = 'Pooler not found'
    HandleRedirects = False
    RedirectMaximum = 0
    ParamCreate = True
    FailOver = False
    FailOverConnections = <>
    FailOverReplaceDefaults = False
    ClientConnectionDefs.Active = False
    UseSSL = False
    SSLVersions = []
    UserAgent = 
      'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, l' +
      'ike Gecko) Chrome/41.0.2227.0 Safari/537.36'
    SSLMode = sslmUnassigned
    Left = 32
    Top = 96
  end
end
