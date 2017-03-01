# CommonCryptoModule
Wrapper over Common Crypto lib to use it in Objective-C modules with `@import CommonCrypto;` for iOS Simulator and iOS Device.

You need import to add conditions by platform for correct usage in Objective-C:
``` objective-c
// this is base module
@import CommonCrypto;

// conditional import for child module for necessary platform
#if TARGET_OS_SIMULATOR
@import CommonCryptoSimulator;
#else
@import CommonCryptoDevice;
#endif
```