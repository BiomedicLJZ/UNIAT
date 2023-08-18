# Llamados al Kernel en CUDA C

## ¿Qué es un kernel?

En computación, Un Kernel es el núcleo de un Sistema operativo, el cual se encarga de administrar los recursos de la computadora y proveer servicios a los programas de computación. Este se encarga de la gestión de la memoria, procesos, dispositivos de entrada y salida, entre otros.

En `CUDA C`, un Kernel es una función que se ejecuta en la GPU. En este caso, el Kernel se encarga de la ejecución de un conjunto de hilos en la GPU. Para llamar a un Kernel en CUDA C, se utiliza la siguiente sintaxis:

```c
kernel<<<dimGrid, dimBlock>>>(parametros);
```

En esta sintaxis tenemos 3 elementos importantes:

- **kernel**: Es el nombre de la función que se ejecutará en la GPU
- **dimGrid**: Es la dimensión del Grid que se utilizará para la ejecución del Kernel, El grid se refiere a la cantidad de bloques que se utilizarán para la ejecución del Kernel.
- **dimBlock**: Es la dimensión del bloque que se utilizará para la ejecución del Kernel, El bloque se refiere a la cantidad de hilos que se utilizarán para la ejecución del Kernel.

La diferencia entre un bloque y un grid es que un grid es un conjunto de bloques y un bloque es un conjunto de hilos. En la siguiente imagen se puede ver la diferencia entre un grid y un bloque:

![Blocks](../Imagenes/CUDA/kernel-execution-on-gpu-1-625x438.png)

Estén atentos a que en CUDA C a diferencia de C o C++ standard se hace uso de los <<<>>> para dar los tamaños de grid y de block al kernel y este pueda encargarse de la gestión de recursos de la GPU

## ¿Cómo se ejecuta un kernel?

Un concepto importante que se tiene que tener en cuenta desde el inicio del trabajo con GPU es que las memorias de la GPU y de la CPU son independientes. Esto quiere decir que la memoria de la GPU no es accesible desde la CPU y viceversa. Por lo tanto, para poder ejecutar un kernel en la GPU, primero se debe copiar los datos de la CPU a la GPU, luego se ejecuta el kernel en la GPU y por último se copian los datos de la GPU a la CPU.

![Kernel](../Imagenes/CUDA/pipeline.png)

Entonces aquí podemos ver como los datos se copian de la CPU a la GPU y luego de la GPU a la CPU. Esto se hace para que el kernel pueda acceder a los datos que se encuentran en la GPU y pueda realizar los cálculos necesarios.

# Paso de parámetros a un kernel

Cuando nosotros estamos trabajando es muy importante que todas nuestras funciones sean lo más genéricas posibles. Esto quiere decir que nuestras funciones deben ser capaces de trabajar con cualquier tipo de dato. Para lograr esto, es necesario que las funciones reciban los datos que van a procesar como parámetros. En CUDA C, los kernels reciben los parámetros de la siguiente manera:

```c
__global__ void kernel(int *a, int *b, int *c, int n)
{
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    if (i < n)
        c[i] = a[i] + b[i];
}
```

En este ejemplo, el kernel recibe 4 parámetros:

- **a**: Es un puntero a un arreglo de enteros.
- **b**: Es un puntero a un arreglo de enteros.
- **c**: Es un puntero a un arreglo de enteros.
- **n**: Es un entero que indica el tamaño de los arreglos.

Cuando nosotros especificamos que un kernel recibe un parámetro, este parámetro se copia a la GPU. Por lo tanto, si nosotros queremos pasar un arreglo a un kernel, primero debemos copiar el arreglo a la GPU y luego llamar al kernel con el arreglo que se encuentra en la GPU.

```c
int main(){
    a = (int *)malloc(sizeof(int) * n);
    b = (int *)malloc(sizeof(int) * n);
    c = (int *)malloc(sizeof(int) * n);
    cudaMalloc(&d_a, sizeof(int) * n);
    cudaMalloc(&d_b, sizeof(int) * n);
    cudaMalloc(&d_c, sizeof(int) * n);
    cudaMemcpy(d_a, a, sizeof(int) * n, cudaMemcpyHostToDevice);
    cudaMemcpy(d_b, b, sizeof(int) * n, cudaMemcpyHostToDevice);
    kernel<<<1, n>>>(d_a, d_b, d_c, n);
    cudaMemcpy(c, d_c, sizeof(int) * n, cudaMemcpyDeviceToHost);
    return 0;
}
```

donde:

