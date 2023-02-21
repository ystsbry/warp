from uuids import nil

type
  FileStructure* = ref object
    fileHeader*: FileHeader
    recordSection: RecordSection

  FileHeader* = ref object
    version*:  byte
    recordCount*: int32
    dataSectionSize*: uint64

  RecordSection* = ref object
    records: seq[Record]
    offset: uint16
    
  Record* = ref object
    recordHeader*: RecordHeader
    record*: string
  
  RecordHeader* = ref object
    recordKey*: uuids.UUID
    recordSize*: uint64
    userKey*: string

proc newWarpFileInstance*(): FileStructure =
  var fileHeader = FileHeader(
    version: 1,
    recordCount: 0,
    dataSectionSize: 0
  )

  var recordSection = RecordSection(offset: 13)

  result = FileStructure(
    fileHeader: fileHeader,
    recordSection: recordSection
  )
