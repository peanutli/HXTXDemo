//
//  BookshelfViewController.m
//  HongXiuTianXiangApp
//
//  Created by 花生 on 16/2/29.
//  Copyright © 2016年 花生. All rights reserved.
//书架

#import "BookshelfViewController.h"
#import "BookShelfCell.h"
#import "BookShelfItem.h"

@interface BookshelfViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *bookShelfCollection;
@property (nonatomic,strong) NSMutableArray * dataSourceArray; //数据源
@end

@implementation BookshelfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setCollectionView];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - PrivateMethod
- (void)setCollectionView{
    self.dataSourceArray = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i<9; i++) {
        NSString * image = [NSString stringWithFormat:@"%ld",(long)i+1];
        NSString * title = [NSString stringWithFormat:@"%ld 张",i ];
        BookShelfItem * item = [[BookShelfItem alloc]init];
        item.image = image;
        item.title = title;
        [_dataSourceArray addObject:item];
    }
    _bookShelfCollection.delegate = self;
    _bookShelfCollection.dataSource = self;
}

#pragma mark - UICollectionDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataSourceArray.count;
}

#pragma mark - UICollectionDelegate
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * collectionID = @"bookShelfCell";
    BookShelfCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionID forIndexPath:indexPath];
    BookShelfItem * item = [_dataSourceArray objectAtIndex:indexPath.row];
    cell.bookShelfItem = item;
    NSLog(@"%@",item.title);
    NSLog(@"%@",cell.bookShelfItem.title);
    return cell;
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
