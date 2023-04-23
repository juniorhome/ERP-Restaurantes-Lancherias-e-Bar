object DMServidor: TDMServidor
  OldCreateOrder = False
  Encoding = esUtf8
  QueuedRequest = False
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
  object cdsImagem: TClientDataSet
    PersistDataPacket.Data = {
      3C0000009619E0BD0100000018000000010000000000030000003C0004464F54
      4F04004B0000000100075355425459504502004900070042696E617279000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 392
    Top = 72
    object cdsImagemFOTO: TBlobField
      FieldName = 'FOTO'
    end
  end
  object RESTDWServerEvents: TRESTDWServerEvents
    IgnoreInvalidParams = False
    Events = <
      item
        Routes = [crAll, crGet]
        NeedAuthorization = True
        Params = <
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'caminhoFoto'
            Encoded = True
          end>
        DataMode = dmDataware
        Name = 'getFoto'
        EventName = 'getFoto'
        BaseURL = '/'
        DefaultContentType = 'application/json'
        CallbackEvent = False
        OnlyPreDefinedParams = False
      end>
    Left = 296
    Top = 120
  end
end
