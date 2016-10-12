//
//  CollectionViewCell.h
//  WelcomePage
//
//  Created by Rainy on 16/10/12.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CollectionViewCell;

@protocol CollectionViewCellDelegate <NSObject>

@required

- (void)cell:(CollectionViewCell *)cell changeParallaxValueTo:(CGFloat)value;

@end
@interface CollectionViewCell : UICollectionViewCell

@property (nonatomic,readwrite) UIImage *image;
@property (nonatomic,readwrite) UIImageView *imageView;
@property (nonatomic,assign) CGFloat parallaxValue; // from -1 to 1 that represent the minimum form to left to maximim right
@property (nonatomic,assign) id<CollectionViewCellDelegate>delegate;

@end
