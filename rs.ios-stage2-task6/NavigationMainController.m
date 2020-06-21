//
// Created by Eugene Maysyuk on 6/22/20.
// Copyright (c) 2020 Eugene Maysyuk. All rights reserved.
//

#import "NavigationMainController.h"
#import "TabBarController.h"


@implementation NavigationMainController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    [self startButton];
}

- (void)startButton {
    UIButton *startButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    startButton.frame = CGRectMake(50.0, 500.0, 300.0, 50.0);
    startButton.backgroundColor = [UIColor yellowColor];
    [startButton setTitle:@"START" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    startButton.titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
    //startButton.clipsToBounds = YES;
    startButton.layer.cornerRadius = 55.0 / 2.0f;
    [startButton addTarget:self action:@selector(startTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startButton];
}

- (void)startTapped {
    [self.navigationController pushViewController: [TabBarController new] animated:NO];
}


@end
