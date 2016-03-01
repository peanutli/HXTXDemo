//
//  bookShelfCell.m
//  HongXiuTianXiangApp
//
//  Created by 花生 on 16/3/1.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "BookShelfCell.h"

@interface BookShelfCell ()
@property (strong, nonatomic) IBOutlet UIImageView *bookCover;
@property (weak, nonatomic) IBOutlet UILabel *bookTitle;

@end

@implementation BookShelfCell

- (void)setBookShelfItem:(BookShelfItem *)bookShelfItem
{
    _bookShelfItem = bookShelfItem;
    UIImage * image = [UIImage imageNamed:bookShelfItem.image];
    _bookCover = [[UIImageView alloc]initWithImage:image];
    _bookTitle.text = bookShelfItem.title;
}
@end
