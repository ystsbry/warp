import std/streams, os
import warpFileStructure, warpFileStreamWriter

const FILE_PATH = "db.warp"

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
discard newWarpFileAcceser()