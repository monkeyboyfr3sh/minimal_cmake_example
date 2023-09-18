cmake_minimum_required (VERSION 3.4)

project( DisplayImage )
find_package( OpenCV REQUIRED )
include_directories( ${OpenCV_INCLUDE_DIRS} )

# Set the sources, headers, and data variables
set(sources
    DisplayImage.cpp
)

# Create the main executable target
add_executable(DisplayImage ${sources})

target_link_libraries( DisplayImage ${OpenCV_LIBS} )