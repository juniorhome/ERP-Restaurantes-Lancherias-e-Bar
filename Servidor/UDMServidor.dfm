object DMServidor: TDMServidor
  OldCreateOrder = False
  Encoding = esUtf8
  Height = 306
  Width = 456
  object RESTDWPoolerDB1: TRESTDWPoolerDB
    Compression = True
    Encoding = esUtf8
    StrsTrim = False
    StrsEmpty2Null = False
    StrsTrim2Len = True
    Active = True
    PoolerOffMessage = 'RESTPooler not active.'
    ParamCreate = True
    Left = 48
    Top = 96
  end
  object RESTDWDriverZeos1: TRESTDWDriverZeos
    CommitRecords = 100
    Left = 352
    Top = 16
  end
  object RESTDWDriverFD1: TRESTDWDriverFD
    CommitRecords = 100
    Left = 392
    Top = 16
  end
  object DWServerEvents1: TDWServerEvents
    IgnoreInvalidParams = False
    Events = <>
    Left = 144
    Top = 96
  end
end
