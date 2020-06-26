//
// Created by Eugene Maysyuk on 6/26/20.
// Copyright (c) 2020 Eugene Maysyuk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewPhotoController.h"


@implementation ViewPhotoController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor grayColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    self.navigationController.navigationItem.title = @"IMG_0001.HEIC";
}

@end
