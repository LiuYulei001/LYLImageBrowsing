//
//  CollectionViewCell.m
//  WelcomePage
//
//  Created by Rainy on 16/10/12.
//  Copyright © 2016年 Rainy. All rights reserved.
//
#define MAX_HORIZONTAL_PARALLAX 300

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.clipsToBounds=YES;
        self.imageView=[[UIImageView alloc] initWithFrame:CGRectInset(self.bounds, -MAX_HORIZONTAL_PARALLAX, 0)];
        self.imageView.contentMode=UIViewContentModeScaleAspectFill;
        self.imageView.clipsToBounds=YES;
        self.imageView.autoresizingMask=UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [self addSubview:self.imageView];
    }
    return self;
}


- (void)setParallaxValue:(CGFloat)parallaxValue{
    
    _parallaxValue=parallaxValue;
    
    CGRect frame=self.imageView.frame;
    frame.origin.x=-MAX_HORIZONTAL_PARALLAX + parallaxValue*MAX_HORIZONTAL_PARALLAX;
    self.imageView.frame=frame;
    
    if ([[self delegate] respondsToSelector:@selector(cell:changeParallaxValueTo:)]) {
        [[self delegate] cell:self changeParallaxValueTo:parallaxValue];
    }
    
}

- (UIImage *)image{
    return self.imageView.image;
}

- (void)setImage:(UIImage *)image{
    self.imageView.image=image;
}
- (void)dealloc{
    self.delegate=nil;
}

@end
