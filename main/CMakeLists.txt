# Set the sources, headers, and data variables
set(sources
    src/main.cpp
)

set(headers
    inc/main.h
)

set(data
    resources/resource1
)

# Create the main executable target
add_executable(example ${sources} ${data})

# Add compiler options and include directories
target_compile_options(example PUBLIC -std=c++1y -Wall -Wfloat-conversion)
target_include_directories(example PUBLIC inc)

# Copy resource files to the build directory
file(COPY ${data} DESTINATION resources)
