//
//  HSWLLoginView.m
//  LoginModule
//
//  Created by 龚欢 on 2016/11/3.
//  Copyright © 2016年 龚欢. All rights reserved.
//

#import "HSWLLoginManager.h"

#import "HSWLLoginViewController.h"
#import "HSWLRegisterViewController.h"
#import "HSWLForgetPasswordViewController.h"
#import "HSWLFollowDetailsViewController.h"
#import "HSWLPrivateProtocol.h"

#define SLIDE_TIMING .25

@interface HSWLLoginManager ()<HSWLPrivateProtocol>

@property (nonatomic, strong) HSWLLoginViewController           *loginVC;
@property (nonatomic, strong) HSWLRegisterViewController        *registerVC;
@property (nonatomic, strong) HSWLForgetPasswordViewController  *forgetVC;
@property (nonatomic, strong) HSWLFollowDetailsViewController   *followVC;

@property (nonatomic, strong) UIViewController                  *privateVC;
@property (nonatomic, assign) HSWLShowStyle                     type;

@end

@implementation HSWLLoginManager

#pragma mark - Init Methods

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"NSCoding not supported"
                                 userInfo:nil];
}

- (instancetype)init {
    if (self = [super init]) {
        self.type = HSWLLogin;
    }
    return self;
}

- (instancetype)initWithType:(HSWLShowStyle)type {
    if (self = [super init]) {
        self.type = type;
    }
    return self;
}

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)actions:(UIButton *)btn {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Private Method

- (HSWLShowStyle)accordingToWhichVC:(UIViewController *)whichVC {
    
    if ([whichVC isMemberOfClass:[HSWLLoginViewController class]])
    {
        return HSWLLogin;
    }
    else if ([whichVC isMemberOfClass:[HSWLRegisterViewController class]])
    {
        return HSWLRegister;
    }
    else if ([whichVC isMemberOfClass:[HSWLForgetPasswordViewController class]])
    {
        return HSWLForgetPassword;
    }
    else {
        return HSWLFollowDetails;
    }
}

- (void)setupWithType:(HSWLShowStyle)type {
    
    [self setUpViews];
    
    if (type == HSWLLogin)
    {
        self.privateVC = self.loginVC;
    }
    else if (type == HSWLRegister)
    {
        self.privateVC = self.registerVC;
    }
    else if (type == HSWLForgetPassword)
    {
        self.privateVC = self.forgetVC;
    }
    else if (type == HSWLFollowDetails)
    {
        self.privateVC = self.followVC;
    }
    
    if (!self.privateVC) return;
    
    [self.view addSubview:self.privateVC.view];
    [self addChildViewController:self.privateVC];
    [self.privateVC didMoveToParentViewController:self];
    self.privateVC.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    [UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         
                         self.privateVC.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
                         
                     } completion:nil];
}

#pragma mark - Public Methods

- (void)setUpViews {
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)removeVC {
    if (!self.privateVC) return;
    
    NSLog(@"--%@ will remove", self.privateVC);
    NSLog(@"----------------------------------");
    
    
    UIViewController *vc = [self.childViewControllers lastObject];
    [vc willMoveToParentViewController:nil];
    [vc.view removeFromSuperview];
    [vc removeFromParentViewController];
    
    

    [self.privateVC willMoveToParentViewController:nil];
    [self.privateVC.view removeFromSuperview];
    [self.privateVC removeFromParentViewController];
    self.privateVC = nil;
}

- (void)showAddTo:(UIViewController *)vc finishedBlock:(void(^)(void))finishedBlock {
    if (!vc || ![vc isKindOfClass:[UIViewController class]]) return;
    
    [self setupWithType:self.type];
    
    [vc presentViewController:self animated:YES completion:finishedBlock];
}

#pragma mark - HSWLPrivateProtocol
- (void)dismissToRoot:(UIViewController *)vc {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dismissToLoginFrom:(UIViewController *)vc {
    [self removeVC];
    [self setupWithType:HSWLLogin];
}

- (void)dismissToRegisterFrom:(UIViewController *)vc {
    [self removeVC];
    [self setupWithType:HSWLRegister];
}

- (void)dismissToForgetFrom:(UIViewController *)vc {
    [self removeVC];
    [self setupWithType:HSWLForgetPassword];
}

- (void)dismissToFollowFrom:(UIViewController *)vc {
    [self removeVC];
    [self setupWithType:HSWLFollowDetails];
}

- (void)viewWillShow:(UIViewController *)vc {
    if (!vc) return;
    
    if ([self.delegate respondsToSelector:@selector(HSWLViewWillShowWhichType:)]) {
        [self.delegate HSWLViewWillShowWhichType:[self accordingToWhichVC:vc]];
    }
}

- (void)viewDidShow:(UIViewController *)vc {
    if (!vc) return;
    
    if ([self.delegate respondsToSelector:@selector(HSWLViewDidShowWhichType:)]) {
        [self.delegate HSWLViewDidShowWhichType:[self accordingToWhichVC:vc]];
    }
}


#pragma mark - Getter Methods

- (HSWLLoginViewController *)loginVC {
    if (_loginVC == nil) {
        _loginVC = [[HSWLLoginViewController alloc] init];
        _loginVC.privateDelegate = self;
    }
    return _loginVC;
}

- (HSWLRegisterViewController *)registerVC {
    if (_registerVC == nil) {
        _registerVC = [[HSWLRegisterViewController alloc] init];
        _registerVC.privateDelegate = self;
    }
    return _registerVC;
}

- (HSWLForgetPasswordViewController *)forgetVC {
    if (_forgetVC == nil) {
        _forgetVC = [[HSWLForgetPasswordViewController alloc] init];
        _forgetVC.privateDelegate = self;
    }
    return _forgetVC;
}

- (HSWLFollowDetailsViewController *)followVC {
    if (_followVC == nil) {
        _followVC = [[HSWLFollowDetailsViewController alloc] init];
        _followVC.privateDelegate = self;
    }
    return _followVC;
}



@end
