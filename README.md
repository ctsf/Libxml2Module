# Libxml2Module
Wrapper over xml2 lib to use it in Objective-C modules with `@import Libxml2...;` for iOS Simulator and iOS Device.

You need to add conditional import by platform for correct usage in Objective-C:
``` objective-c
#if TARGET_OS_SIMULATOR
@import Libxml2.Simulator;
#else
@import Libxml2.Device;
#endif
```

Now supports Xcode 8.3
