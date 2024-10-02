# This file was automatically generated for projects
# without default 'CMakeLists.txt' file.

FILE(GLOB_RECURSE app_sources ${CMAKE_SOURCE_DIR}/src/*.*)

idf_component_register(SRCS ${app_sources})

# create ULP app name
set(ulp_app_name ulp_main)

# tell the complier which file contains the ulp code
set(ulp_s_sources "../ulp/main.S")

# tell the compiler which file will be using the variable exported in the ulp code
set(ulp_exp_dep_srcs "main.cpp")

ulp_embed_binary(${ulp_app_name} "${ulp_s_sources}" "${ulp_exp_dep_srcs}")