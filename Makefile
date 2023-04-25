#!/usr/bin/bash

#CXX=/shared/Linux/opt/nvidia/hpc_sdk/Linux_x86_64/23.1/compilers/bin/nvc++
CXX=g++
CXXFLAGS="-march=skylake -O3"

git clone --recursive git@github.com:glfw/glfw.git
(cd glfw && mkdir _build && cd _build && cmake .. && make -j DESTDIR=$PWD/../install install)
ln -sfv ../glfw/install/usr/local/include/GLFW include
ln -sfv ../glfw/deps/linmath.h include
ln -sfv ../glfw/install/usr/local/lib lib/GLFW

git clone --recursive git@github.com:g-truc/glm.git
(cd glm && mkdir _build && cd _build && cmake .. && make -j DESTDIR=$PWD/../install install)
ln -svf ../glm/install/usr/local/include/glm include

$CXX $CXXFLAGS -c glad.c
ar rcs lib/libglad.a glad.o
rm glad.o

# $CXX $CXXFLAGS -c glfw_opengl.cpp
# $CXX glfw_opengl.o lib/GLFW/libglfw3.a -lOpenGL -o run_glfw_opengl
# rm glfw_opengl.o

# $CXX $CXXFLAGS -c glfw_glad_opengl_triangle.cpp
# $CXX glfw_glad_opengl_triangle.o lib/libglad.a lib/GLFW/libglfw3.a -o run_glfw_glad_opengl_triangle
# rm glfw_glad_opengl_triangle.o

# $CXX $CXXFLAGS -c glfw_vulkan_bare.cpp
# $CXX glfw_vulkan_bare.o lib/GLFW/libglfw3.a -lvulkan -o run_glfw_vulkan_bare
# rm glfw_vulkan_bare.o

$CXX $CXXFLAGS -c glfw_vulkan_triangle.cpp
$CXX glfw_vulkan_triangle.o lib/GLFW/libglfw3.a -lvulkan -o run_glfw_vulkan_triangle
rm glfw_vulkan_triangle.o
(cd shaders && ./compile.sh && echo Compiled vertex- and frag shaders into SPIR-V bytecode.)
