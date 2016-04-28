//
//  ViewController.m
//  LPMultiSelectDemo
//
//  Created by LP.99 on 16/4/28.
//  Copyright © 2016年 anonymous. All rights reserved.
//

#import "ViewController.h"
#import "LPNavVC.h"
#import "LPRadioVC.h"
#import "LPMultiSelectVC.h"
#import "LPTwoListVC.h"

@interface ViewController ()

/**
 *  单选
 */
@property (weak, nonatomic) IBOutlet UIButton *radioButton;

/**
 *  多选
 */
@property (weak, nonatomic) IBOutlet UIButton *multiSelectButton;

/**
 *  二级列表
 */
@property (weak, nonatomic) IBOutlet UIButton *twoLevelListButton;

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI {
    
    self.radioButton.layer.masksToBounds = YES;
    self.radioButton.layer.cornerRadius = 4.0f;
    
    self.multiSelectButton.layer.masksToBounds = YES;
    self.multiSelectButton.layer.cornerRadius = 4.0f;
    
    self.twoLevelListButton.layer.masksToBounds = YES;
    self.twoLevelListButton.layer.cornerRadius = 4.0f;
}

- (IBAction)goRadioVC:(id)sender {
    
    LPRadioVC * vc = [[LPRadioVC alloc] init];
    LPNavVC * nav = [[LPNavVC alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:^{
       
        NSLog(@"跳转单选界面");
    }];
}

- (IBAction)goMultiSelectVC:(id)sender {
   
    LPMultiSelectVC * vc = [[LPMultiSelectVC alloc] init];
    LPNavVC * nav = [[LPNavVC alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:^{
        
        NSLog(@"跳转多选界面");
    }];
}

- (IBAction)goTwoListVC:(id)sender {
   
    LPTwoListVC * vc = [[LPTwoListVC alloc] init];
    LPNavVC * nav = [[LPNavVC alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:^{
        
        NSLog(@"跳转二级列表界面");
    }];
}

- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];
}

@end
