//
// Created by Eugene Maysyuk on 6/22/20.
// Copyright (c) 2020 Eugene Maysyuk. All rights reserved.
//

#import "ViewAboutController.h"


@implementation ViewAboutController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setBackground];
}

- (void)setBackground {
    self.view.backgroundColor = [UIColor colorWithRed:127.0f/255.0f green:205.0f/255.0f blue:205.0f/255.0f alpha:1.0];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    self.parentViewController.navigationItem.title = @"RSSchool Task 6";
}

@end