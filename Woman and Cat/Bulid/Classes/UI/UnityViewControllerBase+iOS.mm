#if PLATFORM_IOS

#import "UnityViewControllerBase.h"
#import "UnityAppController.h"

#include "OrientationSupport.h"
#include "Keyboard.h"
#include "UnityView.h"
#include "PluginBase/UnityViewControllerListener.h"
#include "UnityAppController.h"
#include "UnityAppController+ViewHandling.h"
#include "Unity/ObjCRuntime.h"

// when returning from presenting UIViewController we might need to update app orientation to "correct" one, as we wont get rotation notification
@interface UnityAppController ()
- (void)updateAppOrientation:(UIInterfaceOrientation)orientation;
@end

#ifndef __IPHONE_16_0
@interface UIViewController ()
- (void)setNeedsUpdateOfSupportedInterfaceOrientations;
@end
#endif


@implementation UnityViewControllerBase (iOS)

- (BOOL)shouldAutorotate
{
    return YES;
}

- (BOOL)prefersStatusBarHidden
{
    static bool _PrefersStatusBarHidden = true;

    static bool _PrefersStatusBarHiddenInited = false;
    if (!_PrefersStatusBarHiddenInited)
    {
        NSNumber* hidden = [[[NSBundle mainBundle] infoDictionary] objectForKey: @"UIStatusBarHidden"];
        _PrefersStatusBarHidden = hidden ? [hidden boolValue] : YES;

        _PrefersStatusBarHiddenInited = true;
    }
    return _PrefersStatusBarHidden;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    static UIStatusBarStyle _PreferredStatusBarStyle = UIStatusBarStyleDefault;

    static bool _PreferredStatusBarStyleInited = false;
    if (!_PreferredStatusBarStyleInited)
    {
        NSString* style = [[[NSBundle mainBundle] infoDictionary] objectForKey: @"UIStatusBarStyle"];
        if (style && [style isEqualToString: @"UIStatusBarStyleLightContent"])
            _PreferredStatusBarStyle = UIStatusBarStyleLightContent;

        _PreferredStatusBarStyleInited = true;
    }

    return _PreferredStatusBarStyle;
}

- (UIRectEdge)preferredScreenEdgesDeferringSystemGestures
{
    UIRectEdge res = UIRectEdgeNone;
    if (UnityGetDeferSystemGesturesTopEdge())
        res |= UIRectEdgeTop;
    if (UnityGetDeferSystemGesturesBottomEdge())
        res |= UIRectEdgeBottom;
    if (UnityGetDeferSystemGesturesLeftEdge())
        res |= UIRectEdgeLeft;
    if (UnityGetDeferSystemGesturesRightEdge())
        res |= UIRectEdgeRight;
    return res;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
    return UnityGetHideHomeButton();
}

@end

@implementation UnityDefaultViewController

// these will be updated in one place where we "sync" UI side orientation handling to unity side
NSUInteger _supportedOrientations;
// this will be updated either in viewDidAppear: (when we "start" in a given orient) or in viewWillTransitionToSize: (when we change orient)
ScreenOrientation _currentOrientation;

- (id)init
{
    if ((self = [super init]))
    {
        NSAssert(UnityShouldAutorotate(), @"UnityDefaultViewController should be used only if unity is set to autorotate");
        _supportedOrientations = EnabledAutorotationInterfaceOrientations();
    }
    return self;
}

- (void)updateSupportedOrientations
{
    _supportedOrientations = EnabledAutorotationInterfaceOrientations();
    if (@available(iOS 16.0, *))
        [self setNeedsUpdateOfSupportedInterfaceOrientations];
}

- (NSUInteger)supportedInterfaceOrientations
{
    return _supportedOrientations;
}

