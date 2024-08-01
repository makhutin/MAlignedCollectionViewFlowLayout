# MAlignedCollectionViewFlowLayout
Overridden implementation of the standard UICollectionViewFlowLayout that aligns elements.

## Horizontal aligment
### .center
`flowLayout.horizontalAlignment = .ceneter`

![Example layout for horizontalAlignment = .center](Images/center.png)

### .fill
`flowLayout.horizontalAlignment = .fill`

![Example layout for horizontalAlignment = .fill](Images/fill.png)

### .left
`flowLayout.horizontalAlignment = .left`

![Example layout for horizontalAlignment = .left](Images/left.png)

### .right
`flowLayout.horizontalAlignment = .right`

![Example layout for horizontalAlignment = .right](Images/right.png)

## Vertical aligment
### .center
`flowLayout.verticalAlignment = .center`

![Example layout for verticalAlignment = .center](Images/vCenter.png)

### .top
`flowLayout.verticalAlignment = .top`

![Example layout for verticalAlignment = .top](Images/top.png)

### .bottom
`flowLayout.verticalAlignment = .bottom`

![Example layout for verticalAlignment = .bottom](Images/bottom.png)

## Animation
You can also change the alignment with animation.

```
self.collectionView.performBatchUpdates {
    self.flowLayout.horizontalAlignment = .left
}
```
## Cocoapods

MAlignedCollectionViewFlowLayout is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

`pod 'MAlignedCollectionViewFlowLayout'`

## Swift Package Manager

### SPM Through XCode Project

* File > Swift Packages > Add Package Dependency
* Add `https://github.com/makhutin/MAlignedCollectionViewFlowLayout.git`
* Select "Up to next Major" with "1.0.1"

### SPM Through Xcode Package

Once you have your Swift package set up, add the Git link within the `dependencies` value of your `Package.swift` file.

```swift
dependencies: [
    .package(url: "https://github.com/makhutin/MAlignedCollectionViewFlowLayout.git", .upToNextMajor(from: "1.0.1"))
]
```