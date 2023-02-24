from uuids import nil

type
  FileStructure* = ref object
    fileHeader*: FileHeader
    recordSection: RecordSection

  FileHeader* = ref object
    version*:  byte
    recordCount*: uint32
    dataSectionSize*: uint64

  RecordSection* = ref object
    offset: int
    records: ref seq[Record]
    
  Record* = ref object
    recordHeader*: RecordHeader
    record*: string
  
  RecordHeader* = ref object
    recordKey*: uuids.UUID
    recordSize*: uint64
    userKey*: string

proc sizeof(fileHeader: FileHeader): int =
  result += fileHeader.version.sizeof()
  result += fileHeader.recordCount.sizeof()
  result += fileHeader.dataSectionSize.sizeof()

proc newWarpFileInstance*(): FileStructure =
  var fileHeader = FileHeader(
    version: 1,
    recordCount: 0,
    dataSectionSize: 0
  )

  var recordSection = RecordSection(
    records: new seq[Record],
    offset: sizeof(fileHeader)
  )

  result = FileStructure(
    fileHeader: fileHeader,
    recordSection: recordSection
  )

# operation check
var fh: FileHeader = FileHeader(
  version: 1,
  recordCount: 0,
  dataSectionSize: 0
)
echo fh.sizeof()