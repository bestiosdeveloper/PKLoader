# PKLoader

[![CocoaPods](https://img.shields.io/cocoapods/p/FaveButton.svg)](https://cocoapods.org/pods/PKLoader)
[![codebeat badge](https://codebeat.co/badges/580517f8-efc8-4d20-89aa-900531610144)](https://codebeat.co/projects/github-com-kumarpramod017-pkloader-master)

A Swift based helper class that will provide the loader for your application, on a view or on the window.


![preview](https://github.com/kumarpramod017/PKLoader/blob/master/PKLoader.gif)


## Requirements

- iOS 10.0+
- Xcode 9.4

## Installation

For manual instalation, drag Source folder into your project.

or use [CocoaPod](https://cocoapods.org) adding this line to you `Podfile`:

```ruby
pod 'PKLoader'
```

## Usage

#### For Start Loading

1) Just call `startAnimating()` method with `shared` instance of `PKLoader`

Example:

```swift
//If you want to show the loader on window/full screen, Use:
PKLoader.shared.startAnimating()

//If you want to convert any UIView, UIButton, UILabel etc. in to loader, Use:
PKLoader.shared.startAnimating(onView: <instance_of_your_view>)
```


#### For Stop Loading

1) Just call `stopAnimating()` method with `shared` instance of `PKLoader`

Example:

```swift
PKLoader.shared.stopAnimating()
```

## Configuration To Chnage Animation 

To change the default configuration of the loader just change the values of  `PKLoaderSettings`, Like:

### Important Property:

1) `indicatorType` used to decide the loader animation type. Default: `PKLoader.IndicatorType.ballRotateChase`

#### Properties Only Useful in Case of Full Screen Loader

1) `backgroundSize` used to give the size for the background view.  Default: `CGSize(width: 100.0, height: 100.0)`

2) `backgroundColor` used to give the background color for the background view. Default: `UIColor.white`

3) `cornerRadius` used to give the corner radius for the background view. Default: `10.0`

4) `indicatorSize` used to give the default size for the indicator animation.  Default: `CGSize(width: 20.0, height: 20.0)`

5) `indicatorColor` used to give the color for the indicator animation.  Default: `UIColor.gray`

#### Properties Useful in Both Case 

1) `indicatorPadding` used to give the padding for the indicator animation.  Default: `UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)`

1) `shouldMakeRound` decides weather make the passed view circular or not.  Default: `true`


## Licence

PKLoader is released under the MIT license.











