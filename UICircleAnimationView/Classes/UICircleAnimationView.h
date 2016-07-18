
#import <UIKit/UIKit.h>

@interface UICircleAnimationView : UIView

@property (nonatomic, assign) float lineWidth;
@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, strong) CALayer *circlePoint;

+ (UICircleAnimationView *)getCircleView:(CGRect)rect;

#pragma mark - Setter
- (void)setForegroundStrokeColor:(UIColor *)foregroundStrokeColor;
- (void)setBackgroundStrokeColor:(UIColor *)backgroundStrokeColor;
- (void)setHideCirclePoint:(BOOL)hideCirclePoint;

#pragma mark - Trigger
- (void)strokeCircleTo:(NSInteger)currunt total:(NSInteger)total withAnimate:(BOOL)animate;

@end
