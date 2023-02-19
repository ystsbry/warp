import docopt
import warppkg/main
import ../util/debug

# get nimble's values
include nimble_config
include ../warp.nimble

let doc = """
warp.

Usage:
  warp [--sample=<sample>] <name>
  warp (-h | --help)
  warp (-v | --version)

Options:
  --sample=<sample>  sample option[default: abcdefg].
  -h --help          Show this screen.
  -v --version       Show version.
"""

proc start(): int =
  let args = docopt(doc, version = "warp " & version)
  debug args
  result = main(args)

# 引数チェック
when isMainModule:
  quit(start())
