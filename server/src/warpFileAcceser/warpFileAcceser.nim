import warpFileStructure
import std/streams, os

const FILE_PATH = "db.warp"

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

  var warpFileStream: FileStream
  if fileExists(FILE_PATH):
    warpFileStream = openFileStream(FILE_PATH, FileMode.fmWrite)
  else:
    warpFileStream = newFileStream(FILE_PATH, FileMode.fmWrite)
    # 新しくファイルを作った場合はヘッダーの書き込み
    warpFileStream.write(fileHeader.version)
    warpFileStream.write(fileHeader.recordCount)
    warpFileStream.write(recordSection.offset)

  defer: warpFileStream.close()
  result = WarpFileAcceser()

# operation sample
discard newWarpFileAcceser()