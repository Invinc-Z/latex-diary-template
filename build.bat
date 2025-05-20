@echo off
setlocal enabledelayedexpansion

:: 检查xelatex是否可用
where xelatex >nul 2>&1
if %errorlevel% neq 0 (
    echo error：Can not find xelatex, please ensure that the TeX system is installed and added to the PATH.
    pause
    exit /b 1
)

:: 遍历当前目录中的所有.tex文件
for %%f in (*.tex) do (
    echo Compiling %%f...
    xelatex -interaction=nonstopmode -synctex=1 "%%f"
    xelatex -interaction=nonstopmode -synctex=1 "%%f"
)
echo Cleaning auxiliary files...
del /s /q "*.aux" "*.log" "*.out" "*.bbl" "*.blg" "*.toc" "*.lof" "*.lot" "*.synctex.gz"
echo Auxiliary files cleaning completed!
echo All files compiled successfully!
pause

