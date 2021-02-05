
set(SNOW2MDLEXEC "${CMAKE_BINARY_DIR}/sorc/emcsfc_snow2mdl.fd/emcsfc_snow2mdl")
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/driver.cmake.sh ${CMAKE_CURRENT_BINARY_DIR}/driver.cmake.sh @ONLY)

add_test(test_snow2mdl ${CMAKE_CURRENT_BINARY_DIR}/driver.cmake.sh)

