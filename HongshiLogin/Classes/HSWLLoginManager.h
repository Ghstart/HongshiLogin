//
//  HSWLLoginView.h
//  LoginModule
//
//  Created by 龚欢 on 2016/11/3.
//  Copyright © 2016年 龚欢. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HSWLShowStyle)
{
    HSWLLogin = 99,
    HSWLRegister,
    HSWLForgetPassword,
    HSWLFollowDetails
};

@protocol HSWLLoginManagerDelegate <NSObject>

- (void)HSWLViewWillShowWhichType:(HSWLShowStyle)ToType;
- (void)HSWLViewDidShowWhichType:(HSWLShowStyle)ToType;

@end

@interface HSWLLoginManager : UIViewController

@property (nonatomic, assign) id<HSWLLoginManagerDelegate>delegate;

- (instancetype)initWithType:(HSWLShowStyle)type;

- (void)showAddTo:(UIViewController *)vc finishedBlock:(void(^)(void))finishedBlock;

@end
