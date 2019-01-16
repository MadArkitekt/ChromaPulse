//
//  DPAPondVC.m
//  DigitalPond
//
//  Created by MadArkitekt on 5/14/14.
//  Copyright (c) 2014 Ed Salter. All rights reserved.
//

#import "DPAPondVC.h"
#import "DPARipple.h"

@implementation DPAPondVC {
    //Array containing UIColors of background views
    NSArray *colors;
    NSMutableArray *backgrounds;
    
    //Index of the background currently occupying the screen
    int currentBackground;
    NSInteger instanceIndex;
    __weak IBOutlet UIVisualEffectView *swipeArea;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.multipleTouchEnabled = YES;
        currentBackground = 0;

        backgrounds = [@[]mutableCopy];

        [self.view addSubview:swipeArea];

        colors = @[
                   [UIColor colorWithRed:0.949 green:0.906 blue:0.992 alpha:1.00],
                   [UIColor colorWithRed:0.855 green:0.706 blue:0.992 alpha:1.00],
                   [UIColor colorWithRed:0.729 green:0.541 blue:0.976 alpha:1.00],
                   [UIColor colorWithRed:0.596 green:0.392 blue:0.984 alpha:1.00],
                   [UIColor colorWithRed:0.498 green:0.267 blue:0.969 alpha:1.00],
                   [UIColor colorWithRed:0.384 green:0.129 blue:0.918 alpha:1.00],
                   [UIColor colorWithRed:0.337 green:0.125 blue:0.894 alpha:1.00],
                   [UIColor colorWithRed:0.216 green:0.086 blue:0.690 alpha:1.00],
                   [UIColor colorWithRed:0.188 green:0.071 blue:0.600 alpha:1.00]
                   ];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

}

- (void)viewWillAppear:(BOOL)animated {
    UIView *bgView = [[UIView alloc] initWithFrame:self.view.frame];
    bgView.backgroundColor = colors[currentBackground];
    [self.view insertSubview:bgView atIndex:0];
    [backgrounds addObject:bgView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark UITouch Methods
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [self createRipplesWithTouches:touches andEvent:event];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self createRipplesWithTouches:touches andEvent:event];
}

#pragma mark UISwipeGestureRecognizer Methods
- (IBAction)handleSwipeRight:(UISwipeGestureRecognizer *)sender {
    [self swipeGestureHandler:sender];
}

- (IBAction)handleSwipeLeft:(UISwipeGestureRecognizer *)sender {
    [self swipeGestureHandler:sender];
}

- (void)swipeGestureHandler:(UISwipeGestureRecognizer *)gesture {
    NSLog(@"%@",gesture);
    NSLog(@"%d",(int)gesture.direction);
    
    int direction = (gesture.direction == 1) ? 1 : -1;
    
    currentBackground += direction;
    if(currentBackground == [colors count]) currentBackground = 0;
    if(currentBackground == -1) currentBackground = (int)[colors count] - 1;
    
    float screenWidth = self.view.frame.size.width;
    float screenHeight = self.view.frame.size.height;
    
    UIView * presentingBGView = [[UIView alloc] initWithFrame:CGRectMake((screenWidth * -direction), 0, screenWidth, screenHeight)];
    presentingBGView.backgroundColor = colors[currentBackground];
    
    [self.view insertSubview:presentingBGView atIndex:0];
    
    [backgrounds addObject:presentingBGView];
    
    for (UIView *view in backgrounds) {
        NSInteger index = [backgrounds indexOfObject:view];
        [UIView animateWithDuration:1.0 animations:^{
            view.frame = CGRectMake(view.frame.origin.x + (screenWidth * direction), 0, screenWidth, screenHeight);
        } completion:^(BOOL finished) {
            if (index == 0) {
                [view removeFromSuperview];
                [self->backgrounds removeObject:view];
            }
        }];
    }
}

- (void)createRipplesWithTouches: (NSSet *)touches andEvent:(UIEvent *)event {
    CGPoint locationPoint = [[touches anyObject] locationInView:self.view];
    if ([swipeArea pointInside:locationPoint withEvent:event]) {
        return;
    } else {
        
        NSMutableArray *otherColors = [colors mutableCopy];
        [otherColors removeObjectAtIndex:currentBackground];
        
        for (UITouch *touch in touches) {
            int random = arc4random_uniform( (int)[otherColors count]);
            
            CGPoint location = [touch locationInView:self.view];
            DPARipple *ripple = [[DPARipple alloc] initWithFrame:CGRectMake(location.x, location.y, 0, 0)];
            ripple.rippleCount = 1;
            ripple.rippleLifeTime = 1;
            ripple.tintColor = otherColors[random];
            [self.view addSubview:ripple];
        }
    }
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
