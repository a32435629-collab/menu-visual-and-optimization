@echo off
chcp 65001 > nul
echo ========================================
echo   Сборка Menu Visual and Optimization
echo ========================================

if not exist dist mkdir dist
echo Склейка файлов...
type nul > dist\launcher.lua

type main.lua >> dist\launcher.lua
echo. >> dist\launcher.lua
type menu.lua >> dist\launcher.lua
echo. >> dist\launcher.lua

:: Загрузчики из папки src
type src\start_render.lua >> dist\launcher.lua
echo. >> dist\launcher.lua
type src\start_graphics.lua >> dist\launcher.lua
echo. >> dist\launcher.lua
type src\start_visual.lua >> dist\launcher.lua

echo.
echo ========================================
echo УСПЕХ! Файл собран: dist\launcher.lua
echo ========================================
pause