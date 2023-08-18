# Introducción a la Simulación de físicas 2D

## ¿Qué es la simulación de físicas?

La simulación de físicas es un campo de la computación gráfica que se encarga de simular el comportamiento de objetos en un entorno virtual. Esto se logra mediante la aplicación de leyes físicas a los objetos que se desean simular. Estas
leyes físicas pueden ser de distintos tipos, como por ejemplo: leyes de la mecánica clásica, leyes de la mecánica
cuántica, leyes de la termodinámica, etc. Esto es de suma importancia en el desarrollo de videojuegos, ya que permite
que los objetos se comporten de una manera más realista, lo cual es muy importante para la inmersión del jugador en el
juego.

## ¿Por qué es importante la simulación de físicas?

La simulación de físicas es importante en el desarrollo de videojuegos porque permite que los objetos se comporten de
una manera más realista, lo cual es muy importante para la inmersión del jugador en el juego. Además permite generar
condiciones que serían muy difíciles de generar en la vida real, como por ejemplo: simular el comportamiento de un
objeto en el espacio, simular el comportamiento de un objeto en un entorno con gravedad diferente a la de la tierra,
simular el comportamiento de un objeto en un entorno submarino, etc.

## ¿Qué es la simulación de físicas 2D?

Se denomina simulación en 2D debido a que se simulan objetos en un entorno bidimensional, es decir, en un entorno que
tiene dos dimensiones: ancho y alto. Si bien tambien existen simulaciones en 3D, en este curso nos enfocaremos en la
simulación en 2D debido a que es más sencillo de implementar y es más fácil de entender. Además, la simulación en 2D es la base para la simulación en 3D, por lo que es importante entenderla.

## ¿Qué es un motor de físicas?

Un motor de físicas es un programa que se encarga de simular físicas en un entorno virtual. Este programa se encarga de aplicar las leyes físicas a los objetos que se desean simular. Además, se encarga de detectar colisiones entre los
objetos y de resolverlas. Esto es de suma importancia en el desarrollo de videojuegos, ya que permite que los objetos se
comporten de una manera más realista, lo cual es muy importante para la inmersión del jugador en el juego. Para este
curso utilizaremos el motor de físicas Box2D, el cual es un motor de físicas open source que se puede utilizar de manera
gratuita y está hecho para C++.

---

## ¿Qué es Box2D?

Box2D es un motor de físicas open source que se puede utilizar de manera gratuita y está hecho para C++. Este motor de físicas se encarga de simular físicas en un entorno virtual. Este programa se encarga de aplicar las leyes físicas a los
objetos que se desean simular. Además, se encarga de detectar colisiones entre los objetos y de resolverlas. Esto es de
suma importancia en el desarrollo de videojuegos, ya que permite que los objetos se comporten de una manera más
realista, lo cual es muy importante para la inmersión del jugador en el juego.

## Cómo se instala Box2D

Instalar Box2D puede parecer un proceso sencillo pero puede tener algunos desafíos si no tienen mucha experiencia con
librerías externas en C++. Por eso, en este curso les explicaremos paso a paso cómo instalar Box2D en su computadora.
Para instalar Box2D en su computadora, deben seguir los siguientes pasos:

