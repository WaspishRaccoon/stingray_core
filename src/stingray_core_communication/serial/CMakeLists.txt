cmake_minimum_required(VERSION 3.14)
project(serial_fetchcontent)

include(FetchContent)

FetchContent_Declare(
  serial
  GIT_REPOSITORY https://github.com/jinmenglei/serial.git
  GIT_TAG def526d378501e0d19d0a8724971688a3b174080
  GIT_SUBMODULES ""
)

FetchContent_MakeAvailable(serial)
