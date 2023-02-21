import fileStructure

# 受け取ったデータをファイルに書き込む
proc writeRecord*(warpFileInstance: FileStructure, key: string, value: string): bool = 
  warpFileInstance.recordSection.offset = 5
  result = true