1. Verificar tener instalado el software necesario para la instalación.
    1. Verificar tener instalado [Visual Studio](https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=Community&channel=Release&version=VS2022&source=VSLandingPage&passive=false&cid=2030).
    2. Verificar tener instalado [CMake](https://cmake.org/download/).
    3. Verificar tener instalado [DirectX 9 SDK](https://www.microsoft.com/en-US/download/details.aspx?id=6812).

---

2. Descargar Box2D.

Para esto tienen que clonar el [repositorio de Box2D](https://github/erincatto/box2d) en su computadora. Para clonar el repositorio de
   Box2D en su computadora, deben seguir los siguientes pasos:
    -

        1. Abrir la consola de comandos de Windows.
    -
        2. Navegar hasta la carpeta donde quieren clonar el repositorio de Box2D.
    -
        3. Ejecutar el siguiente comando: `git clone https://github.com/erincatto/box2d

---

3. Compilar Box2D. Para esto tienen que compilar el repositorio de Box2D en su computadora. Para compilar el repositorio    de Box2D en su computadora, deben seguir los siguientes pasos:

-
  1. Abrir la consola de comandos de Windows.

  2. Navegar hasta la carpeta donde clonaron el repositorio de Box2D.  
  3. Ejecutar los siguientes comandos:

  -
      1. `mkdir build`
  -
      2. `cd build`
  -
      3. `cmake -DBOX2D_BUILD_DOCS=ON -DCMAKE_INSTALL_PREFIX= "RUTA DE INSTALACIÓN PARA EL PAQUETE" ..`
  -
      4. `cmake --build .`
  -
      5. `cmake --build . --target install`

Estos comandos van a instalar la librería de Box2D en su computadora en la carpeta C:\Program Files (x86)\Box2D. Si bien esto no es lo ideal, es la manera más sencilla de instalar Box2D en su computadora.

Listo, ya tienen instalado Box2D en su computadora. Ahora pueden utilizar Box2D en sus proyectos de C++.

Para poder utilizar Box2D en sus proyectos de C++, se les explicará como crear los archivos de configuración de CMakelists.txt y como incluir la librería de Box2D en sus proyectos de C++.

---

## ¿Qué es un archivo de configuración de CMakeLists.txt?

Un archivo de configuración de CMakeLists.txt es un archivo que se utiliza para configurar un proyecto de C++ y poder compilarlo de manera sencilla con CMake. Este archivo se utiliza para indicarle a CMake cómo compilar el proyecto de C++. Para crear un archivo de configuración de CMakeLists.txt, deben seguir los siguientes pasos:

1. Crear un archivo de texto en la carpeta raíz del proyecto de C++.
2. Nombrar el archivo como CMakeLists.txt.
3. Abrir el archivo con un editor de texto.
4. Escribir el siguiente código en el archivo:

```cmake
cmake_minimum_required(VERSION 3.0.0)
project(NombreDelProyecto VERSION 0.1.0)
find_package(Box2D REQUIRED)
include_directories(${Box2D_INCLUDE_DIRS})
add_executable(NombreDelProyecto main.cpp)
target_link_libraries(NombreDelProyecto ${Box2D_LIBRARIES})
```

Explicación del código:

La primera linea le indica a CMake que versión de CMakeLists.txt se va a utilizar. La segunda linea le indica a CMake el nombre del proyecto. La tercera linea le indica a CMake que busque la librería de Box2D. La cuarta linea le indica a CMake que incluya los archivos de Box2D. La quinta linea le indica a CMake que cree un ejecutable con el nombre del proyecto. La sexta linea le indica a CMake que linkee la librería de Box2D con el ejecutable.

Una vez que crearon el archivo de configuración de CMakeLists.txt el IDE que utilizaremos que es `CLion` :tm: lo detectará y les permitirá compilar el proyecto de C++ con CMake.

## ¿Cómo se incluye la librería de Box2D en un proyecto de C++?

Para poder incluir la librería de `Box2d` es necesario primero preparar el archivo `CMakeLists.txt` para que pueda encontrar la librería. Para esto deben seguir los siguientes pasos:

1. Abrir el archivo `CMakeLists.txt` del proyecto de C++.
2. Agregar la siguiente linea de código al archivo `CMakeLists.txt`:

```cmake
find_package(Box2D REQUIRED)

include_directories("Ruta a la carpeta de Box2D")

target_link_libraries(NombreDelProyecto box2d::box2d)

```

Estas lineas lo que hacen por orden es:

1. buscar la librería de Box2D
2. incluir los archivos de Box2D
3. linkear la librería de Box2D con el ejecutable

*Una vez hecho esto podemos simplemete incluir la librería de Box2D en nuestro proyecto de C++ con la siguiente linea de código:*

```cpp
#include <Box2D/Box2D.h>
```
