write "***���s���̈ʒu(�p�X)���擾����v���O����***`r`n"

# ���g�̃t�@�C���p�X���擾
$thisPath = $MyInvocation.MyCommand.Path
write " > ���s�t�@�C���̃t���p�X:$thisPath" 

# ���g�̃t�@�C���p�X����J�����g�f�B���N�g���݂̂��擾
$thisPath = Split-Path $thisPath -Parent
write " > ���s�t�@�C���̃J�����g�f�B���N�g��:$thisPath"
