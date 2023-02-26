import warpFileStructure
import std/streams

type
  WarpFileAcceser* = ref object

proc newWarpFileAcceser*(): WarpFileAcceser =
  var fileHeader = FileHeader(
    version: 1,
    recordCount: 0
  )

  var recordSection = RecordSection(
    offset: sizeof(fileHeader),
    records: new seq[Record]
  )

  var warpFileStream = newFileStream("../../../db.warp", FileMode.fmWrite)
  defer: warpFileStream.close()

  warpFileStream.write(fileHeader.version)
  warpFileStream.write(fileHeader.recordCount)
  warpFileStream.write(recordSection.offset)

  result = WarpFileAcceser()