//
//  LPNavVC.m
//  LPMultiSelectDemo
//
//  Created by LP.99 on 16/4/28.
//  Copyright © 2016年 anonymous. All rights reserved.
//

#import "LPNavVC.h"

@interface LPNavVC ()

@end

@implementation LPNavVC

/**
 *  设置导航栏主题
 */
+ (void)setupNavTheme {
    
    // 状态栏
//    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    
    // 导航栏背景
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBackgroundImage:[UIImage imageNamed:@"navBarBg"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.navigationBar.translucent = NO; // Yes --> 开启导航条半透明效果 / No --> 关闭导航条半透明效果
    
//    UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(selectLeftAction)];
//    
//    self.navigationItem.leftBarButtonItem = leftButton;
}

//- (void)selectLeftAction {
//    
//    [self dismissViewControllerAnimated:YES completion:^{
//       
//        NSLog(@"GoBack");
//    }];
//}

- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
