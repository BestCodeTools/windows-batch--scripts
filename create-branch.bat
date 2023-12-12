@echo off


set source_branch=%1
set new_branch=%2

if "%source_branch%"=="" goto ask_source_branch
if "%new_branch%"=="" goto ask_new_branch
goto execute

:ask_source_branch
echo Branches:
echo 1 - master
echo 2 - hml
echo 3 - qa
echo 4 - dev
echo 5 - per
echo Or type the branch name or tag
echo Or type 0 to Exit

set /p source_branch="Source branch: "

if %source_branch% == 0 goto end
if %source_branch% == 1 set source_branch=master
if %source_branch% == 2 set source_branch=hml
if %source_branch% == 3 set source_branch=qa
if %source_branch% == 4 set source_branch=dev
if %source_branch% == 5 set source_branch=per

if "%new_branch%"=="" goto ask_new_branch
goto execute
:ask_new_branch

set /p new_branch="New branch (i.e: feature/XXXX): "

if "%new_branch%"=="" goto ask_new_branch
if "%new_branch%"=="0" goto end
:execute
git branch -D %source_branch%  || echo Branch %source_branch% not found
git fetch | echo Fetching...
git checkout %source_branch% | echo Checking out %source_branch%...
git pull origin %source_branch% | echo Pulling %source_branch%...
git checkout -B %new_branch% | echo Creating %new_branch%...
if "%ERROR_LEVEL%"=="0". echo Branch %new_branch% created

rem check if tortoisegit is installed and ask if user wants to open log
set tortoisegitproc=
for /f "tokens=*" %%a in ('where tortoisegitproc.exe') do set tortoisegitproc=%%a
if "%tortoisegitproc%"=="" goto end

echo "Open TortoiseGit Log for "%CD%"?
echo 1 = Yes
set /p OPEN_TGLOG=
if %OPEN_TGLOG% == 1 tortoisegitproc /command:log /path:"%CD%"

echo "Push changes to remote?"
echo 1 = Yes
set /p DO_PUSH=
if %DO_PUSH% == 1 git push origin %new_branch% --no-verify

:end