- **a, b, c**: Son los arreglos que se encuentran en la CPU y son alocados por medio de la función `malloc`.
- **d_a, d_b, d_c**: Son los arreglos que se encuentran en la GPU y son alocados por medio de la función `cudaMalloc`.
- **n**: Es el tamaño de los arreglos.
- **cudaMemcpyHostToDevice**: Es el tipo de copia que se realizará. En este caso, se copiarán los datos de la memoria de la CPU a la memoria de la GPU.
- **cudaMemcpyDeviceToHost**: Es el tipo de copia que se realizará. En este caso, se copiarán los datos de la memoria de la GPU a la memoria de la CPU una vez que el kernel haya terminado de ejecutarse.
- **kernel<<<1, n>>>**: Es la llamada al kernel. En este caso, el kernel se ejecutará con un grid de 1 bloque y cada bloque tendrá n hilos.

Ustedes pueden ver aquí que las variables que corresponden a GPU no están inicializadas. Esto es porque la memoria de la GPU no es accesible desde la CPU. Por lo tanto, no podemos inicializar las variables de la GPU desde la CPU.

## ¿Cómo se inicializan las variables de la GPU?

Las variables que corresponden a la memoria de la GPU son `independientes` de las variables que corresponden a la memoria de la CPU. Por lo tanto, para inicializar las variables de la GPU, debemos utilizar un kernel. En este caso, el kernel que se encarga de inicializar las variables de la GPU es el kernel que se encarga de realizar los cálculos. Por lo tanto, el kernel que se encarga de realizar los cálculos recibe los arreglos que se encuentran en la GPU como parámetros y los inicializa.

```c
__global__ void kernel(int *a, int *b, int *c, int n)
{
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    if (i < n)
        c[i] = a[i] + b[i];
}
```

Y cuado llamamos al kernel, le pasamos los arreglos que se encuentran en la GPU como parámetros.

```c
int main(){
    a = (int *)malloc(sizeof(int) * n);
    b = (int *)malloc(sizeof(int) * n);
    c = (int *)malloc(sizeof(int) * n);
    cudaMalloc(&d_a, sizeof(int) * n);
    cudaMalloc(&d_b, sizeof(int) * n);
    cudaMalloc(&d_c, sizeof(int) * n);
    cudaMemcpy(d_a, a, sizeof(int) * n, cudaMemcpyHostToDevice);
    cudaMemcpy(d_b, b, sizeof(int) * n, cudaMemcpyHostToDevice);
    kernel<<<1, n>>>(d_a, d_b, d_c, n);
    cudaMemcpy(c, d_c, sizeof(int) * n, cudaMemcpyDeviceToHost);
    return 0;
}
```

En la línea de `kernel` al pasar los arreglos que se encuentran en la GPU como parámetros, estamos inicializando los arreglos que se encuentran en la GPU.

## ¿Cómo se copian los datos a la GPU?

Para copiar los datos a la GPU, se utiliza la función `cudaMemcpy`. Esta función se utiliza de la siguiente manera:

```c
cudaMemcpy(destino, origen, tamaño, tipo_de_copia);
```

Donde:

- **destino**: Es el __puntero__ al espacio de memoria donde se copiarán los datos.
- **origen**: Es el __puntero__ al espacio de memoria donde se encuentran los datos a copiar.
- **tamaño**: Es el tamaño en bytes de los datos a copiar.
- **tipo_de_copia**: Es el tipo de copia que se realizará. Los tipos de copia son los siguientes:
  - **cudaMemcpyHostToHost**: Copia los datos de la memoria de la CPU a la memoria de la CPU.
  - **cudaMemcpyHostToDevice**: Copia los datos de la memoria de la CPU a la memoria de la GPU.
  - **cudaMemcpyDeviceToHost**: Copia los datos de la memoria de la GPU a la memoria de la CPU.
  - **cudaMemcpyDeviceToDevice**: Copia los datos de la memoria de la GPU a la memoria de la GPU.

Es importante que recuerden que es necesario ya tener reservado el espacio de memoria en la GPU antes de copiar los datos a la GPU. Para reservar el espacio de memoria en la GPU, se utiliza la función `cudaMalloc`. Esta función se utiliza de la siguiente manera:

```c
    cudaMalloc(&puntero, tamaño);  
```

# Consultas al Dispositivo CUDA

## ¿Qué es un dispositivo CUDA?

Un dispositivo CUDA es un dispositivo que tiene la capacidad de ejecutar código en la GPU. En este caso, el dispositivo CUDA es la GPU. Para poder ejecutar código en la GPU.

## ¿Para qué sirve consultar el dispositivo CUDA?

Consultar el dispositivo CUDA sirve para saber cuántos dispositivos CUDA tenemos en nuestra computadora y cuál es el dispositivo CUDA que se va a utilizar para ejecutar el código en la GPU. Esto es extremadamente util cuando tenemos más de una GPU en nuestra computadora.

## ¿Cómo se consulta el dispositivo CUDA?

