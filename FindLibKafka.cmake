# - Try to find LibKafka headers and libraries.
#
# Usage of this module as follows:
#
#     find_package(LibKafka)
#
# Variables used by this module, they can change the default behaviour and need
# to be set before calling find_package:
#
#  LibKafka_ROOT_DIR  Set this variable to the root installation of
#                     LibKAFKA if the module has problems finding
#                     the proper installation path.
#
# Variables defined by this module:
#
#  LIBKAFKA_FOUND              System has LibKAFKA libs/headers
#  LibKAFKA_LIBRARIES          The LibKAFKA libraries
#  LibKAFKA_INCLUDE_DIR        The location of LibKAFKA headers

find_path(LibKafka_ROOT_DIR
    NAMES include/libkafka/Client.h
)

find_library(LibKafka_LIBRARIES
    NAMES kafka
    HINTS ${LibKafka_ROOT_DIR}/lib
)

find_path(LibKafka_INCLUDE_DIR
    NAMES libkafka/Client.h
    HINTS ${LibKafka_ROOT_DIR}/include
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LibKAFKA DEFAULT_MSG
    LibKafka_LIBRARIES
    LibKafka_INCLUDE_DIR
)

mark_as_advanced(
    LibKafka_ROOT_DIR
    LibKafka_LIBRARIES
    LibKafka_INCLUDE_DIR
)
