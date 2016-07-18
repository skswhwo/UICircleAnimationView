//
//  ViewController.m
//  UICircleAnimationView
//
//  Created by ChoJaehyun on 2016. 7. 18..
//  Copyright © 2016년 com.skswhwo. All rights reserved.
//

#import "ViewController.h"
#import "UICircleAnimationView.h"
@interface ViewController ()
{
    UICircleAnimationView *circleView1;
    UICircleAnimationView *circleView2;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    circleView1 = [UICircleAnimationView getCircleView:CGRectMake(80, 40, 200, 200)];
    [circleView1 setHideCirclePoint:YES];
    [self.view addSubview:circleView1];
    [circleView1 strokeCircleTo:10 total:15 withAnimate:YES];

    circleView2 = [UICircleAnimationView getCircleView:CGRectMake(80, 300, 150, 150)];
    [circleView2 setDuration:2];
    [circleView2 setForegroundStrokeColor:[UIColor blackColor]];
    [self.view addSubview:circleView2];
    [circleView2 strokeCircleTo:80 total:100 withAnimate:YES];
}

- (IBAction)startButtonClicked:(id)sender
{
    [circleView1 strokeCircleTo:10 total:15 withAnimate:YES];
    [circleView2 strokeCircleTo:80 total:100 withAnimate:YES];
}

@end
