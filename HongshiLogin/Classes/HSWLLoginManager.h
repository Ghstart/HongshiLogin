//
//  HSWLLoginView.h
//  LoginModule
//
//  Created by 龚欢 on 2016/11/3.
//  Copyright © 2016年 龚欢. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSWLLoginManager : UIViewController

typedef NS_ENUM(NSInteger, HSWLShowStyle)
{
    HSWLLogin,
    HSWLRegister,
    HSWLForgetPassword,
    HSWLFollowDetails
};


- (instancetype)initWithType:(HSWLShowStyle)type;

- (void)showAddTo:(UIViewController *)vc finishedBlock:(void(^)(void))finishedBlock;

@end
