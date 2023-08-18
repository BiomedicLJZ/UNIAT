#include <iostream>
#include <cuda.h>

using namespace std;

int main(){
    // Print the number of devices
    int deviceCount;
    cudaGetDeviceCount(&deviceCount);
    std::cout << "Device count: " << deviceCount << std::endl;
    // Print the device properties
    cudaDeviceProp deviceProp;
    cudaGetDeviceProperties(&deviceProp, 0);
    // Print all the properties
    printf("Device name: %s\n", deviceProp.name);
    printf("Total global memory: %ld\n", deviceProp.totalGlobalMem);
    printf("Shared memory per block: %ld\n", deviceProp.sharedMemPerBlock);
    printf("Registers per block: %d\n", deviceProp.regsPerBlock);
    printf("Warp size: %d\n", deviceProp.warpSize);
    printf("Memory pitch: %ld\n", deviceProp.memPitch);
    printf("Max threads per block: %d\n", deviceProp.maxThreadsPerBlock);
    printf("Max threads dimensions: (%d, %d, %d)\n", deviceProp.maxThreadsDim[0], deviceProp.maxThreadsDim[1], deviceProp.maxThreadsDim[2]);
    printf("Max grid dimensions: (%d, %d, %d)\n", deviceProp.maxGridSize[0], deviceProp.maxGridSize[1], deviceProp.maxGridSize[2]);
    printf("Clock rate: %d\n", deviceProp.clockRate);
    printf("Total constant memory: %ld\n", deviceProp.totalConstMem);
    printf("Compute capability: %d.%d\n", deviceProp.major, deviceProp.minor);
    printf("Texture alignment: %ld\n", deviceProp.textureAlignment);
    printf("Device overlap: %d\n", deviceProp.deviceOverlap);
    printf("Multiprocessor count: %d\n", deviceProp.multiProcessorCount);
    return 0;
}
