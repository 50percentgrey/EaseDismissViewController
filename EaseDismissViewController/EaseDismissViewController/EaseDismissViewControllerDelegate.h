//
//  EaseDismissViewControllerDelegate.h
//  EaseDismissViewController
//
//  Created by Antonio Junior on 10/8/15.
//  Copyright © 2015 Antonio Junior. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Animator.h"

@interface EaseDismissViewControllerDelegate : NSObject <UINavigationControllerDelegate>

@property (nonatomic, weak) IBOutlet UINavigationController *navigationController;

- (void) initialize;

@end
