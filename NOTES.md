# Other Notes of Interest

This example implements an approach where dependencies provide a lib_something.cmake file which specifies source, includes, build flags, etc....  This blog-of-files approach is similar to how `module_build_info`-based systems work.

A reference design application project like this one should be open to using git submodules.  This example follow the sandbox approach for demonstration purposes.  And, because many of our in-house utilities depend on the sandbox folder structure.

To avoid re-downloading dependencies, CPM has an option `CPM_SOURCE_CACHE`.  Read more here: https://github.com/cpm-cmake/CPM.cmake#cpm_source_cache

CPM supports a [Package lock](https://github.com/cpm-cmake/CPM.cmake/wiki/Package-lock).  This has not been explored yet to determine it's usefulness.

# Next Steps

Demonstrate to more people.

## Limitations

These are cribbed from the [CPM README](https://github.com/cpm-cmake/CPM.cmake/blob/master/README.md) with some notes added.

**No pre-built binaries** For every new build directory, all dependencies are initially downloaded and built from scratch. To avoid extra downloads it is recommend to set the [`CPM_SOURCE_CACHE`](https://github.com/cpm-cmake/CPM.cmake#cpm_source_cache) environmental variable.

*It may take using CPM in a real project in order to see how problematic this is.*


**Dependent on good CMakeLists** Many libraries do not have CMakeLists that work well for subprojects.

*Same is true at XMOS. We will need to add them to our libraries.  But, we do not necessarilly need to build those libraries with CMake.*


**First version used** In diamond-shaped dependency graphs (e.g. `A` depends on `C`@1.1 and `B`, which itself depends on `C`@1.2 the first added dependency will be used (in this case `C`@1.1). In this case, B requires a newer version of `C` than `A`, so CPM will emit a warning. This can be easily resolved by adding a new version of the dependency in the outermost project, or by introducing a [package lock file](https://github.com/cpm-cmake/CPM.cmake/wiki/Package-lock).

         A
        /  \
    C@1.1   B
             \
             C@1.2

*Will use C@1.1 and emit a warning*