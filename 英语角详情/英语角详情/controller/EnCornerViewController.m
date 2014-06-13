//
//  EnCornerViewController.m
//  英语角详情
//
//  Created by SunGuozhi on 14-6-10.
//  Copyright (c) 2014年 SunGuozhi. All rights reserved.
//

#import "EnCornerViewController.h"
#import "GRORectButton.h"
#import "UIColor+iOS7Colors.h"
#import "HeaderCircleImageView.h"
@interface EnCornerViewController ()
@property (retain, nonatomic) IBOutlet UITableView *infoTableView;
@property (retain, nonatomic) IBOutlet UIScrollView *peopleInCornerScrollView;
@property (nonatomic,retain) NSArray * arr;
@property (retain, nonatomic) IBOutlet UIButton *quitBtn;


@end
/*
 for (int i = 0; i<_stuArr.count; i++) {
 CGRect rect = CGRectMake(leftSpace+((60+centerSpaceX) * (i%numInRow)), topSpace+(i/numInRow)*(centerSpaceY+60), 60, 60);
 TeachersAdnStudentsBtn *btn = [[TeachersAdnStudentsBtn alloc] initWithFrame:rect andCorner:30 andFont:11.0f andMsgItem:[studentArray objectAtIndex:i] withIdentify:Student addTagWithId:(NSNumber*)_stuArr[i][@"id"]];
 [btn setimageUrl];
 [studentsView addSubview:btn];
 TB_RELEASE_CF_SAFELY(btn);
 }
 */
@implementation EnCornerViewController
#define leftSpace 10
#define numInRow 4
#define centerSpaceX 20
#define centerSpaceY 30
#define topSpace 10

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _arr = @[@"1",@"2",@"1",@"2",@"1",@"2",@"1",@"2",@"1",@"2",@"1",@"2",@"1",@"2",@"1",@"2",@"1",@"2",@"1",@"2",@"1",@"2"];
    
    [self.view addSubview:self.peopleInCornerScrollView];
    [self.view addSubview:self.infoTableView];
    [self.view addSubview:self.quitBtn];
    
    UIBarButtonItem * _addButton = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(touchEnd:)];
    self.navigationItem.rightBarButtonItem = _addButton;
    [self createScrollModel];
    [_quitBtn setBackgroundColor:[UIColor iOS7redColor]];
    
 
}

- (void)createScrollModel{
    for (int i = 0; i<_arr.count; i++) {
        CGRect rect = CGRectMake(leftSpace+((60+centerSpaceX) * (i%numInRow)), topSpace+(i/numInRow)*(centerSpaceY+60), 60, 60);
        HeaderCircleImageView * headerImg = [[HeaderCircleImageView alloc] initWithFrame:rect ];
        headerImg.image = [UIImage imageNamed:@"sns_icon.png"];
        [headerImg.layer setMasksToBounds:YES];
        headerImg.tag = i;
        [headerImg addTarget:self action:@selector(touchEnd:)];
        [headerImg setUserInteractionEnabled:YES];
        [_peopleInCornerScrollView addSubview:headerImg];
    }
     _peopleInCornerScrollView.contentSize = CGSizeMake(0,(_arr.count/4+1)*(60+centerSpaceY)+10);
}

- (void)touchEnd:(id)sender{

    NSLog(@"呵呵呵");
}

- (void)touchButton{
    NSLog(@"点击我啦");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellIdentify = @"cell_identify";
    UITableViewCell * cell;
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
    }
    cell.textLabel.text = _arr[indexPath.row];
    return cell;
}

#pragma mark - make UI - 
- (UITableView *)infoTableView{
    if (!_infoTableView) {
        _infoTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 320, 90) style:UITableViewStylePlain];
        _infoTableView.delegate = self;
        _infoTableView.dataSource = self;
        [_infoTableView setScrollEnabled:NO];
        [_infoTableView setSeparatorInset:UIEdgeInsetsZero];
    }
    return _infoTableView;
}

- (UIScrollView *)peopleInCornerScrollView{
    if (!_peopleInCornerScrollView) {
        _peopleInCornerScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 154, 320, 341)];
        _peopleInCornerScrollView.backgroundColor = [UIColor iOS7scrollViewBackGroundColor];
    }
    return _peopleInCornerScrollView;
}

- (UIButton *)quitBtn{
    if (!_quitBtn) {
        _quitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _quitBtn.frame = CGRectMake(10, 512, 300, 40);
        _quitBtn.backgroundColor = [UIColor iOS7redColor];
    }
    return _quitBtn;
}
@end
