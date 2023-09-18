cmake_minimum_required (VERSION 3.4)
project(example_project)

# # Find and configure OpenCV
# find_package(OpenCV REQUIRED)

# Add the subdirectory for the code
add_subdirectory(main)
add_subdirectory(test)
#add_subdirectory(gui)
