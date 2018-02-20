write "***実行フォルダ以下のzipファイルを全解凍するプログラム***`r`n"

# 自身のファイルパスを取得
$thisPath = $MyInvocation.MyCommand.Path
#write " > 実行ファイルのフルパス:$thisPath" 

# 自身のファイルパスからカレントディレクトリのみを取得
$thisPath = Split-Path $thisPath -Parent
#write " > 実行ファイルのカレントディレクトリ:$thisPath"

# シェルオブジェクト生成
# (ExplorerのComオブジェクトを生成?)
$sh = New-Object -ComObject shell.application


# カレントディレクトリ以下のフルパスを一括取得
# 一括と言っても再帰呼び出しを内部でしてる？
# Get-ChildItem -include *.zip -Recurse -Force | select-object fullname
Get-ChildItem -include *.zip -Recurse -Force |
                        select-object fullname |
                        ForEach-Object -Process{
                          # 解凍先フォルダ
                          $targetfolder = $sh.NameSpace((Split-Path $_.FullName -Parent))
                          write $targetfolder
                          # 解凍対象のzipファイル
                          $zipFile = $sh.NameSpace($_.FullName)
                          write $zipFile
                          # zipファイルの中身を1つずつコピー（解凍？）する
                          $targetfolder.CopyHere($zipFile.items())
                        }-End{$_}
