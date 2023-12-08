cmake_minimum_required(VERSION 3.18.4)
project(FunctionInfo)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

execute_process(
  COMMAND gcc --print-file-name=plugin
  OUTPUT_VARIABLE GCC_PLUGIN_DIR
  OUTPUT_STRIP_TRAILING_WHITESPACE)

add_subdirectory(lib)
