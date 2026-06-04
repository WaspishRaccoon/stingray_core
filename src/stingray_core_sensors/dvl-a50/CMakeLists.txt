cmake_minimum_required(VERSION 3.14)
project(dvl_a50_fetchcontent)

include(FetchContent)

FetchContent_Declare(
  dvl_a50
  GIT_REPOSITORY https://github.com/paagutie/dvl-a50.git
  GIT_TAG 2eed27e6c19674a2598b77d057f88d8ff03346ed
  GIT_SUBMODULES ""
)

FetchContent_GetProperties(dvl_a50)
if(NOT dvl_a50_POPULATED)
  FetchContent_Populate(dvl_a50)
endif()

FetchContent_Declare(
  dvl_a50_json
  GIT_REPOSITORY https://github.com/nlohmann/json.git
  GIT_TAG 760304635dc74a5bf77903ad92446a6febb85acf
  SOURCE_DIR "${dvl_a50_SOURCE_DIR}/include/dvl_a50/json"
)

FetchContent_MakeAvailable(dvl_a50_json)

add_subdirectory("${dvl_a50_SOURCE_DIR}" "${dvl_a50_BINARY_DIR}")
