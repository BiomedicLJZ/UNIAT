cmake_minimum_required(VERSION 3.0.0)
cmake_policy(SET CMP0111 NEW)

project(test VERSION 0.1.0)

find_package(Box2D REQUIRED)

add_executable(test test.cpp
        ../intro/main.cpp)

include_directories("C:/Program Files (x86)/Microsoft DirectX SDK (June 2010)/Include")

target_link_libraries(test box2d::box2d)
