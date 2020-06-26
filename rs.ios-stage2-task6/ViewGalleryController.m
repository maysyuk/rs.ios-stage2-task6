//
// Created by Eugene Maysyuk on 6/22/20.
// Copyright (c) 2020 Eugene Maysyuk. All rights reserved.
//

#import "ViewGalleryController.h"
#import "ViewPhotoController.h"


@implementation ViewGalleryController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setBackground];

    UICollectionViewFlowLayout *collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
//    collectionViewLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
//    collectionViewLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
//    collectionViewLayout.itemSize = CGSizeMake(115, 115);

    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:collectionViewLayout];
    [collectionView setDataSource:self];
    [collectionView setDelegate:self];
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [collectionView setBackgroundColor: [UIColor whiteColor]];
    [self.view addSubview:collectionView];
}

- (void)setBackground {
    self.view.backgroundColor = [UIColor colorWithRed:225.0f/255.0f green:93.0f/255.0f blue:68.0f/255.0f alpha:1.0];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    self.parentViewController.navigationItem.title = @"Gallery";
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 40;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(115, 115);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.navigationController pushViewController:[ViewPhotoController new] animated:YES];
}


@end
