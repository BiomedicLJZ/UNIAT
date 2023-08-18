# Tipos de Archivos

Cuando trabajamos con archivos, es importante saber que existen diferentes tipos de archivos, y que cada uno de ellos tiene sus propias características. En esta sección vamos a ver los tipos de archivos más comunes, y cómo se utilizan en C++.

# Compilador

Un compilador es un programa que traduce código fuente de un lenguaje de programación a código máquina. Algunos ejemplos de compiladores son el compilador de C++, el compilador de Python, el compilador de Java, etc. Esto quiere decir que un compilador toma un archivo de código fuente, como un archivo `cpp`, y genera un archivo binario, como un archivo `obj` o un archivo `exe`.

# Enlazador

Un enlazador es un programa que combina código máquina de diferentes archivos binarios en un solo archivo binario. Algunos ejemplos de enlazadores son el enlazador de C++, el enlazador de Python, el enlazador de Java, etc. Esto quiere decir que un enlazador toma un archivo binario, como un archivo `obj`, y genera un archivo binario, como un archivo `exe`. Esto se utiliza principalmente con bibliotecas, ya que estas se compilan por separado, y luego se enlazan con el programa principal.

# El proceso de compilación

La compilación es el proceso de traducir código fuente de C++ a código máquina. Este proceso se realiza en dos pasos: la compilación y el enlazado. En la compilación, el compilador toma un archivo de código fuente, como un archivo `cpp`, y genera un archivo binario, como un archivo `obj`. En el enlazado, el enlazador toma un archivo binario, como un archivo `obj`, y genera un archivo binario, como un archivo `exe`.

## Archivos `cpp`

Un archivo `cpp` es un archivo de código fuente de C++. Este tipo de archivos contienen código fuente de C++ que puede ser compilado y ejecutado. Los archivos `cpp` son archivos de texto, por lo que pueden ser editados con cualquier editor de texto, como el Bloc de Notas de Windows, el Notepad++ o el Visual Studio Code. Estos archivos son los que se compilan para generar un programa ejecutable.

## Archivos `h`

Un archivo `h` es un archivo de cabecera de C++. Este tipo de archivos contienen declaraciones de funciones y de variables globales. Los archivos `h` son archivos de texto, por lo que pueden ser editados con cualquier editor de texto, como el Bloc de Notas de Windows, el Notepad++ o el Visual Studio Code. Estos archivos son incluidos en los archivos `cpp` con la directiva `#include`.

## Archivos `exe`

Los archivos `exe` son archivos ejecutables de Windows. Estos archivos son generados por el compilador de C++ cuando se compila un programa. Estos archivos pueden ser ejecutados en cualquier computadora con Windows.

## Archivos `obj`

Los archivos `obj` son archivos objeto de C++. Estos archivos son generados por el compilador de C++ cuando se compila un programa. Estos archivos son archivos binarios, por lo que no pueden ser editados con un editor de texto. Estos archivos son utilizados por el enlazador para generar el archivo ejecutable.

## Archivos `lib`

Los archivos `lib` son archivos de biblioteca de C++. Estos archivos son generados por el enlazador cuando se enlaza un programa. Estos archivos son archivos binarios, por lo que no pueden ser editados con un editor de texto. Estos se diferencian de los archivos `obj` en que los archivos `lib` contienen código objeto de funciones y variables globales, mientras que los archivos `obj` contienen código objeto de funciones y variables globales, pero también de funciones y variables locales.

## Archivos `dll`

Los archivos `dll` son archivos de biblioteca dinámica de C++. Estos archivos son generados por el enlazador cuando se enlaza un programa. Estos archivos son archivos binarios, por lo que no pueden ser editados con un editor de texto. Estos archivos son similares a los archivos `lib`, pero en lugar de contener código objeto, contienen código máquina. Estos archivos son utilizados por el sistema operativo para cargar las funciones y variables globales de un programa en memoria.

## Editor de texto

Un editor de texto es un programa que permite editar archivos de texto. Algunos ejemplos de editores de texto son el Bloc de Notas de Windows, el Notepad++ o el Visual Studio Code. Estos se caracterizan por no tener formato, es decir, no permiten cambiar el tamaño de la letra, el color de la letra, el color de fondo, etc. Estos programas son útiles para editar archivos de texto, como los archivos `cpp` y `h`. dentro de los cuales el material importante está en el texto, y no en el formato.

Ejemplos de formatos de archivos de texto son el formato `txt`, el formato `cpp`, el formato `h`, el formato `md`, etc.

## Editor de código

Un editor de código es un programa que permite editar archivos de código fuente. Algunos ejemplos de editores de código son el `Visual Studio Code`, el `Visual Studio` , el  `Code::Blocks` , el `Dev-C++`, etc. Estos se utilizan para el diseño de programas, ya que cuentan con herramientas que permiten resaltar la sintaxis del código fuente, lo que facilita la lectura y la escritura de código. Estos programas son útiles para editar archivos de código fuente, como los archivos `cpp` y `h`. 

Ejemplos de formatos de archivos de código fuente son el formato `cpp`, el formato `h`, el formato `py`, el formato `ipynb`, etc.

Este diagrama muestra de forma bastante clara el proceso de tener un codigo fuente en `c++` para terminar con un archivo `.exe`


```mermaid
graph LR
    A[Archivo `cpp`] --> B[Compilador]
    B --> C[Archivo `obj`]
    C --> D[Enlazador]
    D --> E[Archivo `exe`]
```

# Ejercicio

Crearemos un programa que imprima un mensaje en pantalla. Para ello, vamos a crear un archivo `cpp` con el siguiente código:

```cpp
#include <iostream>

int main()
{
    std::cout << "Hola mundo!" << std::endl;
    return 0;
}
```

Compilaremos el programa con el siguiente comando:

```bash
g++ main.cpp -o main.exe
```

Ejecutaremos el programa con el siguiente comando:

```bash
main.exe
```

Esperaremos a que el programa termine de ejecutarse, y veremos el siguiente mensaje en pantalla:

```
Hola mundo!
```
