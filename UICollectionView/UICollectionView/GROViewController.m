//
//  GROViewController.m
//  UICollectionView
//
//  Created by SunGuozhi on 14-6-15.
//  Copyright (c) 2014年 SunGuozhi. All rights reserved.
//

#import "GROViewController.h"

@interface GROViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,retain) UIToolbar * toolbar;
@property (nonatomic,retain) UICollectionView * _collectionView;
@end

@implementation GROViewController
@synthesize _collectionView = __collectionView;
@synthesize toolbar = _toolbar;
#define TileInitialTag          10000
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self buildLayout];
    NSMutableArray * arr = [@[]mutableCopy];
    [arr addObject:@"你好"];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - func
- (void)buildLayout{
    [self.view addSubview:self.toolbar];
    [self.view addSubview:self._collectionView];
    [__collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    UIBarButtonItem * shareButton = [[UIBarButtonItem alloc] initWithTitle:@"share" style:UIBarButtonItemStyleBordered target:self action:@selector(shareButtonTapped:)];
    [_toolbar setItems:@[shareButton]];

}

#pragma mark - ui
- (UIToolbar *)toolbar{
    if (!_toolbar) {
        _toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
        _toolbar.backgroundColor = [UIColor lightGrayColor];
    }
    return _toolbar;
}

- (UICollectionView *)_collectionView{
    if (!__collectionView) {
        UICollectionViewFlowLayout * _collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
        __collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) collectionViewLayout:_collectionViewLayout];
//        UICollectionViewLayout * _collectionViewLayout = [[UICollectionViewLayout alloc] init];
        __collectionView.backgroundColor = [UIColor lightGrayColor];
        [__collectionView setCollectionViewLayout:_collectionViewLayout];
        __collectionView.delegate = self;
        __collectionView.dataSource = self;
    }
    return __collectionView;
}


#pragma mark - event
- (void)shareButtonTapped:(id)sender{
    
}

#pragma mark - UICollectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 13;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%d,%d",indexPath.section,indexPath.row);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (cell) {
        UIImage * image = Nil;
        image = [UIImage imageNamed:@"dog.png"];
        UIImageView * iamgeView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        iamgeView.tag = TileInitialTag + indexPath.row;
        iamgeView.image = image;
        [cell.contentView addSubview:iamgeView];
    }
    
    return cell;
}
#pragma mark – UICollectionViewDelegateFlowLayout
// 1
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    UIImageView * image = (UIImageView *)[self._collectionView viewWithTag:TileInitialTag + indexPath.row];
    
 return image.frame.size;
}
// 3
- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(50, 20, 50, 20); }
@end
