//
//  LPMultiSelectVC.m
//  LPMultiSelectDemo
//
//  Created by LP.99 on 16/4/28.
//  Copyright © 2016年 anonymous. All rights reserved.
//

#import "LPMultiSelectVC.h"

@interface LPMultiSelectVC () <UITableViewDelegate,UITableViewDataSource>

/**
 *  表格
 */
@property (nonatomic, weak) UITableView * tableView;

/**
 *  数据源数组
 */
@property (nonatomic, copy) NSArray * modeArr;

/**
 *  统计选中数组
 */
@property (nonatomic, strong) NSMutableArray * selectArr;

@end

@implementation LPMultiSelectVC

- (void)viewDidLoad {

    [super viewDidLoad];
    
    [self request];
    
    [self createUI];
}

#pragma mark - 创建UI
- (void)createUI {
    
    UITableView * tableView = [[UITableView alloc]init];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    CGRect frame = self.view.frame;
    tableView.frame = frame;
    tableView.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(selectLeftAction)];
    
    self.navigationItem.leftBarButtonItem = leftButton;
}

#pragma mark - 数据源
- (void)request {
    
    // 数据源数组
    self.modeArr = @[@"小侯",@"小侯玛利亚",@"小侯利亚",@"小侯李默德",@"候.布莱恩特",@"🐵",@"斗战胜佛候"];
    
    self.selectArr = [[NSMutableArray alloc] init];
}

#pragma mark - UITableView 代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.modeArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * ID = @"Identifier";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }

    cell.textLabel.text = self.modeArr[indexPath.row];

    // key - 偷懒就这样写了
    NSString * key = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    // 数组中包含当前行号，设置对号
    if ([self.selectArr containsObject:key]) {
        
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
    } else {
        
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString * key = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    // 判断数组中有没有被选中行的行号
    if ([self.selectArr containsObject:key]) {
        
        [self.selectArr removeObject:key];
        
    } else {
        
        [self.selectArr addObject:key];
    }
    
    NSLog(@"你选中了第%ld",(long)indexPath.row);
    
    // 刷新
    NSIndexPath * index =[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
    
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:index,nil] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)selectLeftAction {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        NSLog(@"GoBack - 多选");
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
