//
//  LPRadioVC.m
//  LPMultiSelectDemo
//
//  Created by LP.99 on 16/4/28.
//  Copyright © 2016年 anonymous. All rights reserved.
//

#import "LPRadioVC.h"
#import "LPRadioCell.h"

@interface LPRadioVC () <UITableViewDelegate,UITableViewDataSource>

/**
 *  表格视图
 */
@property (nonatomic, weak) UITableView * tableView;

/**
 *  数据源数组
 */
@property (nonatomic, copy) NSArray * modeArr;

/**
 *  记录上一次的IndexPath
 */
@property (nonatomic, strong) NSIndexPath * lastIndexPath;

@end

@implementation LPRadioVC

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
    
    // 识别NIB
    [self.tableView registerNib:[UINib nibWithNibName:@"LPRadioCell" bundle:nil] forCellReuseIdentifier:@"LPRadioID"];

    // 创建返回按钮
    UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(selectLeftAction)];
    
    self.navigationItem.leftBarButtonItem = leftButton;
}

#pragma mark - 数据源
- (void)request {
    
    // 数据源数组
    self.modeArr = @[@"小侯",@"小侯玛利亚",@"小侯利亚",@"小侯李默德",@"候.布莱恩特",@"🐵",@"斗战胜佛候"];
    
    // 默认的选中 defaultIndexPath
    NSIndexPath * defaultIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    [self tableView:self.tableView didSelectRowAtIndexPath:defaultIndexPath];
}

#pragma mark - UITableView 代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.modeArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LPRadioCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LPRadioID" forIndexPath:indexPath];
    
    if (cell == nil) { //
        
        NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"LPRadioCell" owner:self options:nil];
        
        cell = [nib objectAtIndex:0];
    }
    
    cell.textLabel.text = self.modeArr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger newCell = [indexPath row];
    
    NSInteger oldCell = (self.lastIndexPath != nil) ? [self.lastIndexPath row] : - 1;
    
    if (newCell != oldCell) {
        
        LPRadioCell * newcell =  [tableView cellForRowAtIndexPath:indexPath];
        newcell.radioBtn.hidden = NO;
        
        LPRadioCell * oldCell = [tableView cellForRowAtIndexPath:self.lastIndexPath];
        oldCell.radioBtn.hidden = YES;
    }
    
    self.lastIndexPath = indexPath;
}

- (void)selectLeftAction {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        NSLog(@"GoBack - 单选");
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
