#!/usr/bin/bash

#CXX=/shared/Linux/opt/nvidia/hpc_sdk/Linux_x86_64/23.1/compilers/bin/nvc++
CXX=g++
CXXFLAGS="-march=skylake -O3"

# check if symlinks exist and are not broken. If not, do the following...
if [[ (! -e include/GLFW || ! -e include/linmath.h || ! -e lib/GLFW ) ]]
then
    # Maybe only the symlinks are gone/broken. If not, clone repo and build.
    if [[ ! -d glfw/install ]]
    then
        git clone --recursive git@github.com:glfw/glfw.git
        (cd glfw && mkdir _build && cd _build && cmake .. && make -j DESTDIR=$PWD/../install install)
    fi
    ln -sfv ../glfw/install/usr/local/include/GLFW include/
    ln -sfv ../glfw/deps/linmath.h include/
    ln -sfv ../glfw/install/usr/local/lib lib/GLFW
fi

# check if symlinks exist and are not broken. If not, do the following...
if [[ ! -e include/glm ]]
then
    # Maybe only the symlinks are gone/broken. If not, clone repo and build.
    if [[ ! -d glm/install ]]
    then
        git clone --recursive git@github.com:g-truc/glm.git
        (cd glm && mkdir _build && cd _build && cmake .. && make -j DESTDIR=$PWD/../install install)
    fi
    ln -svf ../glm/install/usr/local/include/glm include/
fi

if [[ ! -e include/stb_image.h ]]
then
    git clone git@github.com:nothings/stb.git
    ln -sfv ../stb/stb_image.h include/
fi

if [[ ! -f shaders/vert.spirv || ! -e shaders/frag.spirv ]]
then
    (cd shaders && ./compile.sh && echo Compiled vertex- and frag shaders into SPIR-V bytecode.)
fi

# $CXX $CXXFLAGS -c glad.c
# ar rcs lib/libglad.a glad.o
# rm glad.o

# $CXX $CXXFLAGS -c glfw_opengl.cpp
# $CXX glfw_opengl.o lib/GLFW/libglfw3.a -lOpenGL -o run_glfw_opengl
# rm glfw_opengl.o

# $CXX $CXXFLAGS -c glfw_glad_opengl_triangle.cpp
# $CXX glfw_glad_opengl_triangle.o lib/libglad.a lib/GLFW/libglfw3.a -o run_glfw_glad_opengl_triangle
# rm glfw_glad_opengl_triangle.o

# $CXX $CXXFLAGS -c glfw_vulkan_bare.cpp
# $CXX glfw_vulkan_bare.o lib/GLFW/libglfw3.a -lvulkan -o run_glfw_vulkan_bare
# rm glfw_vulkan_bare.o

# $CXX $CXXFLAGS -c glfw_vulkan_triangle.cpp
# $CXX glfw_vulkan_triangle.o lib/GLFW/libglfw3.a -lvulkan -o run_glfw_vulkan_triangle
# rm glfw_vulkan_triangle.o

# $CXX $CXXFLAGS -c vulkan_glfw_quad.cpp
# $CXX vulkan_glfw_quad.o lib/GLFW/libglfw3.a -lvulkan -o run_vulkan_glfw_quad
# rm vulkan_glfw_quad.o

$CXX $CXXFLAGS -c vulkan_glfw_texture_mapping.cpp
$CXX vulkan_glfw_texture_mapping.o lib/GLFW/libglfw3.a -lvulkan -o run_vulkan_glfw_textured
rm vulkan_glfw_texture_mapping.o
