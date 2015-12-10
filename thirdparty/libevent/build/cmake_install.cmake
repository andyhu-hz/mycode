# Install script for directory: /Users/andy/mycode/libevent

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "lib")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/libevent.a")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/lib" TYPE STATIC_LIBRARY FILES "/Users/andy/mycode/libevent/build/lib/libevent.a")
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/libevent.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/libevent.a")
    execute_process(COMMAND "/usr/bin/ranlib" "$ENV{DESTDIR}/usr/local/lib/libevent.a")
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/include/event2/buffer.h;/usr/local/include/event2/bufferevent.h;/usr/local/include/event2/bufferevent_compat.h;/usr/local/include/event2/bufferevent_struct.h;/usr/local/include/event2/buffer_compat.h;/usr/local/include/event2/dns.h;/usr/local/include/event2/dns_compat.h;/usr/local/include/event2/dns_struct.h;/usr/local/include/event2/event.h;/usr/local/include/event2/event_compat.h;/usr/local/include/event2/event_struct.h;/usr/local/include/event2/http.h;/usr/local/include/event2/http_compat.h;/usr/local/include/event2/http_struct.h;/usr/local/include/event2/keyvalq_struct.h;/usr/local/include/event2/listener.h;/usr/local/include/event2/rpc.h;/usr/local/include/event2/rpc_compat.h;/usr/local/include/event2/rpc_struct.h;/usr/local/include/event2/tag.h;/usr/local/include/event2/tag_compat.h;/usr/local/include/event2/thread.h;/usr/local/include/event2/util.h;/usr/local/include/event2/visibility.h;/usr/local/include/event2/event-config.h;/usr/local/include/event2/bufferevent_ssl.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/include/event2" TYPE FILE FILES
    "/Users/andy/mycode/libevent/include/event2/buffer.h"
    "/Users/andy/mycode/libevent/include/event2/bufferevent.h"
    "/Users/andy/mycode/libevent/include/event2/bufferevent_compat.h"
    "/Users/andy/mycode/libevent/include/event2/bufferevent_struct.h"
    "/Users/andy/mycode/libevent/include/event2/buffer_compat.h"
    "/Users/andy/mycode/libevent/include/event2/dns.h"
    "/Users/andy/mycode/libevent/include/event2/dns_compat.h"
    "/Users/andy/mycode/libevent/include/event2/dns_struct.h"
    "/Users/andy/mycode/libevent/include/event2/event.h"
    "/Users/andy/mycode/libevent/include/event2/event_compat.h"
    "/Users/andy/mycode/libevent/include/event2/event_struct.h"
    "/Users/andy/mycode/libevent/include/event2/http.h"
    "/Users/andy/mycode/libevent/include/event2/http_compat.h"
    "/Users/andy/mycode/libevent/include/event2/http_struct.h"
    "/Users/andy/mycode/libevent/include/event2/keyvalq_struct.h"
    "/Users/andy/mycode/libevent/include/event2/listener.h"
    "/Users/andy/mycode/libevent/include/event2/rpc.h"
    "/Users/andy/mycode/libevent/include/event2/rpc_compat.h"
    "/Users/andy/mycode/libevent/include/event2/rpc_struct.h"
    "/Users/andy/mycode/libevent/include/event2/tag.h"
    "/Users/andy/mycode/libevent/include/event2/tag_compat.h"
    "/Users/andy/mycode/libevent/include/event2/thread.h"
    "/Users/andy/mycode/libevent/include/event2/util.h"
    "/Users/andy/mycode/libevent/include/event2/visibility.h"
    "/Users/andy/mycode/libevent/build/include/event2/event-config.h"
    "/Users/andy/mycode/libevent/include/event2/bufferevent_ssl.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "lib")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/libevent_core.a")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/lib" TYPE STATIC_LIBRARY FILES "/Users/andy/mycode/libevent/build/lib/libevent_core.a")
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/libevent_core.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/libevent_core.a")
    execute_process(COMMAND "/usr/bin/ranlib" "$ENV{DESTDIR}/usr/local/lib/libevent_core.a")
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/include/event2/buffer.h;/usr/local/include/event2/bufferevent.h;/usr/local/include/event2/bufferevent_compat.h;/usr/local/include/event2/bufferevent_struct.h;/usr/local/include/event2/buffer_compat.h;/usr/local/include/event2/dns.h;/usr/local/include/event2/dns_compat.h;/usr/local/include/event2/dns_struct.h;/usr/local/include/event2/event.h;/usr/local/include/event2/event_compat.h;/usr/local/include/event2/event_struct.h;/usr/local/include/event2/http.h;/usr/local/include/event2/http_compat.h;/usr/local/include/event2/http_struct.h;/usr/local/include/event2/keyvalq_struct.h;/usr/local/include/event2/listener.h;/usr/local/include/event2/rpc.h;/usr/local/include/event2/rpc_compat.h;/usr/local/include/event2/rpc_struct.h;/usr/local/include/event2/tag.h;/usr/local/include/event2/tag_compat.h;/usr/local/include/event2/thread.h;/usr/local/include/event2/util.h;/usr/local/include/event2/visibility.h;/usr/local/include/event2/event-config.h;/usr/local/include/event2/bufferevent_ssl.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/include/event2" TYPE FILE FILES
    "/Users/andy/mycode/libevent/include/event2/buffer.h"
    "/Users/andy/mycode/libevent/include/event2/bufferevent.h"
    "/Users/andy/mycode/libevent/include/event2/bufferevent_compat.h"
    "/Users/andy/mycode/libevent/include/event2/bufferevent_struct.h"
    "/Users/andy/mycode/libevent/include/event2/buffer_compat.h"
    "/Users/andy/mycode/libevent/include/event2/dns.h"
    "/Users/andy/mycode/libevent/include/event2/dns_compat.h"
    "/Users/andy/mycode/libevent/include/event2/dns_struct.h"
    "/Users/andy/mycode/libevent/include/event2/event.h"
    "/Users/andy/mycode/libevent/include/event2/event_compat.h"
    "/Users/andy/mycode/libevent/include/event2/event_struct.h"
    "/Users/andy/mycode/libevent/include/event2/http.h"
    "/Users/andy/mycode/libevent/include/event2/http_compat.h"
    "/Users/andy/mycode/libevent/include/event2/http_struct.h"
    "/Users/andy/mycode/libevent/include/event2/keyvalq_struct.h"
    "/Users/andy/mycode/libevent/include/event2/listener.h"
    "/Users/andy/mycode/libevent/include/event2/rpc.h"
    "/Users/andy/mycode/libevent/include/event2/rpc_compat.h"
    "/Users/andy/mycode/libevent/include/event2/rpc_struct.h"
    "/Users/andy/mycode/libevent/include/event2/tag.h"
    "/Users/andy/mycode/libevent/include/event2/tag_compat.h"
    "/Users/andy/mycode/libevent/include/event2/thread.h"
    "/Users/andy/mycode/libevent/include/event2/util.h"
    "/Users/andy/mycode/libevent/include/event2/visibility.h"
    "/Users/andy/mycode/libevent/build/include/event2/event-config.h"
    "/Users/andy/mycode/libevent/include/event2/bufferevent_ssl.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "lib")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/libevent_extra.a")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/lib" TYPE STATIC_LIBRARY FILES "/Users/andy/mycode/libevent/build/lib/libevent_extra.a")
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/libevent_extra.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/libevent_extra.a")
    execute_process(COMMAND "/usr/bin/ranlib" "$ENV{DESTDIR}/usr/local/lib/libevent_extra.a")
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/include/event2/buffer.h;/usr/local/include/event2/bufferevent.h;/usr/local/include/event2/bufferevent_compat.h;/usr/local/include/event2/bufferevent_struct.h;/usr/local/include/event2/buffer_compat.h;/usr/local/include/event2/dns.h;/usr/local/include/event2/dns_compat.h;/usr/local/include/event2/dns_struct.h;/usr/local/include/event2/event.h;/usr/local/include/event2/event_compat.h;/usr/local/include/event2/event_struct.h;/usr/local/include/event2/http.h;/usr/local/include/event2/http_compat.h;/usr/local/include/event2/http_struct.h;/usr/local/include/event2/keyvalq_struct.h;/usr/local/include/event2/listener.h;/usr/local/include/event2/rpc.h;/usr/local/include/event2/rpc_compat.h;/usr/local/include/event2/rpc_struct.h;/usr/local/include/event2/tag.h;/usr/local/include/event2/tag_compat.h;/usr/local/include/event2/thread.h;/usr/local/include/event2/util.h;/usr/local/include/event2/visibility.h;/usr/local/include/event2/event-config.h;/usr/local/include/event2/bufferevent_ssl.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/include/event2" TYPE FILE FILES
    "/Users/andy/mycode/libevent/include/event2/buffer.h"
    "/Users/andy/mycode/libevent/include/event2/bufferevent.h"
    "/Users/andy/mycode/libevent/include/event2/bufferevent_compat.h"
    "/Users/andy/mycode/libevent/include/event2/bufferevent_struct.h"
    "/Users/andy/mycode/libevent/include/event2/buffer_compat.h"
    "/Users/andy/mycode/libevent/include/event2/dns.h"
    "/Users/andy/mycode/libevent/include/event2/dns_compat.h"
    "/Users/andy/mycode/libevent/include/event2/dns_struct.h"
    "/Users/andy/mycode/libevent/include/event2/event.h"
    "/Users/andy/mycode/libevent/include/event2/event_compat.h"
    "/Users/andy/mycode/libevent/include/event2/event_struct.h"
    "/Users/andy/mycode/libevent/include/event2/http.h"
    "/Users/andy/mycode/libevent/include/event2/http_compat.h"
    "/Users/andy/mycode/libevent/include/event2/http_struct.h"
    "/Users/andy/mycode/libevent/include/event2/keyvalq_struct.h"
    "/Users/andy/mycode/libevent/include/event2/listener.h"
    "/Users/andy/mycode/libevent/include/event2/rpc.h"
    "/Users/andy/mycode/libevent/include/event2/rpc_compat.h"
    "/Users/andy/mycode/libevent/include/event2/rpc_struct.h"
    "/Users/andy/mycode/libevent/include/event2/tag.h"
    "/Users/andy/mycode/libevent/include/event2/tag_compat.h"
    "/Users/andy/mycode/libevent/include/event2/thread.h"
    "/Users/andy/mycode/libevent/include/event2/util.h"
    "/Users/andy/mycode/libevent/include/event2/visibility.h"
    "/Users/andy/mycode/libevent/build/include/event2/event-config.h"
    "/Users/andy/mycode/libevent/include/event2/bufferevent_ssl.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/include/evdns.h;/usr/local/include/evrpc.h;/usr/local/include/event.h;/usr/local/include/evhttp.h;/usr/local/include/evutil.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/include" TYPE FILE FILES
    "/Users/andy/mycode/libevent/include/evdns.h"
    "/Users/andy/mycode/libevent/include/evrpc.h"
    "/Users/andy/mycode/libevent/include/event.h"
    "/Users/andy/mycode/libevent/include/evhttp.h"
    "/Users/andy/mycode/libevent/include/evutil.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/cmake/libevent/LibeventConfig.cmake;/usr/local/lib/cmake/libevent/LibeventConfigVersion.cmake")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/lib/cmake/libevent" TYPE FILE FILES
    "/Users/andy/mycode/libevent/build//CMakeFiles/LibeventConfig.cmake"
    "/Users/andy/mycode/libevent/build/LibeventConfigVersion.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev")
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/cmake/libevent/LibeventTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}/usr/local/lib/cmake/libevent/LibeventTargets.cmake"
         "/Users/andy/mycode/libevent/build/CMakeFiles/Export/_usr/local/lib/cmake/libevent/LibeventTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}/usr/local/lib/cmake/libevent/LibeventTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}/usr/local/lib/cmake/libevent/LibeventTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/cmake/libevent/LibeventTargets.cmake")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/lib/cmake/libevent" TYPE FILE FILES "/Users/andy/mycode/libevent/build/CMakeFiles/Export/_usr/local/lib/cmake/libevent/LibeventTargets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "/usr/local/lib/cmake/libevent/LibeventTargets-noconfig.cmake")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
        message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
        message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
file(INSTALL DESTINATION "/usr/local/lib/cmake/libevent" TYPE FILE FILES "/Users/andy/mycode/libevent/build/CMakeFiles/Export/_usr/local/lib/cmake/libevent/LibeventTargets-noconfig.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

file(WRITE "/Users/andy/mycode/libevent/build/${CMAKE_INSTALL_MANIFEST}" "")
foreach(file ${CMAKE_INSTALL_MANIFEST_FILES})
  file(APPEND "/Users/andy/mycode/libevent/build/${CMAKE_INSTALL_MANIFEST}" "${file}\n")
endforeach()
