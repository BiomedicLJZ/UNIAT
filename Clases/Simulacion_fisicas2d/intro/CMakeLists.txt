cmake_minimum_required(VERSION 3.26)
project(intro)

find_package(box2d CONFIG REQUIRED)

set(CMAKE_CXX_STANDARD 17)

add_executable(intro main.cpp)

include_directories(D:/Documentos/UNIAT/packages/include)
include_directories("C:/Program Files (x86)/Microsoft DirectX SDK (June 2010)/Include")

target_link_libraries(intro box2d::box2d)
