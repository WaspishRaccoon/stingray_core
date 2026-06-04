cmake_minimum_required(VERSION 3.14)
project(dvl_msgs_fetchcontent)

include(FetchContent)

FetchContent_Declare(
  dvl_msgs
  GIT_REPOSITORY https://github.com/paagutie/dvl_msgs.git
  GIT_TAG 555525ebc027f4ca21fdd654a6f30cecd259772f
  GIT_SUBMODULES ""
)

FetchContent_MakeAvailable(dvl_msgs)
