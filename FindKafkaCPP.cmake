# Tries to find Kafka C++ Client headers and libraries.
#
# Usage of this module as follows:
#
#  find_package(KafkaCPP)
#
# Variables used by this module, they can change the default behaviour and need
# to be set before calling find_package:
#
#  KAFKA_ROOT_DIR  Set this variable to the root installation of
#                  Kafka Library if the module has problems finding
#                  the proper installation path.
#
# Variables defined by this module:
#
#  KAFKA_CPP_FOUND              System has Kafka libs/headers
#  KAFKA_CPP_LIBRARIES          The Kafka libraries
#  KAFKA_CPP_INCLUDE_DIRS       The location of Kafka headers

find_path(KAFKA_CPP_INCLUDE_DIR 
    NAMES
        rdkafkacpp.h
    PATHS 
        ${KAFKA_ROOT_DIR}/include
    PATH_SUFFIXES 
        librdkafka
)

find_library(KAFKA_CPP_LIBRARY
    NAMES 
        rdkafka++
    PATHS 
        ${KAFKA_ROOT_DIR}/lib 
)
			 
include(FindPackageHandleStandardArgs)

# handle the QUIETLY and REQUIRED arguments and set KAFKA_CPP_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(KAFKA_CPP 
    DEFAULT_MSG
    KAFKA_CPP_LIBRARY 
    KAFKA_CPP_INCLUDE_DIR
)

mark_as_advanced(KAFKA_CPP_INCLUDE_DIR KAFKA_CPP_LIBRARY)

if (KAFKA_CPP_FOUND)
    set(KAFKA_CPP_INCLUDE_DIRS ${KAFKA_CPP_INCLUDE_DIR})
    set(KAFKA_CPP_LIBRARIES ${KAFKA_CPP_LIBRARY})
	
    get_filename_component (KAFKA_CPP_LIBRARY_DIR ${KAFKA_CPP_LIBRARY} PATH)
    get_filename_component (KAFKA_CPP_LIBRARY_NAME ${KAFKA_CPP_LIBRARY} NAME_WE)
    
    mark_as_advanced (KAFKA_CPP_LIBRARY_DIR KAFKA_CPP_LIBRARY_NAME)
    
    message (STATUS "Include directories: ${KAFKA_CPP_INCLUDE_DIRS}") 
    message (STATUS "Libraries: ${KAFKA_CPP_LIBRARIES}") 
endif ()
