cmake_minimum_required(VERSION 3.14)
project(hydrolib_soft_fetchcontent)

include(FetchContent)

FetchContent_Declare(
  hydrolib_soft
  GIT_REPOSITORY https://github.com/SeaJackal/Hydrolib-soft.git
  GIT_TAG ed3ddcb99ee95f88eb1615f958e0dc0f500530b0
  GIT_SUBMODULES ""
)

FetchContent_GetProperties(hydrolib_soft)
if(NOT hydrolib_soft_POPULATED)
  FetchContent_Populate(hydrolib_soft)
endif()

set(_hydrolib_source_dir "${hydrolib_soft_SOURCE_DIR}")
set(_hydrolib_binary_dir "${hydrolib_soft_BINARY_DIR}")

add_subdirectory(
  "${_hydrolib_source_dir}/hydrolib_bus/hydrolib_bus_application"
  "${_hydrolib_binary_dir}/hydrolib_bus_application"
)
add_subdirectory(
  "${_hydrolib_source_dir}/hydrolib_bus/hydrolib_bus_datalink"
  "${_hydrolib_binary_dir}/hydrolib_bus_datalink"
)
add_subdirectory(
  "${_hydrolib_source_dir}/hydrolib_logger"
  "${_hydrolib_binary_dir}/hydrolib_logger"
)
add_subdirectory(
  "${_hydrolib_source_dir}/hydrolib_return_codes"
  "${_hydrolib_binary_dir}/hydrolib_return_codes"
)
add_subdirectory(
  "${_hydrolib_source_dir}/hydrolib_strings"
  "${_hydrolib_binary_dir}/hydrolib_strings"
)
add_subdirectory(
  "${_hydrolib_source_dir}/hydrolib_math"
  "${_hydrolib_binary_dir}/hydrolib_math"
)
add_subdirectory(
  "${_hydrolib_source_dir}/hydrolib_concepts"
  "${_hydrolib_binary_dir}/hydrolib_concepts"
)
add_subdirectory(
  "${_hydrolib_source_dir}/hydrolib_crc"
  "${_hydrolib_binary_dir}/hydrolib_crc"
)
add_subdirectory(
  "${_hydrolib_source_dir}/deprecated/hydrolib_common"
  "${_hydrolib_binary_dir}/hydrolib_common"
)
add_subdirectory(
  "${_hydrolib_source_dir}/deprecated/hydrolib_ring_queue"
  "${_hydrolib_binary_dir}/HydrolibRingQueue"
)
