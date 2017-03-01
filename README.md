# Libxml2Module
Wrapper over xml2 lib to use it in Objective-C modules with `@import Libxml2;` for iOS Simulator and iOS Device.

You need to add conditional import by platform for correct usage in Objective-C:
``` objective-c
// this is base module
@import Libxml2;

// conditional import for child module for necessary platform
#if TARGET_OS_SIMULATOR
@import Libxml2Simulator;
#else
@import Libxml2Device;
#endif
```