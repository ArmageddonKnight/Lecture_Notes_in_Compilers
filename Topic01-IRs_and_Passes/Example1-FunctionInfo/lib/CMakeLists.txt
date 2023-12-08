add_library(FunctionInfo SHARED FunctionInfo.cpp)
target_include_directories(FunctionInfo PUBLIC ${GCC_PLUGIN_DIR}/include)
