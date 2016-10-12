//
//  ViewController.m
//  WelcomePage
//
//  Created by Rainy on 16/10/12.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "CollectionViewFlowLayout.h"
@interface ViewController ()<CollectionViewCellDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CollectionViewFlowLayout *layout=[[CollectionViewFlowLayout alloc] init];
    
    self.myCollectionView.collectionViewLayout=layout;
    _myCollectionView.showsHorizontalScrollIndicator=NO;
    _myCollectionView.pagingEnabled=YES;
    _myCollectionView.backgroundColor=[UIColor whiteColor];
    [_myCollectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"CollectionViewCell"];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    
    cell.image=[UIImage imageNamed:[NSString stringWithFormat:@"%li",(long)indexPath.item%5+1]];
    
    cell.delegate=self;
    
    
    return cell;
}

- (void)cell:(CollectionViewCell *)cell changeParallaxValueTo:(CGFloat)value{
    
    NSLog(@">>>>>%f",value);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
