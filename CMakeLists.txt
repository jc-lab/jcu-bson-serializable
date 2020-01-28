cmake_minimum_required (VERSION 3.2)
project(jcu-bson-serializable LANGUAGES C CXX)

set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

set(INC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include/jcu-bson-serializable)

set(SRC_FILES
        ${CMAKE_CURRENT_SOURCE_DIR}/src/serializable.cpp
        )

set(INC_FILES
        ${INC_DIR}/serializable.h
        )

set(PLUGIN_FILES
        ${CMAKE_CURRENT_SOURCE_DIR}/src/plugins/JSONObjectMapper.cpp
        ${INC_DIR}/plugins/JSONObjectMapper.h
        )

add_library(${PROJECT_NAME} STATIC ${SRC_FILES} ${INC_FILES} ${PLUGIN_FILES})
target_include_directories(${PROJECT_NAME} PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
        )

find_package(RapidJSON)
if(RAPIDJSON_FOUND)
    set(HAS_RAPIDJSON 1)
    target_include_directories(${PROJECT_NAME} PUBLIC ${RapidJSON_INCLUDE_DIRS})
endif()

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/src/jcu-bson-serializable-config.h.in ${CMAKE_CURRENT_BINARY_DIR}/build-include/jcu-bson-serializable-config.h)
target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_BINARY_DIR}/build-include)
