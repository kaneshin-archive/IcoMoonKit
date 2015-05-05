# IcoMoonKit

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

IcoMoonKit is an iconic font library written in Swift.

And, It provides code generator for vendor such an [IcoMoon](https://icomoon.io/).

## Requirement

- Xcode 6.3+
- iOS
    - 8.0+ (Available as a dynamic framework)
    - 7.0+ (Swift code is compatible)
- OSX
    - Not yet supported.
- Go, Ruby (If you want to use tools.)

## Installation

### Dynamic Framework

#### Carthage

1. Add the following to your *Cartfile*: `github "kaneshin/IcoMoonKit" ~> 0.1`.
2. Run `carthage update`.
3. Add IcoMoonKit as an embedded framework.

#### Submodule

1. Clone `IcoMoonKit` as a git submodule.
2. Add `IcoMoonKit.xcodeproj` file into your Xcode project.
3. Link `IcoMoonKit.framework` product for your target.
4. Embed `IcoMoonKit.framework`.

### Tools

#### IcoMoon Generator

** Underconstructing **

```
$ go get github.com/kaneshin/IcoMoonKit/tools/icom
```


## Usage

Add generated code into your project if you use [generator](https://github.com/kaneshin/IcoMoonKit/tree/master/tools).

```swift
var feather = FeatherGlyph.AirPlay(size: 40, color: UIColor.whiteColor())
feather.color = UIColor.blackColor()
feather.backgroundColor = UIColor.whiteColor()

// As an image
imageView.image = feather.image(size: frame.size)

// An a text
label.attributedText = feather.attributedText
```

### IcoMoon Generator

See [tools/README.md](https://github.com/kaneshin/IcoMoonKit/tree/master/tools).


## License

[The MIT License (MIT)](http://kaneshin.mit-license.org/)


## Author

[Shintaro Kaneko](https://github.com/kaneshin) <kaneshin0120@gmail.com>

