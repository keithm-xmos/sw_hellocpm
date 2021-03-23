#NOTE: Including CPM and the sandbox_add macro could be in a CMake util,
#        potentially distributed with the toolchain

include(${CMAKE_SOURCE_DIR}/../cmake/CPM.cmake)

macro(sandbox_add CODEDOMAIN LOCATION TAG)
  #NOTE: perhaps a SOURCE_DIR up 2 folders isn't what we want in all cases.
  #       this could be parameterized if necessary
  
  set(CODEDOMAIN_DIR "${CMAKE_SOURCE_DIR}/../../${CODEDOMAIN}")

  # fetch the repository
  CPMAddPackage(
    NAME ${CODEDOMAIN}
    GIT_REPOSITORY ${LOCATION}
    GIT_TAG ${TAG}
    GIT_SHALLOW
    DOWNLOAD_ONLY
    SOURCE_DIR  ${CODEDOMAIN_DIR}
  )

  string(TOUPPER "${CODEDOMAIN}" UPPER_CODEDOMAIN)

  set("USE_${UPPER_CODEDOMAIN}" TRUE)
  set("${UPPER_CODEDOMAIN}_DIR" ${CODEDOMAIN_DIR})
  
  # include the cmake file (if it exists)
  set(DESTINATION_CMAKE "${CODEDOMAIN_DIR}/${CODEDOMAIN}/${CODEDOMAIN}.cmake")
  if(EXISTS ${DESTINATION_CMAKE})
   include(${DESTINATION_CMAKE})
  endif()
  
endmacro()

# add Dependencies
# sandbox_add(audio_test_tools               git@github.com:xmos/audio_test_tools               b8e89bd2af1e42888432e7763aa51d96f5136eba)
# sandbox_add(lib_aec                        git@github.com:xmos/lib_aec                        0d86d312e4d15671300221e58f8e99294d33e941)
# sandbox_add(lib_agc                        git@github.com:xmos/lib_agc                        8fbacb52d8274153d18179af9fb2e372c37b11dc)
# sandbox_add(lib_ai                         git@github.com:xmos/lib_ai                         ffce092676002ea47a166b306c4d922ca112bbe8)
# sandbox_add(lib_audio_pipelines            git@github.com:xmos/lib_audio_pipelines            838196984ac79ac66fb18bdc93cd2b474e489588)
# sandbox_add(lib_device_control             git@github.com:xmos/lib_device_control             d3081f8e5083d7194e509f0b8a12585b5d314506)
# sandbox_add(lib_dfu                        git@github.com:xmos/lib_dfu                        eaed448fb230ebfc063b4eba35eb3f99b14d6635)
# sandbox_add(lib_dsp                        git@github.com:xmos/lib_dsp                        3da36a265d787781d28fd7f45bbf573b911ed79e)
# sandbox_add(lib_flash_data_partition       git@github.com:xmos/lib_flash_data_partition       1f2c2b75d5568733c05c1a739422a7cf5a8422ec)
# sandbox_add(lib_gpio                       git@github.com:xmos/lib_gpio                       9bcc0566cb3e6752b389e3c2ff3bd644277ea591)
# sandbox_add(lib_i2c                        git@github.com:xmos/lib_i2c                        64cbedcc50484a97b13bd341e1f4b457221c483f)
# sandbox_add(lib_i2s                        git@github.com:xmos/lib_i2s                        9c521d0a93eefaf9381eeb70d70835838fa8eba6)
# sandbox_add(lib_interference_canceller     git@github.com:xmos/lib_interference_canceller     8599951a51ce6fbe8ec4533e86e5824d5fd55c25)
#NOTE: lib_logging uses a fork to demonstrate how sources could be included
#sandbox_add(lib_logging                    git@github.com:xmos/lib_logging                    09c77b06920afc1d3ddc70f377fe92a0bec46e0f)
sandbox_add(lib_logging                    git@github.com:keithm-xmos/lib_logging                    364739bab69ac28ebead4130867e82fef56dc40e)
# sandbox_add(lib_mic_array                  git@github.com:xmos/lib_mic_array                  4726f4490a9e8aa8931de287a564efc907454bac)
# sandbox_add(lib_ndp                        git@github0.xmos.com:xmos-int/lib_ndp              ed7814245836c01638c66ccf5caf2ec8d9a757e8)
# sandbox_add(lib_noise_suppression          git@github.com:xmos/lib_noise_suppression          e74b12401fe5213fb831f46c7741622489e02dda)
# sandbox_add(lib_spdif                      git@github.com:xmos/lib_spdif                      11eaed1fd47b477985c76548cb429de81cfa3ae0)
# sandbox_add(lib_spi                        git@github.com:xmos/lib_spi                        d396640539129aa89a913dda6760b1ead2c51186)
# sandbox_add(lib_src                        git@github.com:xmos/lib_src                        ba1bac9487f5b42f15def29218c3f7e4f5df8ca9)
# sandbox_add(lib_vad                        git@github.com:xmos/lib_vad                        47f3c7d8908d9c4deee44734e635f23a85987e77)
# sandbox_add(lib_voice_toolbox              git@github.com:xmos/lib_voice_toolbox              6b239cd4b68e030153687e1259152bb57585bdd6)
# sandbox_add(lib_xassert                    git@github.com:xmos/lib_xassert                    38aaa8aafa976a1194e9f88af89ba49e90afd6c8)
# sandbox_add(lib_xua                        git@github.com:xmos/lib_xua                        758de74946a0a7523599e1e681db1473ad2e37de)
# sandbox_add(lib_xud                        git@github.com:xmos/lib_xud                        0c05b9e2db91efd6d0463edaa3e9b80c7b2000af)
# sandbox_add(Unity                          git@github.com:xmos/Unity                          0e50926b52d8f27bfaa3b7c43e04c98f4f98ad21)

