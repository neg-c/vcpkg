vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  neg-c/psm
  REF
  "v${VERSION}"
  SHA512
  060dc65b46c0c1258994358f352a7a2db5a9a7e221a1d62d6978da83ca5930b2bd4bdcb141ad1e444adf5d11dd823cee95118a3b54fd5dcf4fa82b1a1034b486
  HEAD_REF
  main)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}" OPTIONS -DBUILD_PSM_CLI=OFF
                      -DBUILD_PSM_GUI=OFF)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME "psm" CONFIG_PATH lib/cmake/psm)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage"
     DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
