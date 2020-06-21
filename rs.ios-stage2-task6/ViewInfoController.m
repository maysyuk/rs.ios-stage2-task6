//
// Created by Eugene Maysyuk on 6/22/20.
// Copyright (c) 2020 Eugene Maysyuk. All rights reserved.
//

#import "ViewInfoController.h"


@implementation ViewInfoController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setBackground];
}

- (void)setBackground {
    self.view.backgroundColor = [UIColor colorWithRed:255.0/255.0f green:111.0f/255.0f blue:97.0f/255.0f alpha:1.0];
}

@end