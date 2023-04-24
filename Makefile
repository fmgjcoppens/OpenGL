#!/usr/bin/bash

CXX=g++
#CXX=/shared/Linux/opt/nvidia/hpc_sdk/Linux_x86_64/23.1/compilers/bin/nvc++
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

# g++ -c 12_graphics_pipeline_complete.cpp
# g++ 12_graphics_pipeline_complete.o lib/GLFW/libglfw3.a -lvulkan -o run_glfw_vulkan_triangle_working
# rm 12_graphics_pipeline_complete.o
# (cd shaders && ./compile.sh)

# g++ -c 14_command_buffers.cpp
# g++ 14_command_buffers.o lib/GLFW/libglfw3.a -lvulkan -o run_glfw_vulkan_triangle_working
# rm 14_command_buffers.o
# (cd shaders && ./compile.sh)

# $CXX $CXXFLAGS -c 15_hello_triangle.cpp
# $CXX 15_hello_triangle.o lib/GLFW/libglfw3.a -lvulkan -o run_glfw_vulkan_triangle_working
# rm 15_hello_triangle.o
# (cd shaders && ./compile.sh)
