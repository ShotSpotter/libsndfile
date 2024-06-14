if not exist vcpkg git submodule add https://github.com/Microsoft/vcpkg
git submodule update --remote --recursive

mkdir CMakeBuild

cd CMakeBuild


cmake .. ^
-DCMAKE_TOOLCHAIN_FILE="../vcpkg/scripts/buildsystems/vcpkg.cmake" ^
-DENABLE_EXTERNAL_LIBS=ON ^
-DBUILD_SHARED_LIBS=ON ^
-DCMAKE_BUILD_TYPE=RELEASE ^
-DBUILD_TESTING=ON

REM it is not enough to specify CMAKE_BUILD_TYPE at the configure step;
REM you must also tell the compiler to build the Release version
REM https://stackoverflow.com/questions/19024259/how-to-change-the-build-type-to-release-mode-in-cmake
cmake --build . --config Release

cd ..
