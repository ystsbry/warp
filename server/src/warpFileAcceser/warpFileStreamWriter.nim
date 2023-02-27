import std/streams
from uuids import nil
import warpFileStructure

proc writeHeader*(warpFileStream: Stream, fileHeader: FileHeader) =
  warpFileStream.write(fileHeader.version)
  warpFileStream.write(fileHeader.recordCount)

proc writeRecord*(warpFileStream: Stream, fileRecord: Record) =
  var recordKey = fileRecord.recordHeader.recordKey
  warpFileStream.write(uuids.leastSigBits(recordKey))
  warpFileStream.write(uuids.mostSigBits(recordKey))
  warpFileStream.write(fileRecord.recordHeader.recordSize)
  warpFileStream.write(fileRecord.recordHeader.userKey)
  warpFileStream.write(fileRecord.record)

# operation sample
const RECORD_DATA = "record data"

var recordHeader = RecordHeader(
  recordKey: uuids.genUUID(),
  recordSize: RECORD_DATA.len(),
  userKey: "sker"
)

var record = Record(
  recordHeader: recordHeader,
  record: RECORD_DATA
)


