//
//  DPARipple.m
//  DigitalPond
//
//  Created by MadArkitekt on 5/14/14.
//  Copyright (c) 2014 Ed Salter. All rights reserved.
//

#import "DPARipple.h"

@implementation DPARipple

/**
 :parm: CGRect, framing the UIView
 :return: self
 */
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) {
        NSLog(@"DPARipple Failure to Initialize");
    }
    return self;
}

- (void)didMoveToWindow {
    for (int i = 0; i < self.rippleCount; i++) {
        float delayAmount = (self.rippleLifeTime / self.rippleCount) * 1.75 * i;
        [self rippleLineWithDelay:delayAmount];
    }
}

- (void)rippleLineWithDelay:(float)delay {
    UIView  *rippleTrace = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    rippleTrace.backgroundColor = self.tintColor;
    [self addSubview:rippleTrace];
    [UIView animateWithDuration:self.rippleLifeTime delay:delay options:UIViewAnimationOptionCurveEaseOut animations:^{
        //Creates frame to the left and above the last rendered polygon
        rippleTrace.frame = CGRectMake(-40, -40, 60, 60);
        rippleTrace.layer.cornerRadius = 50;
        rippleTrace.alpha = 0;
    } completion:^(BOOL finished) {
        [rippleTrace removeFromSuperview];
    }];
}

@end
