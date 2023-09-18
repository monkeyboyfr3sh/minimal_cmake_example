cmake_minimum_required (VERSION 3.4)

project( gui )
# find_package( OpenCV REQUIRED )
# include_directories( ${OpenCV_INCLUDE_DIRS} )
find_package (Qt5 REQUIRED COMPONENTS Core Widgets Network)

# # Set the sources, headers, and data variables
# set(sources
#     src/main.cpp
# )

# set(headers
#     inc/main.h
# )

# set(data
#     resources/resource1
# )

# # Create the main executable target
# add_executable(main ${sources} ${data})
# target_link_libraries( main ${OpenCV_LIBS} )

# # Add compiler options and include directories
# target_compile_options(main PUBLIC -std=c++1y -Wall -Wfloat-conversion)
# target_include_directories(main PUBLIC inc)

# # Copy resource files to the build directory
# file(COPY ${data} DESTINATION resources)
