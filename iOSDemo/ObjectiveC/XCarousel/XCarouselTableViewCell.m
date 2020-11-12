//
//  XCarouselTableViewCell.m
//  iOSDemo
//
//  Created by jingyuan5 on 2020/11/2.
//  Copyright © 2020 Xiaodev. All rights reserved.
//

#import "XCarouselTableViewCell.h"
#import "XTools.h"
#import <SDWebImage/UIImageView+WebCache.h>


@interface WBMLPageControl : UIPageControl

@end

@implementation WBMLPageControl
#define kmldotW 5
#define kmlmagrin 1
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat marginX = kmldotW + kmlmagrin;
    
    for (int i = 0; i < [self.subviews count]; i++) {
        UIImageView* dot = [self.subviews objectAtIndex:i];
        if (i == self.currentPage) {
            [dot setFrame:CGRectMake(i * marginX, dot.frame.origin.y, kmldotW, kmldotW)];
        }else {
            [dot setFrame:CGRectMake(i * marginX, dot.frame.origin.y, kmldotW, kmldotW)];
        }
    }
}

@end

@interface XCarouselCell : UICollectionViewCell
@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)UILabel *label;
@end

@implementation XCarouselCell

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}
- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
        _label.textColor = [UIColor redColor];
        _label.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_label];
    }
    return _label;
}
- (void)layoutSubviews {
    self.imageView.frame = self.contentView.bounds;
}
@end
@interface XCarouselTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong)UICollectionView *cellCollectionView;
@property (nonatomic, assign)NSInteger index;
@property (nonatomic, strong)WBMLPageControl *pageControl;
@end

@implementation XCarouselTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.cellCollectionView];
        [self.contentView addSubview:self.pageControl];
    }
    return self;
}
- (UICollectionView *)cellCollectionView {
    if (!_cellCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 20.0f;
        layout.minimumInteritemSpacing = 0.0f;
        layout.itemSize = CGSizeMake(kScreen_Width - 20, 80);
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _cellCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 100) collectionViewLayout:layout];
        _cellCollectionView.delegate = self;
        _cellCollectionView.dataSource = self;
        _cellCollectionView.pagingEnabled = YES;
        _cellCollectionView.showsHorizontalScrollIndicator = NO;
        [_cellCollectionView registerClass:[XCarouselCell class] forCellWithReuseIdentifier:@"kCollectionViewCell"];
        _cellCollectionView.backgroundColor = [UIColor grayColor];
        [self.cellCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    }
    return _cellCollectionView;
}
- (WBMLPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[WBMLPageControl alloc]initWithFrame:CGRectMake(10, 60, kScreen_Width - 20, 20)];
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.pageIndicatorTintColor = [UIColor greenColor];
        _pageControl.backgroundColor = [UIColor redColor];
        _pageControl.numberOfPages = self.imageArray.count;
        _pageControl.hidesForSinglePage = YES;
    }
    return  _pageControl;
}
- (void)setImageArray:(NSArray *)imageArray {
    _imageArray = imageArray;
    self.pageControl.numberOfPages = imageArray.count;
    CGSize size = [self.pageControl sizeForNumberOfPages:imageArray.count];
    self.pageControl.frame = CGRectMake(kScreen_Width - size.width, 60, size.width, size.height);
    [self.cellCollectionView reloadData];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageArray.count* 3;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XCarouselCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"kCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = indexPath.row%2?[UIColor redColor]:[UIColor blueColor];
    NSString *str = [self.imageArray objectAtIndex:indexPath.row%self.imageArray.count];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:str]];
    cell.label.text = [NSString stringWithFormat:@"%@",@(indexPath.row)];
    NSLog(@"cellfor ===== %@",@(indexPath.row));
    return cell;
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self performSelector:@selector(scrollviewNext) withObject:nil afterDelay:3];
}
- (void)scrollviewNext {
    [self.cellCollectionView setContentOffset:CGPointMake((self.index + 1)*kScreen_Width, 0) animated:YES];
    if (self.index > self.imageArray.count && self.index % self.imageArray.count == 0) {
        [self.cellCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:self.imageArray.count inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    }
    [self performSelector:@selector(scrollviewNext) withObject:nil afterDelay:3];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.index = (int)(scrollView.contentOffset.x/kScreen_Width);
    self.pageControl.currentPage = self.index%self.imageArray.count;
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x == 0 ||(scrollView.contentOffset.x > self.imageArray.count*kScreen_Width && (int)(scrollView.contentOffset.x/kScreen_Width)%(self.imageArray.count) == 0) ) {
        [self.cellCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:self.imageArray.count inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    }
}
@end
