# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/Users/arnold/Downloads/exone/deps/rocksdb/c_src/../deps/rocksdb"
  "/Users/arnold/Downloads/exone/deps/rocksdb/_build/cmake/rocksdb-prefix/src/rocksdb-build"
  "/Users/arnold/Downloads/exone/deps/rocksdb/_build/cmake/rocksdb-prefix"
  "/Users/arnold/Downloads/exone/deps/rocksdb/_build/cmake/rocksdb-prefix/tmp"
  "/Users/arnold/Downloads/exone/deps/rocksdb/_build/cmake/rocksdb-prefix/src/rocksdb-stamp"
  "/Users/arnold/Downloads/exone/deps/rocksdb/_build/cmake/rocksdb-prefix/src"
  "/Users/arnold/Downloads/exone/deps/rocksdb/_build/cmake/rocksdb-prefix/src/rocksdb-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/Users/arnold/Downloads/exone/deps/rocksdb/_build/cmake/rocksdb-prefix/src/rocksdb-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/Users/arnold/Downloads/exone/deps/rocksdb/_build/cmake/rocksdb-prefix/src/rocksdb-stamp${cfgdir}") # cfgdir has leading slash
endif()
