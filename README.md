# EaseDismissViewController
The simplest way to dismiss your ViewControllers with gesture (Just like Instragram dismiss model)


###Screenshot 

![EaseDismissViewController](https://raw.githubusercontent.com/50percentgrey/EaseDismissViewController/master/assets/screenshot.gif)


#Getting Started

Import to your XCode project all files inside ```EaseDismissViewController``` folder:
```
Animator.h
Animator.m
EaseDismissViewControllerDelegate.h
EaseDismissViewControllerDelegate.m
```

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


#MIT License

    The MIT License (MIT)

    Copyright (c) 2015 Antonio Junior

    Permission is hereby granted, free of charge, to any person obtaining a copy of
    this software and associated documentation files (the "Software"), to deal in
    the Software without restriction, including without limitation the rights to
    use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
    the Software, and to permit persons to whom the Software is furnished to do so,
    subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
    FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
    COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
    IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
    CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.