#include "include/GLFW/glfw3.h"
#include <iostream>
#include <string>

void LOG(std::string msg) {
	std::cout << msg << std::endl;
}

int main(void)
{

    /* Initialize the library */
    if (!glfwInit())
        LOG("GLFW Init failed!");

    /* Create a windowed mode window and its OpenGL context */
    GLFWwindow* window = glfwCreateWindow(640, 480, "Hello World", NULL, NULL);
    if (!window)
    {
        glfwTerminate();
        LOG("Window and OpenGL context creation failed!");
    }

    /* Make the window's context current */
    glfwMakeContextCurrent(window);

    /* Loop until the user closes the window */
    while (!glfwWindowShouldClose(window))
    {
        /* Render here */
        glClear(GL_COLOR_BUFFER_BIT);
      
        // OpenGL rendering goes here

        /* Swap front and back buffers */
        glfwSwapBuffers(window);

        /* Poll for and process events */
        glfwPollEvents();
    }

    glfwTerminate();
    return 0;
}

