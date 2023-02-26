import warpFileAcceser

# 受け取ったデータをファイルに書き込む
proc writeRecord*(warpFileInstance: WarpFileAcceser, key: string, value: string): bool = 
  result = true