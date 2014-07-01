//
//  DPARip.m
//  DigitalPond
//
//  Created by MadArkitekt on 5/14/14.
//  Copyright (c) 2014 Ed Salter. All rights reserved.
//

#import "DPARipple.h"

@implementation DPARipple

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

-(void)didMoveToWindow
{
    for (int i = 0; i < self.rippleCount; i++)
    {
        float delayAmount = (self.rippleLifeTime / self.rippleCount) * i;
        [self rippleLineWithDelay:delayAmount];
    }
}

-(void)rippleLineWithDelay:(float)delay
{
    UIView  *rippleLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    rippleLine.backgroundColor = self.tintColor;
    [self addSubview:rippleLine];
    [UIView animateWithDuration:self.rippleLifeTime delay:delay options:UIViewAnimationOptionCurveEaseOut animations:^{
        rippleLine.frame = CGRectMake(-40, -40, 80, 80);
//      rippleLine.layer.cornerRadius = 40;
        rippleLine.alpha = 0;
    } completion:^(BOOL finished) {
        [rippleLine removeFromSuperview];
    }];
}

@end
