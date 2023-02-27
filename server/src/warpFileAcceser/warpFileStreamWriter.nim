import std/streams
import warpFileStructure

proc writeHeader*(warpFileStream: Stream, fileHeader: FileHeader) =
  warpFileStream.write(fileHeader.version)
  warpFileStream.write(fileHeader.recordCount)

