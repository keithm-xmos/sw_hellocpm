#!/usr/bin/env bash

set -e

# remove build area
rm -rf build

# remove all dependencies
rm -rf ../../lib_*
rm -rf ../../infr_*
rm -rf ../../tools_*
rm -rf ../../xdoc_*
rm -rf ../../audio_test_tools
rm -rf ../../Unity
rm -rf ../../xscope_fileio
rm -rf ../../xtagctl
