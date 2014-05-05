# - Try to find LibRDKafka headers and libraries.
#
# Usage of this module as follows:
#
#     find_package(LibRDKafka)
#
# Variables used by this module, they can change the default behaviour and need
# to be set before calling find_package:
#
#  LibRDKafka_ROOT_DIR  Set this variable to the root installation of
#                       LibRDKAFKA if the module has problems finding
#                       the proper installation path.
#
# Variables defined by this module:
#
#  LibRDKAFKA_FOUND              System has LibRDKAFKA libs/headers
#  LibRDKAFKA_LIBRARIES          The LibRDKAFKA libraries
#  LibRDKAFKA_INCLUDE_DIR        The location of LibRDKAFKA headers

find_path(LibRDKafka_ROOT_DIR
    NAMES include/librdkafka/rdkafkacpp.h
)

find_library(LibRDKafka_LIBRARIES
    NAMES rdkafka
    HINTS ${LibRDKafka_ROOT_DIR}/lib
)

find_path(LibRDKafka_INCLUDE_DIR
    NAMES librdkafka/rdkafkacpp.h
    HINTS ${LibRDKafka_ROOT_DIR}/include
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LibRDKAFKA DEFAULT_MSG
    LibRDKafka_LIBRARIES
    LibRDKafka_INCLUDE_DIR
)

mark_as_advanced(
    LibRDKafka_ROOT_DIR
    LibRDKafka_LIBRARIES
    LibRDKafka_INCLUDE_DIR
)
