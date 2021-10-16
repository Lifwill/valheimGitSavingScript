@echo off


REM TO BE set : ---------------------------------------------------------------------------------
rem The git repo is the url of the git repositiory that will be clone. Please enter the correct value
set gitrepo=https://github.com/Lifwill/valheim_save.git
rem the id of the game valheim. Please check the shortcut, the url contains the game id
set gameId=892970

REM TO BE CHANGED IF DIFFERENT : -------------------------------------------------------------------------
rem The folder where is the executable from valheim
set steamPath="C:\Program Files (x86)\Steam"
REM the path where the world are saved, the value %username% is automatically inserted
set worldsPath=C:\Users\%USERNAME%\AppData\LocalLow\IronGate\Valheim\worlds\

REM PREFERENCES : ---------------------------------------------------------------------------------
REM This is the prefix of the list of world that will be updated. Avoid to commit your private worlds
set sharedPrefix="shared"

REM Do not modify anything below

rem GO in the world folder to create or update git
cd "%worldsPath%"

echo "Check if the git repository exist"
if exist .git\ (
    echo "It exists, update worlds"
    git pull origin master
) else (
    echo "It does not exist, init repo and get worlds"
    git init
    git remote add origin %gitrepo%
    git fetch
    git reset origin master 
    git checkout -t origin/master
)

rem Start valheim using steam, if there is another way of starting valheim, update the following lines
cd %steamPath%
start steam steam://rungameid/%gameId%

rem wait 30 seconds to ensure that Valheim have started
timeout 30

:testValheim

rem wait 5 seconds before testing again
timeout 5

echo "test if valheim is running"
set EXE=valheim.exe
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF %%x == %EXE% (
  goto testValheim
)

echo "valheim is not running anymore, update world"

cd "%worldsPath%"

git add %sharedPrefix%*
git commit -m "Upadte world"
git push

rem uncomment following line for debugging purpose
rem pause