# add Infrastructure
# sandbox_add(xscope_fileio                  git@github.com:xmos/xscope_fileio                  v0.2.0)
# sandbox_add(xtagctl                        git@github0.xmos.com:xmos-int/xtagctl              v1.2.0)
# sandbox_add(infr_apps                      git@github.com:xmos/infr_apps                      bdb4b0d75583b2713d4195588ccb0db564a46fdd)
# sandbox_add(infr_scripts_pl                git@github.com:xmos/infr_scripts_pl                227ca03fe0b6c4382579101e8b3672b34f8668b7)
# sandbox_add(infr_scripts_py                git@github.com:xmos/infr_scripts_py                3feea7782e4b890ec0cbc329655731748806e35a)
# sandbox_add(lib_cognidox                   git@github0.xmos.com:xmos-int/lib_cognidox         1684fb293bab72a9b7f1ee494099fa0380e27011)
# sandbox_add(lib_docref_py                  git@github0.xmos.com:xmos-int/lib_docref_py        def7ff4c9d7ae95d0effb463d15db736c9e16ef4)
# sandbox_add(lib_logging_py                 git@github0.xmos.com:xmos-int/lib_logging_py       1b42da64cfc93a6fe7184db375847808dc99aa88)
# sandbox_add(lib_subprocess_py              git@github0.xmos.com:xmos-int/lib_subprocess_py    4b30bc6f6447b7415e4cc0f428ef1b8374ca4bf0)
# sandbox_add(lib_xmlobject_py               git@github0.xmos.com:xmos-int/lib_xmlobject_py     63f3eb78714ddc7ef08d33bf05cd5477fadf3619)
# sandbox_add(lib_yaml_py                    git@github0.xmos.com:xmos-int/lib_yaml_py          547a3eb5635b5d2e724c431cab98106967382ac7)
# sandbox_add(tools_released                 git@github0.xmos.com:xmos-int/tools_released       3f09c8a47685e45b3a2c9a626cf2c1047805bd98)
# sandbox_add(tools_xmostest                 git@github0.xmos.com:xmos-int/tools_xmostest       1e2d0097624e0df9c92981d2fc652fda3f81b9e2)
# sandbox_add(xdoc_released                  git@github0.xmos.com:xmos-int/xdoc_released        37ed217166f156d9938df4e627efa93a18978db8)
