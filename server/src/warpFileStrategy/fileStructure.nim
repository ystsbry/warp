from uuids import nil

type
  FileStructure* = ref object
    fileHeader: FileHeader
    recordSection: RecordSection

  FileHeader* = ref object
    version:  byte
    recordCount: int32
    dataSectionSize: uint64

  RecordSection* = ref object
    records: seq[Record]
    
  Record* = ref object
    recordHeader: RecordHeader
    record: seq[int32]
  
  RecordHeader* = ref object
    recordKey: uuids.UUID
    recordSize: int32
    recordOffset: uint64

proc newWarpFileStructure*(): FileStructure =
  var fileHeader = FileHeader(
    version: 1,
    recordCount: 0,
    dataSectionSize: 0
  )

  var recordSection = RecordSection()

  result = FileStructure(
    fileHeader: fileHeader,
    recordSection: recordSection
  )
