unset(_RAPIDJSON_SEARCH_ROOT_INC)
unset(_RAPIDJSON_SEARCH_ROOT_LIB)

# Search RAPIDJSON_ROOT first if it is set.
set(RAPIDJSON_ROOT ${CMAKE_SOURCE_DIR}/rapidjson/include)

if(RAPIDJSON_ROOT)
    set(_RAPIDJSON_SEARCH_ROOT_INC PATHS ${RAPIDJSON_ROOT} ${RAPIDJSON_ROOT}/include NO_DEFAULT_PATH)
endif()

# Try each search configuration.
find_path(RapidJSON_INCLUDE_DIRS    NAMES rapidjson/document.h  ${_RAPIDJSON_SEARCH_ROOT_INC})

mark_as_advanced(RapidJSON_INCLUDE_DIRS)

# handle the QUIETLY and REQUIRED arguments and set RAPIDJSON_FOUND to TRUE if
# all listed variables are TRUE
include("FindPackageHandleStandardArgs")
FIND_PACKAGE_HANDLE_STANDARD_ARGS(RapidJSON
        REQUIRED_VARS RapidJSON_INCLUDE_DIRS
        FOUND_VAR RapidJSON_FOUND
        )

if(RapidJSON_FOUND)
    set(RAPIDJSON_FOUND ${RapidJSON_FOUND})
endif()