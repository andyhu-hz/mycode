#include <stdio.h>
#include <math.h>
#include "lua/lua.h"
#include "lua/lauxlib.h"
#include "lua/lualib.h"

static int _sin(lua_State *L){
    double d = luaL_checknumber(L, 1);
    lua_pushnumber(L, sin(d));
    return 1;
}

int luaopen_test_library(lua_State *L){

    luaL_Reg test_lib[] = {
        {"_sin" , _sin},
        {NULL, NULL}
    };
    luaL_newlib(L, test_lib);
    return 1;
}

