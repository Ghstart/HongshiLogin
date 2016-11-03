//
//  HSWLPrivateProtocol.h
//  LoginModule
//
//  Created by 龚欢 on 2016/11/3.
//  Copyright © 2016年 龚欢. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HSWLPrivateProtocol <NSObject>

- (void)dismissToRoot:(UIViewController *)vc;
- (void)dismissToLoginFrom:(UIViewController *)vc;
- (void)dismissToRegisterFrom:(UIViewController *)vc;
- (void)dismissToForgetFrom:(UIViewController *)vc;
- (void)dismissToFollowFrom:(UIViewController *)vc;
- (void)viewWillShow:(UIViewController *)vc;
- (void)viewDidShow:(UIViewController *)vc;

@end
