#include <stdio.h>
#include <math.h>
#include "lua/lua.h"
#include "lua/lauxlib.h"
#include "lua/lualib.h"

static int _hello_sin(lua_State *L){
    double d = luaL_checknumber(L, 1);
    lua_pushnumber(L, sin(d));
    return 1;
}

int luaopen_hello_library(lua_State *L){

    luaL_Reg hello_lib[] = {
        {"hello_sin" , _hello_sin},
        {NULL, NULL}
    };
    luaL_newlib(L, hello_lib);
    return 1;
}

