write "***���s�t�H���_�ȉ���zip�t�@�C����S�𓀂���v���O����***`r`n"

# ���g�̃t�@�C���p�X���擾
$thisPath = $MyInvocation.MyCommand.Path
#write " > ���s�t�@�C���̃t���p�X:$thisPath" 

# ���g�̃t�@�C���p�X����J�����g�f�B���N�g���݂̂��擾
$thisPath = Split-Path $thisPath -Parent
#write " > ���s�t�@�C���̃J�����g�f�B���N�g��:$thisPath"

# �V�F���I�u�W�F�N�g����
# (Explorer��Com�I�u�W�F�N�g�𐶐�?)
$sh = New-Object -ComObject shell.application


# �J�����g�f�B���N�g���ȉ��̃t���p�X���ꊇ�擾
# �ꊇ�ƌ����Ă��ċA�Ăяo��������ł��Ă�H
# Get-ChildItem -include *.zip -Recurse -Force | select-object fullname
Get-ChildItem -include *.zip -Recurse -Force |
                        select-object fullname |
                        ForEach-Object -Process{
                          # �𓀐�t�H���_
                          $targetfolder = $sh.NameSpace((Split-Path $_.FullName -Parent))
                          write $targetfolder
                          # �𓀑Ώۂ�zip�t�@�C��
                          $zipFile = $sh.NameSpace($_.FullName)
                          write $zipFile
                          # zip�t�@�C���̒��g��1���R�s�[�i�𓀁H�j����
                          $targetfolder.CopyHere($zipFile.items())
                        }-End{$_}
