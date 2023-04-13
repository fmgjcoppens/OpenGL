#define GLFW_INCLUDE_VULKAN
#include "include/GLFW/glfw3.h"

#include <iostream>
#include <stdexcept>
#include <cstdlib>

const unsigned int WIDTH = 800;  // Default values. Have no effect on tiled 
const unsigned int HEIGHT = 600; // window managers like i3/sway.

class HelloTriangleApp {
public:
    void Run() {
        InitWindow();
        InitVulkan();
        MainLoop();
        Cleanup();
    }

private:
    GLFWwindow* _window;

    void InitWindow() {
        glfwInit();
        glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API);
        glfwWindowHint(GLFW_RESIZABLE, GLFW_FALSE);
        _window = glfwCreateWindow(WIDTH, HEIGHT, "Vulkan Triangle App", nullptr, nullptr);
    }

    void InitVulkan() {
        // uint32_t extensionCount = 0;
        // vkEnumerateInstanceExtensionProperties(nullptr, &extensionCount, nullptr);
        // std::cout << extensionCount << " Vulkan extensions supported." << std::endl;
    }

    void MainLoop() {
        while (!glfwWindowShouldClose(_window)) {
            glfwPollEvents();

        }
    }

    void Cleanup () {
        glfwDestroyWindow(_window);
        glfwTerminate();
    }

};

int main() {

    HelloTriangleApp app;

    try {
        app.Run();
    }
    catch(const std::exception &e) {
        std::cerr << e.what() << std::endl;
        return EXIT_FAILURE;
    }

    return EXIT_SUCCESS;
}

