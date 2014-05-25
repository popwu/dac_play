list( APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/libraries/fc/GitVersionGen" )
include( GetGitRevisionDescription )
get_git_head_revision(GIT_REFSPEC BITSHARES_TOOLKIT_GIT_REVISION_SHA)
get_git_unix_timestamp(BITSHARES_TOOLKIT_GIT_REVISION_UNIX_TIMESTAMP)

file(GLOB headers "include/bts/utilities/*.hpp")

set(sources key_conversion.cpp 
            ${headers})

configure_file("${CMAKE_CURRENT_SOURCE_DIR}/git_revision.cpp.in" "${CMAKE_CURRENT_BINARY_DIR}/git_revision.cpp" @ONLY)
list(APPEND sources "${CMAKE_CURRENT_BINARY_DIR}/git_revision.cpp")

include_directories( "${CMAKE_SOURCE_DIR}/libraries/utilities/include" )
include_directories( "${CMAKE_SOURCE_DIR}/libraries/fc/include" )


add_library( bts_utilities 
             ${sources}
             ${HEADERS} )

target_link_libraries( bts_utilities fc )