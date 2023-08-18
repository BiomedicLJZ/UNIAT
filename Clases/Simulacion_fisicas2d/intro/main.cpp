#include <iostream>
#include <Box2D/Box2D.h>
#include <d3dx9.h>

D3DXVECTOR2 Rotate(float angle, D3DXVECTOR2& v) {
    float x = v.x;
    float y = v.y;
    v.x = x * cos(angle) - y * sin(angle);
    v.y = x * sin(angle) + y * cos(angle);
    return v;
}
int main() {
    //Creacioón de un vector de 2 dimensiones
    D3DXVECTOR2 u, v, w;
    v = D3DXVECTOR2(3.1415f, 7.0f);
    u = 42.0f * v;
    w = u + D3DXVECTOR2(v.x, 99.0f);
    u += w;
    //print vector
    std::cout << "u = (" << u.x << ", " << u.y << ")" << std::endl;
    // Rotación de un vector
    //Convertir 60° a radianes
    float angle = 60.0f * 3.1415f / 180.0f;
    v = Rotate(angle, v);
    std::cout << "v = (" << v.x << ", " << v.y << ")" << std::endl;

}
