//
//  CircleAnimationView.m
//  LearningCard
//
//  Created by ChoJaehyun on 2016. 1. 29..
//  Copyright © 2016년 Classting. All rights reserved.
//

#import "UICircleAnimationView.h"

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@interface UICircleAnimationView ()
@property (nonatomic, strong) CAShapeLayer *progressCircle;
@property (nonatomic, strong) CAShapeLayer *backgroundCircle;
@end

@implementation UICircleAnimationView
+ (UICircleAnimationView *)getCircleView:(CGRect)rect
{
    UICircleAnimationView *view = [[UICircleAnimationView alloc] initWithFrame:rect];
    return view;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self initializer];
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    [self initializer];
    return self;
}
- (void)initializer
{
    self.backgroundColor = [UIColor clearColor];
    float lineWidth = 4;
    self.duration = 1.0;

    self.progressCircle                 = [CAShapeLayer layer];
    self.progressCircle.backgroundColor = [UIColor whiteColor].CGColor; //
    self.progressCircle.lineCap         = kCALineCapSquare;
    self.progressCircle.fillColor       = [UIColor clearColor].CGColor;
    self.progressCircle.strokeColor     = [UIColor greenColor].CGColor;
    self.progressCircle.strokeEnd       = 1.0;
    self.progressCircle.zPosition       = 1;
    
    self.circlePoint                    = [CALayer layer];
    self.circlePoint.frame              = CGRectMake(0, 0, 12, 12);
    self.circlePoint.borderWidth        = lineWidth;
    self.circlePoint.cornerRadius       = 6;
    self.circlePoint.borderColor        = [UIColor greenColor].CGColor;
    self.circlePoint.backgroundColor    = [UIColor whiteColor].CGColor;
    
    UIBezierPath *circlePath            = [self getCirclePath:1];
    self.backgroundCircle               = [CAShapeLayer layer];
    self.backgroundCircle.path          = circlePath.CGPath;
    self.backgroundCircle.lineCap       = kCALineCapRound;
    self.backgroundCircle.fillColor     = [UIColor clearColor].CGColor;
    self.backgroundCircle.strokeColor   = [UIColor lightGrayColor].CGColor;
    self.backgroundCircle.strokeEnd     = 1.0;
    self.backgroundCircle.zPosition     = 0;
    
    [self.layer addSublayer:self.backgroundCircle];
    [self.layer addSublayer:self.progressCircle];
    [self.progressCircle addSublayer:self.circlePoint];
    
    [self setLineWidth:lineWidth];
    self.circlePoint.position = [self getPositionAtAngle:DEGREES_TO_RADIANS([self getAngle:0])];
}

#pragma mark - Setter
- (void)setForegroundStrokeColor:(UIColor *)foregroundStrokeColor
{
    self.circlePoint.borderColor    = foregroundStrokeColor.CGColor;
    self.progressCircle.strokeColor = foregroundStrokeColor.CGColor;
}
- (void)setBackgroundStrokeColor:(UIColor *)backgroundStrokeColor
{
    self.backgroundCircle.strokeColor = [UIColor lightGrayColor].CGColor;
}
- (void)setHideCirclePoint:(BOOL)hideCirclePoint
{
    [self.circlePoint setHidden:hideCirclePoint];
}
- (void)setLineWidth:(float)lineWidth
{
    self.progressCircle.lineWidth   = lineWidth;
    self.backgroundCircle.lineWidth = lineWidth;
}

#pragma mark - Trigger
- (void)strokeCircleTo:(NSInteger)currunt total:(NSInteger)total withAnimate:(BOOL)animate
{
    float progress = (float)currunt/(float)total;
    UIBezierPath *path = [self getCirclePath:progress];
    self.circlePoint.position = [self getPositionAtAngle:DEGREES_TO_RADIANS([self getAngle:progress])];
    self.progressCircle.path = path.CGPath;
    if (animate) {
        [self addCircleAnimation];
    }
}

- (void)addCircleAnimation
{
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = self.duration;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnimation.fromValue = @(0.0f);
    pathAnimation.toValue = @(1);
    [self.progressCircle addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
    
    CAKeyframeAnimation *penAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    penAnimation.duration = self.duration;
    penAnimation.path = self.progressCircle.path;
    penAnimation.removedOnCompletion = NO;
    penAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    penAnimation.calculationMode = kCAAnimationPaced;
    [self.circlePoint addAnimation:penAnimation forKey:@"position"];
}

#pragma mark - Private
- (UIBezierPath *)getCirclePath:(float)progress
{
    CGFloat startAngle = [self getAngle:0];
    CGFloat endAngle = [self getAngle:progress];
    return [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2.0f, self.bounds.size.height/2.0f)
                                          radius:[self getRadius]
                                      startAngle:DEGREES_TO_RADIANS(startAngle)
                                        endAngle:DEGREES_TO_RADIANS(endAngle)
                                       clockwise:YES];
}

- (CGPoint)getPositionAtAngle:(CGFloat)theta
{
    float radius = [self getRadius];
    CGPoint point = CGPointZero;
    point.x = self.center.x + radius * cos(theta);
    point.y = self.center.y + radius * sin(theta);
    point.x -= self.frame.origin.x;
    point.y -= self.frame.origin.y;
    return point;
}

- (float )getAngle:(float)progress
{
    return (-90+360.0f*progress);
}
- (float)getRadius
{
    return (self.bounds.size.height * 0.5) - (self.lineWidth/2.0f);
}

@end
