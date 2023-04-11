g++ -c glad.c
ar rcs lib/libglad.a glad.o
rm glad.o


g++ -c glfw.cpp
g++ glfw.o lib/GLFW/libglfw3.a -lOpenGL -o run_glfw
rm glfw.o

g++ -c glfw_triangle.cpp
g++ glfw_triangle.o lib/libglad.a lib/GLFW/libglfw3.a -lOpenGL -o run_glfw_triangle
rm glfw_triangle.o
