//
//  LPTwoListVC.m
//  LPMultiSelectDemo
//
//  Created by LP.99 on 16/4/28.
//  Copyright © 2016年 anonymous. All rights reserved.
//

#import "LPTwoListVC.h"

@interface LPTwoListVC () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak) UITableView * table1;

@property (nonatomic,weak) UITableView * table2;

/**
 *  数据源数组
 */
@property (nonatomic,strong) NSArray * arr;

/**
 *  记录下table1 选中的行号
 */
@property (nonatomic,assign) NSInteger selected;

@end

@implementation LPTwoListVC

- (void)viewDidLoad {

    [super viewDidLoad];
    
    [self request];
    
    [self createUI];
}

#pragma mark - 创建UI
- (void)createUI {
    
    /**
     第一个表格
     */
    UITableView * tab1 = [[UITableView alloc]init];
    tab1.delegate = self;
    tab1.dataSource = self;
    CGRect frame1 = self.view.frame;
    frame1.size.width *= 0.5f;
    tab1.frame = frame1;
    [self.view addSubview:tab1];
    self.table1 = tab1;
    
    /**
     第二个表格
     */
    UITableView * tab2 = [[UITableView alloc]init];
    tab2.delegate = self;
    tab2.dataSource = self;
    CGRect frame2 = self.view.frame;
    frame2.size.width *= 0.5f;
    frame2.origin.x = frame2.size.width;
    tab2.frame = frame2;
    [self.view addSubview:tab2];
    self.table2 = tab2;
    
    UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(selectLeftAction)];
    
    self.navigationItem.leftBarButtonItem = leftButton;
}

#pragma mark - 数据源
- (void)request {
    
    // 数据源数组
    self.arr = @[@{@"title" : @"卢海区", @"content" : @[@"淮海路", @"打浦桥"]},
                 @{@"title" : @"黄浦区", @"content" : @[@"人民广场", @"豫园", @"南京东路"]},
                 @{@"title" : @"浦东新区", @"content" : @[@"浦东大道", @"浦东国际机场", @"世纪大道"]}];
    
    // 默认第0行
    self.selected = 0;
}

#pragma mark - UITableView 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == self.table1) {
        
        return self.arr.count;
        
    } else {
        
        NSDictionary * dic = self.arr[self.selected];
        
        return [dic[@"content"]count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == self.table1) {
        
        static NSString * ID = @"tableCell1";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        
        if (!cell) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        
        NSDictionary * dic = self.arr[indexPath.row];
        
        cell.textLabel.text = dic[@"title"];
        
        return cell;
        
    } else {
        
        static NSString * ID = @"tableCell2";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        
        if (!cell) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        
        NSDictionary * dic = self.arr[self.selected];
        
        cell.textLabel.text = dic[@"content"][indexPath.row];
        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == self.table1) {
        
        self.selected = indexPath.row;
        
        [self.table2 reloadData];
    }
}

- (void)selectLeftAction {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        NSLog(@"GoBack - 二级列表");
    }];
}

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
