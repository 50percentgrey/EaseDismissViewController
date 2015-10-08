//
//  EaseDismissViewControllerDelegate.m
//  EaseDismissViewController
//
//  Created by Antonio Junior on 10/8/15.
//  Copyright © 2015 Antonio Junior. All rights reserved.
//

#import "EaseDismissViewControllerDelegate.h"

@interface EaseDismissViewControllerDelegate(){
    CGPoint _startPosition;
}

@property (nonatomic, strong) Animator *animator;
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactiveController;

@end

@implementation EaseDismissViewControllerDelegate

- (void) initialize
{
    [self awakeFromNib];
}

- (void)awakeFromNib
{
    UIPanGestureRecognizer *gesturePan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    [self.navigationController.view addGestureRecognizer:gesturePan];
    
    self.animator = [Animator new];
}


- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{
    // only apply for dismiss view
    if(operation == UINavigationControllerOperationPop) return self.animator;
    else return nil;
}



#pragma mark - gesture
- (void) panGesture:(UIPanGestureRecognizer *) recognizer
{
    
    if(recognizer.state == UIGestureRecognizerStateBegan)
    {
        // save start position
        _startPosition = [recognizer locationInView:self.navigationController.view];
        
        // tell animator we're interaction
        [self.animator isInteracting:YES];
        
        self.interactiveController = [UIPercentDrivenInteractiveTransition new];
        
        if([self.navigationController viewControllers].count > 1)
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
        
    }else if(recognizer.state == UIGestureRecognizerStateChanged)
    {
   
        CGFloat percentage = [self getPercentageWithRecognizer:recognizer];
        [self.interactiveController updateInteractiveTransition:percentage];
        
    }else if(recognizer.state == UIGestureRecognizerStateEnded)
    {
        CGFloat percentage = [self getPercentageWithRecognizer:recognizer];
        CGFloat speed = [recognizer velocityInView:self.navigationController.view].x;
        
        // apply snap
        if(percentage < 0.2f && speed < 300.0f) speed = -10;
        if(percentage > 0.4f && speed > -20.0f) speed = 10;
        
        if(speed > 0) {
            [self.interactiveController finishInteractiveTransition];
        }else{
            [self.interactiveController cancelInteractiveTransition];
        }
        
        _startPosition = CGPointZero;
        self.interactiveController = nil;
        
        // tell animator we stop interaction
        [self.animator isInteracting:NO];
    }

}

- (CGFloat) getPercentageWithRecognizer:(UIPanGestureRecognizer *) recognizer
{
    // get position
    CGPoint position = [recognizer locationInView:self.navigationController.view];
    // calibrate percentage position
    return (position.x-_startPosition.x) / CGRectGetWidth(self.navigationController.view.bounds);
}


- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    return self.interactiveController;
}

@end
