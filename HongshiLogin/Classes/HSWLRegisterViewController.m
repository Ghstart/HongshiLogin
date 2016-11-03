//
//  HSWLRegisterViewController.m
//  LoginModule
//
//  Created by 龚欢 on 2016/11/3.
//  Copyright © 2016年 龚欢. All rights reserved.
//

#import "HSWLRegisterViewController.h"

@interface HSWLRegisterViewController ()

@end

@implementation HSWLRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self.privateDelegate respondsToSelector:@selector(viewDidShow:)]) {
        [self.privateDelegate viewDidShow:self];
    }
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *colors = @[[UIColor orangeColor], [UIColor purpleColor], [UIColor cyanColor], [UIColor blueColor]];
    NSArray *titles = @[@"register", @"forget", @"follow", @"login"];
    for (int i = 0 ; i < colors.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = colors[i];
        button.tag = 10 + i;
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2.0 - 100, 100 + 50 * i, 200, 40);
        [button addTarget:self action:@selector(actions:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([self.privateDelegate respondsToSelector:@selector(viewWillShow:)]) {
        [self.privateDelegate viewWillShow:self];
    }
}

- (void)actions:(UIButton *)btn {
    if (btn.tag == 10 && [self.privateDelegate respondsToSelector:@selector(dismissToRegisterFrom:)])
    {
        [self.privateDelegate dismissToRegisterFrom:self];
    }
    else if (btn.tag == 11 && [self.privateDelegate respondsToSelector:@selector(dismissToForgetFrom:)])
    {
        [self.privateDelegate dismissToForgetFrom:self];
    }
    else if (btn.tag == 12 && [self.privateDelegate respondsToSelector:@selector(dismissToFollowFrom:)])
    {
        [self.privateDelegate dismissToFollowFrom:self];
    }
    else if (btn.tag == 13 && [self.privateDelegate respondsToSelector:@selector(dismissToLoginFrom:)])
    {
        [self.privateDelegate dismissToLoginFrom:self];
    }
}

- (void)dealloc {
    NSLog(@"%@ destory", self);
}

@end
