#!/usr/bin/bash

#CXX=/shared/Linux/opt/nvidia/hpc_sdk/Linux_x86_64/23.1/compilers/bin/nvc++
CXX=g++
CXXFLAGS="-march=skylake -O3"

# g++ -c glad.c
# ar rcs lib/libglad.a glad.o
# rm glad.o

# g++ -c glfw_opengl.cpp
# g++ glfw_opengl.o lib/GLFW/libglfw3.a -lOpenGL -o run_glfw_opengl
# rm glfw_opengl.o

# g++ -c glfw_glad_opengl_triangle.cpp
# g++ glfw_glad_opengl_triangle.o lib/libglad.a lib/GLFW/libglfw3.a -o run_glfw_glad_opengl_triangle
# rm glfw_glad_opengl_triangle.o

# g++ -c glfw_vulkan_bare.cpp
# g++ glfw_vulkan_bare.o lib/GLFW/libglfw3.a -lvulkan -o run_glfw_vulkan_bare
# rm glfw_vulkan_bare.o

$CXX $CXXFLAGS -c glfw_vulkan_triangle.cpp
$CXX glfw_vulkan_triangle.o lib/GLFW/libglfw3.a -lvulkan -o run_glfw_vulkan_triangle
rm glfw_vulkan_triangle.o
(cd shaders && ./compile.sh)

