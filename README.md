# HongshiLogin

[![CI Status](http://img.shields.io/travis/龚欢/HongshiLogin.svg?style=flat)](https://travis-ci.org/龚欢/HongshiLogin)
[![Version](https://img.shields.io/cocoapods/v/HongshiLogin.svg?style=flat)](http://cocoapods.org/pods/HongshiLogin)
[![License](https://img.shields.io/cocoapods/l/HongshiLogin.svg?style=flat)](http://cocoapods.org/pods/HongshiLogin)
[![Platform](https://img.shields.io/cocoapods/p/HongshiLogin.svg?style=flat)](http://cocoapods.org/pods/HongshiLogin)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

HongshiLogin is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "HongshiLogin"
```

## Use 

### steps

#### One Step:
```
#import "HSWLLoginConstant.h"
```

#### Two Step:

*You can use finsishBlcok call back*

```
HSWLLoginManager *loginManager = [[HSWLLoginManager alloc] init];
[loginManager showAddTo:self finishedBlock:nil];
```

#### Using Delegate to handle Methods

#### add delelget to instance

```
loginManager.delegate = self;
```

```
@interface XXXViewController ()<HSWLLoginManagerDelegate>

@end
``` 

#### delegate methods according to the Types

```
- (void)HSWLViewWillShowWhichType:(HSWLShowStyle)ToType {
   NSLog(@"%ld will show", (long)ToType);
}

- (void)HSWLViewDidShowWhichType:(HSWLShowStyle)ToType {
   NSLog(@"%ld did show", (long)ToType);
}

```

#### types -->

```
typedef NS_ENUM(NSInteger, HSWLShowStyle) {
    HSWLLogin = 99,
    HSWLRegister,
    HSWLForgetPassword,
    HSWLFollowDetails
};

```







## Author

John, gonghuan2020@gmail.com

## License

HongshiLogin is available under the MIT license. See the LICENSE file for more info.
