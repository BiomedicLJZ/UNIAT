#include <Box2D/Box2D.h>
#include <iostream>
#include <d3dx9.h>

using namespace std;

int main(){

    b2Vec2 gravity(0.0f, -9.81f);
    b2World world(gravity);

    b2BodyDef groundBodyDef;
    groundBodyDef.position.Set(0.0f, -9.81f);


    D3DXVECTOR2 u, v, w;
    v = D3DXVECTOR2(3.1415f, 7.0f);
    u = 42.0f * v;
    w = u + D3DXVECTOR2(v.x, 99.0f);
    u += w;

    return 0;
}