Para consultar el dispositivo CUDA, se utiliza la función `cudaGetDeviceCount`. Esta función se utiliza de la siguiente manera:

```c
int nDevices;
cudaGetDeviceCount(&nDevices);
```

Esta función lo que nos va a regresar es la cantidad de dispositivos CUDA que tenemos en nuestra computadora. Si tenemos más de un dispositivo CUDA, entonces debemos seleccionar el dispositivo CUDA que vamos a utilizar para ejecutar el código en la GPU. Para seleccionar el dispositivo CUDA que vamos a utilizar, se utiliza la función `cudaSetDevice`. Esta función se utiliza de la siguiente manera:

```c
cudaSetDevice(device);
```

Donde `device` es el número del dispositivo CUDA que vamos a utilizar. Es importante que recuerden que los dispositivos CUDA se enumeran desde el 0. Por lo tanto, si tenemos 2 dispositivos CUDA, entonces el primer dispositivo CUDA se va a enumerar como 0 y el segundo dispositivo CUDA se va a enumerar como 1.

## Detalles del dispositivo CUDA

Para nosotros poder obtener los detalles del dispositivo CUDA, primero debemos crear una variable de tipo `cudaDeviceProp`. Esta variable es una estructura que contiene todos los detalles del dispositivo CUDA. Una vez que tenemos la variable de tipo `cudaDeviceProp`, entonces podemos utilizar la función `cudaGetDeviceProperties` para obtener los detalles del dispositivo CUDA. Esta función se utiliza de la siguiente manera:

```c
cudaGetDeviceProperties(&prop, device);
```

Entonces Si quisieramos ver un código que primero nos liste los dispositivos CUDA que tenemos en nuestra computadora y luego nos muestre los detalles del dispositivo CUDA que vamos a utilizar, el código se vería de la siguiente manera:

```c
#include <stdio.h>
#include <stdlib.h>

int main()
{
    int nDevices;
    cudaGetDeviceCount(&nDevices);
    for (int i = 0; i < nDevices; i++)
    {
        cudaDeviceProp prop;
        cudaGetDeviceProperties(&prop, i);
        printf("Device Number: %d\n", i);
        printf("  Device name: %s\n", prop.name);
        printf("  Memory Clock Rate (KHz): %d\n",
               prop.memoryClockRate);
        printf("  Memory Bus Width (bits): %d\n",
               prop.memoryBusWidth);
        printf("  Peak Memory Bandwidth (GB/s): %f\n\n",
               2.0 * prop.memoryClockRate * (prop.memoryBusWidth / 8) / 1.0e6);
    }
    return 0;
}
```

Estos son algunos de los detalles que nos regresa la función `cudaGetDeviceProperties` sin embargo la lista completa de detalles la pueden encontrar en la [documentación de CUDA](https://docs.nvidia.com/cuda/cuda-runtime-api/structcudaDeviceProp.html#structcudaDeviceProp).

Poder leer los detalles del dispositivo CUDA es muy importante porque nos permite saber cuánta memoria tiene el dispositivo CUDA, cuántos multiprocesadores tiene, cuántos hilos puede ejecutar, etc. Esto nos permite saber si el dispositivo CUDA que tenemos en nuestra computadora es capaz de ejecutar el código que queremos ejecutar en la GPU. además de poder darnos los limites de la GPU para poder optimizar el código que vamos a ejecutar en la GPU. Por ejemplo, si nosotros queremos ejecutar un código que requiere 1GB de memoria y nuestra GPU solo tiene 512MB de memoria, entonces no vamos a poder ejecutar el código en la GPU. Por lo tanto, es importante que nosotros podamos leer los detalles del dispositivo CUDA para saber si podemos ejecutar el código en la GPU.

# Ejercicio de clase

Vamos a probar los conceptos nuevos en clase de forma conceptual sin una aplicación práctica. Para esto vamos a realizar un programa que nos muestre los detalles de la GPU que tenemos en nuestra computadora. Para esto vamos a utilizar los siguientes pasos:

1. Crear una variable de tipo `cudaDeviceProp`.
2. Obtener la cantidad de dispositivos CUDA que tenemos en nuestra computadora.
3. Seleccionar el dispositivo CUDA que vamos a utilizar.
4. Obtener los detalles del dispositivo CUDA que vamos a utilizar.
5. Imprimir  los detalles del dispositivo CUDA que vamos a utilizar.
6. Ejecutar el programa y verificar que los detalles que nos muestra el programa sean los mismos que los detalles que nos muestra la herramienta `nvidia-smi`.
7. Subir el código a un repositorio de GitHub.
8. Subir el link del repositorio a Google Classroom.
9. Subir un documento de texto en formato markdown con el código del programa y los detalles del dispositivo CUDA que nos muestra el programa.
