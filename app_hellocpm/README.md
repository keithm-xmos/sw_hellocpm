# Prerequisites

`CMake` version 3.14 or newer is required to build this example.  You can download `CMake` here https://cmake.org/. In fact, the `cmake` application will return an error if you attempt to build with an earlier version.

# Building

To build, run the following commands:

    $ cmake -B build
    $ cmake --build build --target install

The first command above is the configure step.  The `-B build` argument instructs `cmake` to perform an out-of-source configure in the `build` directory.  `cmake` will create this directory if it does not exist.  It is during this configure step that the fetching of dependencies takes place.

The second command above is the build step.  The `--build build` argument directs `cmake` where to perform the build and the `--target install` argument specifies the build target.

It is also possible to build using the old-fashioned, perhaps more familiar method:

    $ mkdir build
    $ cd build
    $ cmake ../
    $ make install

Note, out-of-source builds are almost always preferred because all build artifacts can be removed simply by removing the `build` folder.  In this application, `cmake` is instructed to prohibit an in-source build.

To run the firmware:

    $ xrun --io bin/helloworld.xe

To *really* clean and start over, run:

    $ ./really_clean.sh
