@echo off
chcp 65001 >nul
echo ========================================
echo     OpenVape 构建脚本
echo ========================================
echo.

echo [1/4] 加载 Visual Studio 2026 环境...
call "C:\Program Files\Microsoft Visual Studio\18\Insiders\VC\Auxiliary\Build\vcvarsall.bat" x64
if errorlevel 1 (
    echo [错误] Visual Studio 环境加载失败！
    pause
    exit /b 1
)
echo [完成] Visual Studio 环境已加载
echo.

echo [2/4] 设置 CMake 生成器...
set CMAKE_GENERATOR=Visual Studio 17 2022
set CMAKE_GENERATOR_PLATFORM=x64
echo [完成] 生成器: Visual Studio 17 2022 (x64)
echo.

echo [3/4] 设置 CMake 路径...
set PATH=C:\Program Files\Microsoft Visual Studio\18\Insiders\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin;%PATH%
echo [完成] CMake 路径已设置
echo.

echo [4/4] 开始构建项目...
echo.
echo ========================================
echo     正在构建，请稍候...
echo ========================================
echo.

call gradlew.bat clean buildNative --rerun-tasks

if errorlevel 1 (
    echo.
    echo ========================================
    echo     构建失败！
    echo ========================================
    echo.
    pause
    exit /b 1
) else (
    echo.
    echo ========================================
    echo     构建成功！
    echo ========================================
    echo.
    pause
)