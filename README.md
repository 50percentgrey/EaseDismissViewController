# EaseDismissViewController
The simplest way to dismiss your ViewControllers with gesture (Just like Instragram dismiss model)


###Screenshot 

![EaseDismissViewController](https://raw.githubusercontent.com/50percentgrey/EaseDismissViewController/master/assets/screenshot.gif)


#Getting Started

Import ```EaseDismissViewControllerDelegate.h``` to your AppDelegate.m:
```objc
#import "EaseDismissViewControllerDelegate.h"
```
create a strong referece:

```objc
@interface AppDelegate ()

@property (nonatomic, strong) EaseDismissViewControllerDelegate *easeDismissViewControllerDelegate;

@end
```

and in ```application didFinishLaunchingWithOptions``` instanciates and set as delegate to the main ```UINavigationViewController```

```objc
	// get your main Navigation Controller
    UINavigationController *navigationController = (UINavigationController *) self.window.rootViewController;
    // instanciate EaseDismissViewControllerDeleagte
    self.easeDismissViewControllerDelegate = [EaseDismissViewControllerDelegate new];
    // set EDVCD as NC's delegate
    navigationController.delegate = self.easeDismissViewControllerDelegate;
    // set NC as a reference to EDVCD
    self.easeDismissViewControllerDelegate.navigationController = navigationController;
    // initialize EDVCD and it's done!
    [self.easeDismissViewControllerDelegate initialize];
```

That's all you need to do to use it.