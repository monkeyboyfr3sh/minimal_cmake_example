cmake_minimum_required(VERSION 3.0)
project(example_project)

# Find and configure OpenCV
find_package(OpenCV REQUIRED)

# Add the subdirectory for the main code
add_subdirectory(main)

# Link your main executable with OpenCV
target_link_libraries(main_executable PRIVATE ${OpenCV_LIBS})
