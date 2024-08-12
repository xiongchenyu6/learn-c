cmake_minimum_required(VERSION 3.5)
project(learn-c C)

# ##############################################################################
# If you include the drogon source code locally in your project, use this method
# to add drogon 
# add_subdirectory(drogon) 
# target_link_libraries(${PROJECT_NAME} PRIVATE drogon)
#
# and comment out the following lines
find_package(PkgConfig)


pkg_search_module(glib REQUIRED IMPORTED_TARGET glib-2.0)
pkg_search_module(gstreamer REQUIRED IMPORTED_TARGET gstreamer-1.0>=1.4)
pkg_search_module(gstreamer-sdp REQUIRED IMPORTED_TARGET gstreamer-sdp-1.0>=1.4)
pkg_search_module(gstreamer-rtp REQUIRED IMPORTED_TARGET gstreamer-rtp-1.0>=1.4)
pkg_search_module(gstreamer-webrtc REQUIRED IMPORTED_TARGET gstreamer-webrtc-1.0>=1.4)
pkg_search_module(json-glib REQUIRED IMPORTED_TARGET json-glib-1.0)
pkg_search_module(libsoup REQUIRED IMPORTED_TARGET libsoup-2.4)


add_executable(${PROJECT_NAME} basic-tutorial-3.c)

target_link_libraries(${PROJECT_NAME} PRIVATE
    PkgConfig::glib
    PkgConfig::gstreamer
    PkgConfig::gstreamer-sdp
    PkgConfig::gstreamer-rtp
    PkgConfig::gstreamer-webrtc
    PkgConfig::json-glib
    PkgConfig::libsoup
)
