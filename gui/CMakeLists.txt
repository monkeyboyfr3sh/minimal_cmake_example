cmake_minimum_required (VERSION 3.4)

project( gui )

# find_package( OpenCV REQUIRED )
# include_directories( ${OpenCV_INCLUDE_DIRS} )

# Find the Qt library and modules
find_package(Qt5 COMPONENTS Widgets REQUIRED)

# Set the sources, headers, and data variables
set(sources
    gui.cpp
)

set(headers
)

set(data
)

# # Create the main executable target
add_executable(${PROJECT_NAME} ${sources} ${data})

# target_link_libraries( main ${OpenCV_LIBS} )

# Link the Qt5 libraries to your executable
target_link_libraries(${PROJECT_NAME} Qt5::Widgets)

# Add compiler options and include directories
target_compile_options(${PROJECT_NAME} PUBLIC -std=c++1y -Wall -Wfloat-conversion)
target_include_directories(${PROJECT_NAME} PUBLIC inc)

# Copy resource files to the build directory
file(COPY ${data} DESTINATION resources)
