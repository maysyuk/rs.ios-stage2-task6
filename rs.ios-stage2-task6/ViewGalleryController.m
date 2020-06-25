//
// Created by Eugene Maysyuk on 6/22/20.
// Copyright (c) 2020 Eugene Maysyuk. All rights reserved.
//

#import "ViewGalleryController.h"


@implementation ViewGalleryController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setBackground];
}

- (void)setBackground {
    self.view.backgroundColor = [UIColor colorWithRed:225.0f/255.0f green:93.0f/255.0f blue:68.0f/255.0f alpha:1.0];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    self.parentViewController.navigationItem.title = @"Gallery";
}

@end