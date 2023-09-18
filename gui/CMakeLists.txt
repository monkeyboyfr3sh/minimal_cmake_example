cmake_minimum_required (VERSION 3.4)

project( gui )
# find_package( OpenCV REQUIRED )
# include_directories( ${OpenCV_INCLUDE_DIRS} )
find_package (Qt5 REQUIRED COMPONENTS Core Widgets Network)

# Set the sources, headers, and data variables
set(sources
    gui.cpp
)

set(headers
)

set(data
)

# # Create the main executable target
add_executable(gui ${sources} ${data})

# target_link_libraries( main ${OpenCV_LIBS} )
target_link_libraries(Qt5::Core Qt5::Widgets Qt5::Network)

# Add compiler options and include directories
target_compile_options(gui PUBLIC -std=c++1y -Wall -Wfloat-conversion)
target_include_directories(gui PUBLIC inc)

# Copy resource files to the build directory
file(COPY ${data} DESTINATION resources)