- (void)viewWillAppear:(BOOL)animated
{
    _currentOrientation = UIViewControllerOrientation(self);
    [GetAppController() updateAppOrientation: ConvertToIosScreenOrientation(_currentOrientation)];
    [super viewWillAppear: animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    _currentOrientation = UIViewControllerOrientation(self);
    [GetAppController() updateAppOrientation: ConvertToIosScreenOrientation(_currentOrientation)];
    [super viewDidAppear: animated];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    // CODE ARCHEOLOGY: we were using UIViewControllerOrientation, but on showing view with "Requires full screen"
    // CODE ARCHEOLOGY:   we will get the size/orientation *already* set, and the rotation logic would break
    const ScreenOrientation curOrient = _currentOrientation;
    const ScreenOrientation newOrient = OrientationAfterTransform(curOrient, [coordinator targetTransform]);
    _currentOrientation = newOrient;

    // in case of presentation controller it will take control over orientations
    // so to avoid crazy corner cases, make default view controller to ignore "wrong" orientations
    // as they will come only in case of presentation view controller and will be reverted anyway
    // NB: we still want to pass message to super, we just want to skip unity-specific magic
    NSUInteger targetMask = 1 << ConvertToIosScreenOrientation(newOrient);
    if (([self supportedInterfaceOrientations] & targetMask) != 0)
    {
        [UIView setAnimationsEnabled: UnityUseAnimatedAutorotation() ? YES : NO];
        [KeyboardDelegate StartReorientation];

        [GetAppController() interfaceWillChangeOrientationTo: ConvertToIosScreenOrientation(newOrient)];

        [coordinator animateAlongsideTransition: nil completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
            [self.view setNeedsLayout];
            [GetAppController() interfaceDidChangeOrientationFrom: ConvertToIosScreenOrientation(curOrient)];

            [KeyboardDelegate FinishReorientation];
            [UIView setAnimationsEnabled: YES];
        }];
    }
    [super viewWillTransitionToSize: size withTransitionCoordinator: coordinator];
}

@end

@implementation UnityPortraitOnlyViewController
- (NSUInteger)supportedInterfaceOrientations
{
    return 1 << UIInterfaceOrientationPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

- (void)viewWillAppear:(BOOL)animated
{
    [GetAppController() updateAppOrientation: UIInterfaceOrientationPortrait];
    [super viewWillAppear: animated];
}

@end

@implementation UnityPortraitUpsideDownOnlyViewController
- (NSUInteger)supportedInterfaceOrientations
{
    return 1 << UIInterfaceOrientationPortraitUpsideDown;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortraitUpsideDown;
}

- (void)viewWillAppear:(BOOL)animated
{
    [GetAppController() updateAppOrientation: UIInterfaceOrientationPortraitUpsideDown];
    [super viewWillAppear: animated];
}

@end

@implementation UnityLandscapeLeftOnlyViewController
- (NSUInteger)supportedInterfaceOrientations
{
    return 1 << UIInterfaceOrientationLandscapeLeft;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeLeft;
}

- (void)viewWillAppear:(BOOL)animated
{
    [GetAppController() updateAppOrientation: UIInterfaceOrientationLandscapeLeft];
    [super viewWillAppear: animated];
}

@end

@implementation UnityLandscapeRightOnlyViewController
- (NSUInteger)supportedInterfaceOrientations
{
    return 1 << UIInterfaceOrientationLandscapeRight;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeRight;
}

- (void)viewWillAppear:(BOOL)animated
{
    [GetAppController() updateAppOrientation: UIInterfaceOrientationLandscapeRight];
    [super viewWillAppear: animated];
}

@end

NSUInteger EnabledAutorotationInterfaceOrientations()
{
    NSUInteger ret = 0;

    if (UnityIsOrientationEnabled(portrait))
        ret |= (1 << UIInterfaceOrientationPortrait);
    if (UnityDeviceSupportsUpsideDown() && UnityIsOrientationEnabled(portraitUpsideDown))
        ret |= (1 << UIInterfaceOrientationPortraitUpsideDown);
    if (UnityIsOrientationEnabled(landscapeLeft))
        ret |= (1 << UIInterfaceOrientationLandscapeRight);
    if (UnityIsOrientationEnabled(landscapeRight))
        ret |= (1 << UIInterfaceOrientationLandscapeLeft);

    return ret;
}

#endif // PLATFORM_IOS
