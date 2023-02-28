import std/streams, os
from uuids import nil
import warpFileStructure, warpFileStreamWriter, warpFilePath

type
  WarpFileAcceser* = FileStream

proc newWarpFileAcceser*(): WarpFileAcceser =
  var fileHeader = FileHeader(
    version: 1,
    recordCount: 0
  )

  var warpFileStream: FileStream
  if fileExists(FILE_PATH):
    warpFileStream = openFileStream(FILE_PATH, FileMode.fmWrite)
  else:
    warpFileStream = newFileStream(FILE_PATH, FileMode.fmWrite)
    warpFileStream.writeHeader(fileHeader)

  defer: warpFileStream.close()
  result = warpFileStream

# operation sample
const RECORD_DATA = "record data"

discard newWarpFileAcceser()
var warpFileStream = openFileStream(FILE_PATH, FileMode.fmWrite)

var recordHeader = RecordHeader(
  recordKey: uuids.genUUID(),
  recordSize: RECORD_DATA.len(),
  userKey: "sker"
)

var record = Record(
  recordHeader: recordHeader,
  record: RECORD_DATA
)

warpFileStream.writeRecord(record)