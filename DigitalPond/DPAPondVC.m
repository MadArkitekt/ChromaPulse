//
//  DPAPondVC.m
//  DigitalPond
//
//  Created by MadArkitekt on 5/14/14.
//  Copyright (c) 2014 Ed Salter. All rights reserved.
//

#import "DPAPondVC.h"
#import "DPARipple.h"

@interface DPAPondVC ()
@end

@implementation DPAPondVC {
    NSArray *colors;
    NSMutableArray *backgrounds;
    int currentBackground;
    NSInteger instanceIndex;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        backgrounds = [@[]mutableCopy];
        
        UIButton *swipeArea = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 280, 40)];
        swipeArea.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.1];
        swipeArea.layer.cornerRadius = 20;
        [self.view addSubview:swipeArea];
        
        
        UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
        swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
        
        UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
        swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
        [swipeArea addGestureRecognizer:swipeLeft];
        [swipeArea addGestureRecognizer:swipeRight];

        colors = @[
            [UIColor colorWithRed:0.490f green:0.984f blue:0.306f alpha:1.0f],
            [UIColor colorWithRed:0.984f green:0.553f blue:0.133f alpha:1.0f],
            [UIColor colorWithRed:0.741f green:0.400f blue:0.984f alpha:1.0f],
            [UIColor colorWithRed:0.984f green:0.863f blue:0.098f alpha:1.0f],
            [UIColor colorWithRed:0.000f green:0.000f blue:0.984f alpha:1.0f],
            [UIColor colorWithRed:0.173f green:0.945f blue:0.973f alpha:1.0f],
            [UIColor colorWithRed:0.980f green:0.157f blue:0.961f alpha:1.0f]
        ];

    }
    return self;
}

- (void)swipe:(UISwipeGestureRecognizer *)gesture {
//    NSLog(@"%@", gesture);
//    NSLog(@"%lu", gesture.direction);
    int direction;
    if (gesture.direction == 1) {
        direction = 1;
    } else {
        direction = -1;
    };
//    NSLog(@"direction: %d", direction);
//    int direction = (gesture.direction == 1) ? 1 : -1;
    
    currentBackground += direction;
    
    int colorCount = (int)[colors count];
    if (currentBackground == colorCount) {
    currentBackground = 0;
    };
    
    if (currentBackground == -1) {
        
        currentBackground = colorCount - 1;
    };
    
    float w = self.view.frame.size.width;
    float h = self.view.frame.size.height;
    
    UIView *presentingBGView = [[UIView alloc] initWithFrame:CGRectMake(w, 0, w, h)];
    presentingBGView.multipleTouchEnabled = YES;
    presentingBGView.backgroundColor = colors[currentBackground];
    [self.view insertSubview:presentingBGView atIndex:0];
    [backgrounds addObject:presentingBGView];
    for (UIView *view in backgrounds) {
        [UIView animateWithDuration:1.0 animations:^{
            instanceIndex = [backgrounds indexOfObject:view];
            view.frame = CGRectMake(view.frame.origin.x + w*direction, 0, w, h);
        } completion:^(BOOL finished) {
            if (instanceIndex == 0) {
                [view removeFromSuperview];
                [backgrounds removeObject:view];
            }
        }];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    UIView *bgView = [[UIView alloc] initWithFrame:self.view.frame];
    bgView.backgroundColor = colors[currentBackground];
    [self.view insertSubview:bgView atIndex:0];
    [backgrounds addObject: bgView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [self createRipplesWithTouches:touches];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self createRipplesWithTouches:touches];
}

- (void)createRipplesWithTouches: (NSSet *)touches {
    NSMutableArray *otherColors = [colors mutableCopy];
    [otherColors removeObjectAtIndex:currentBackground];
    
    for (UITouch *touch in touches) {
        int random = arc4random_uniform( (int)[otherColors count]);
        
        CGPoint location = [touch locationInView:self.view];
        DPARipple *ripple = [[DPARipple alloc] initWithFrame:CGRectMake(location.x, location.y, 0, 0)];
        ripple.rippleCount = 3;
        ripple.rippleLifeTime = 2;
        ripple.tintColor = otherColors[random];
        [self.view addSubview:ripple];
    }
}

- (BOOL)prefersStatusBarHidden {
    return YES;
};

@end
