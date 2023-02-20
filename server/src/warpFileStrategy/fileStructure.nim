import uuids

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
    key: UUID
    recordSize: int32
    recordOffset: uint64


# var w: WarpFileStructure
