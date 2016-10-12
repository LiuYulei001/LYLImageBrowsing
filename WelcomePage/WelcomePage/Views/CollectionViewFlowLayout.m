//
//  CollectionViewFlowLayout.m
//  WelcomePage
//
//  Created by Rainy on 16/10/12.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "CollectionViewFlowLayout.h"
#import "CollectionViewCell.h"

@implementation CollectionViewFlowLayout
-(instancetype)init
{
    self = [super init];
    if (self) {
        
        self.itemSize=[UIScreen mainScreen].bounds.size;
        self.minimumLineSpacing=0;
        self.minimumInteritemSpacing=0;
        self.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    }
    return self;
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *attributes=[[super layoutAttributesForElementsInRect:rect] mutableCopy];
    
    [attributes enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes* obj, NSUInteger idx, BOOL *stop) {
        
        CollectionViewCell *cell=(CollectionViewCell *)[self.collectionView cellForItemAtIndexPath:obj.indexPath];
        
        if (cell) {
            
            CGFloat position=self.collectionView.contentOffset.x;
            CGFloat final=self.itemSize.width*obj.indexPath.row;
            NSLog(@"---%f",final);
            CGFloat missing=final-position;
            
            CGFloat parallaxValue=missing/self.collectionView.frame.size.width;
            
            cell.parallaxValue=parallaxValue;
            
        }
        
        
    }];
    
    return attributes;
}










- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}


@end







