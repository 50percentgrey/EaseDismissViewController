//
//  Animator.m
//  EaseDismissViewController
//
//  Created by Antonio Junior on 10/8/15.
//  Copyright © 2015 Antonio Junior. All rights reserved.
//

#import "Animator.h"

@interface Animator()

@property (nonatomic, assign) NSTimeInterval timeTransition;

@end

@implementation Animator


- (id) init
{
    if(self = [super init])
    {
        self.timeTransition = .25f;
    }
    return self;
}


- (void) isInteracting:(BOOL)interact
{
    self.timeTransition = (interact) ? .49f : .25f;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return self.timeTransition;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    // frames
    CGRect endFrame = [UIScreen mainScreen].bounds;
    CGRect initFrame = CGRectOffset(endFrame, CGRectGetWidth(endFrame), 0);
    CGRect toFrame = CGRectOffset(endFrame, -100, 0);
    
    // views
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *view = [transitionContext containerView];
    UIView *black = [[UIView alloc] initWithFrame:endFrame];
    black.backgroundColor = [UIColor blackColor];
    black.alpha = .4f;
    
    [view addSubview:toViewController.view];
    [view addSubview:black];
    [view addSubview:fromViewController.view];
    
    // init frames
    fromViewController.view.frame = endFrame;
    toViewController.view.frame = toFrame;
    
    // end frames animation
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{

        black.alpha =  0.0f;
        fromViewController.view.frame = initFrame;
        toViewController.view.frame = endFrame;
        
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
}

@end
