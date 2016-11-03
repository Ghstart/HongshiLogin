//
//  HSWLLoginBaseViewController.h
//  LoginModule
//
//  Created by 龚欢 on 2016/11/3.
//  Copyright © 2016年 龚欢. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HSWLPrivateProtocol.h"

@interface HSWLLoginBaseViewController : UIViewController

@property (nonatomic, strong) NSString *navTitle;

@property (nonatomic, weak) id<HSWLPrivateProtocol>privateDelegate;

@end
