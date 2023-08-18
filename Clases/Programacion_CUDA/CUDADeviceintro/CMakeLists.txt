cmake_minimum_required(VERSION 3.26)
project(CUDADeviceintro CUDA)

set(CMAKE_CUDA_STANDARD 17)

add_executable(CUDADeviceintro main.cu)

set_target_properties(CUDADeviceintro PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)
