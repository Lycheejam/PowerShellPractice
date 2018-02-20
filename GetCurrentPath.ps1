write "***実行時の位置(パス)を取得するプログラム***`r`n"

# 自身のファイルパスを取得
$thisPath = $MyInvocation.MyCommand.Path
write " > 実行ファイルのフルパス:$thisPath" 

# 自身のファイルパスからカレントディレクトリのみを取得
$thisPath = Split-Path $thisPath -Parent
write " > 実行ファイルのカレントディレクトリ:$thisPath"
