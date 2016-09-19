//
//  PersonalCenterController.m
//  ZhiMaBaoBao
//
//  Created by liugang on 16/9/18.
//  Copyright © 2016年 liugang. All rights reserved.
//  芝麻（个人中心）

#import "PersonalCenterController.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height


#define PersonalCellHeight 45
#define PersonalCenterCellReusedId @"PersonalCenterCellReusedId"

@interface PersonalCenterController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *imageArray;

@end

@implementation PersonalCenterController {
    UITableView *_tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
    
}

- (void)setupView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:PersonalCenterCellReusedId];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PersonalCenterCellReusedId forIndexPath:indexPath];
    
    if (indexPath.section == 1) {
        cell.textLabel.text = self.titleArray[indexPath.row];
        cell.imageView.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UIView *bottomLineView = [[UIView alloc] initWithFrame:CGRectMake(20, PersonalCellHeight - 0.5, ScreenWidth - 10, 0.5)];
        bottomLineView.backgroundColor = [UIColor lightGrayColor];
        [cell addSubview:bottomLineView];
        
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 100;
    }
    return PersonalCellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - lazyLoad 
- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"相册",@"钱包",@"意见",@"设置"];
    }
    return _titleArray;
}

- (NSArray *)imageArray {
    if (!_imageArray) {
        _imageArray = @[@"PersonalCenter_Album",@"Personal_MyMoney",@"PersonalCenter_Suggest",@"PersonalCenter_Setting"];
    }
    return _imageArray;
}



@end
