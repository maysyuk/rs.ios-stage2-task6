//
// Created by Eugene Maysyuk on 6/22/20.
// Copyright (c) 2020 Eugene Maysyuk. All rights reserved.
//

#import "TabBarController.h"


@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setBackground];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    [self setTabBarHeight];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.navigationItem setHidesBackButton:YES animated:YES];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [self.navigationController setNavigationBarHidden:NO animated:YES]; // if you don't need animation - put this under viewWillAppear
}

- (void)setBackground {
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)setTabBarHeight {
    int tabBarHeight = 70;
    CGRect tabBarFrame = self.tabBar.frame;
    tabBarFrame.size.height = tabBarHeight;
    tabBarFrame.origin.y = self.view.frame.size.height - tabBarHeight;
    self.tabBar.frame = tabBarFrame;
}


@end
