# UICircleAnimationView

Circle animating view with a small circle point.
![alt text](https://github.com/skswhwo/UICircleAnimationView/blob/master/sample1.gif "demo")

## Installation

UICircleAnimationView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

`
pod "UICircleAnimationView"
`

And then run:

`
$ pod install
`

## Usage

### Init
```objective-c
+ (UICircleAnimationView *)getCircleView:(CGRect)rect;
```

### Trigger
```objective-c
- (void)strokeCircleTo:(NSInteger)currunt total:(NSInteger)total withAnimate:(BOOL)animate;
```

### Setter
```objective-c
- (void)setForegroundStrokeColor:(UIColor *)foregroundStrokeColor;
- (void)setBackgroundStrokeColor:(UIColor *)backgroundStrokeColor;
- (void)setHideCirclePoint:(BOOL)hideCirclePoint;
```

### Properties
```objective-c
@property (nonatomic, assign) float lineWidth;          //default 4
@property (nonatomic, assign) NSTimeInterval duration;  //default 1.0f
@property (nonatomic, strong) CALayer *circlePoint;
```

## Author

skswhwo, skswhwo@gmail.com

## License

UICircleAnimationView is available under the MIT license. See the LICENSE file for more info.
