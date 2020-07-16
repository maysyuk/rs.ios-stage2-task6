//
// Created by Eugene Maysyuk on 6/22/20.
// Copyright (c) 2020 Eugene Maysyuk. All rights reserved.
//

#import "NavigationMainController.h"
#import "TabBarController.h"
#import "ViewInfoController.h"
#import "ViewGalleryController.h"
#import "ViewAboutController.h"
#import "UIColor_RSColors.h"


@implementation NavigationMainController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setBackground];
    [self addLabel];
    [self addFigures];
    [self addStartButton];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self customizeNavigationBar];
}

- (void)viewDidAppear:(BOOL)animated {
    [UIView animateWithDuration:1
                          delay:0
                        options:UIViewAnimationOptionRepeat
                     animations:^{
                            [self.triangleView setTransform:CGAffineTransformMakeRotation(360)];
                     }
                     completion:^(BOOL finished) {}];

    [UIView animateWithDuration:1
                          delay:0
                        options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat
                     animations:^{
                         self.squareView.center = CGPointMake(self.squareView.center.x, self.squareView.center.y + self.squareView.frame.size.width * 0.1);
                         self.squareView.center = CGPointMake(self.squareView.center.x, self.squareView.center.y - self.squareView.frame.size.width * 0.1);
                     }
                     completion:^(BOOL finished) {}];

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.fromValue = @0.8F;
    animation.toValue = @1.0F;
    animation.duration = 1.0;
    animation.autoreverses = YES;
    animation.repeatCount = HUGE_VALF;
    [self.circleView.layer addAnimation:animation forKey:@"scale"];
}

- (void)setBackground {
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)addLabel {
    UILabel *label = [[UILabel alloc] init];
    label.text = @"Are you ready?";
    label.font = [UIFont systemFontOfSize:24 weight:UIFontWeightMedium];

    [self.view addSubview:label];

    label.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [label.bottomAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:-200],
        [label.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor]
    ]];
}

- (void)addFigures {
    self.circleView = [[UIView alloc] init];
    self.circleView.layer.cornerRadius = 35;
    self.circleView.backgroundColor = [UIColor rsschoolRedColor];
    
    self.squareView = [[UIView alloc] init];
    self.squareView.backgroundColor = [UIColor rsschoolBlueColor];

    UIBezierPath *trianglePath = [UIBezierPath bezierPath];
    [trianglePath moveToPoint:CGPointMake(35, 0)];
    [trianglePath addLineToPoint:CGPointMake(0, 70)];
    [trianglePath addLineToPoint:CGPointMake(70, 70)];
    [trianglePath closePath];
    CAShapeLayer *triangleMaskLayer = [CAShapeLayer layer];
    [triangleMaskLayer setPath:trianglePath.CGPath];
    
    self.triangleView = [[UIView alloc] init];
    self.triangleView.backgroundColor = [UIColor rsschoolGreenColor];
    self.triangleView.layer.mask = triangleMaskLayer;

    UIStackView *stackView = [[UIStackView alloc] init];
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.distribution = UIStackViewDistributionEqualCentering;
    stackView.alignment = UIStackViewAlignmentCenter;

    [stackView addArrangedSubview:self.circleView];
    [stackView addArrangedSubview:self.squareView];
    [stackView addArrangedSubview:self.triangleView];

    self.circleView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [self.circleView.heightAnchor constraintEqualToConstant:70],
        [self.circleView.widthAnchor constraintEqualToConstant:70]
    ]];
    self.squareView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [self.squareView.heightAnchor constraintEqualToConstant:70],
        [self.squareView.widthAnchor constraintEqualToConstant:70]
    ]];
    self.triangleView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [self.triangleView.heightAnchor constraintEqualToConstant:70],
        [self.triangleView.widthAnchor constraintEqualToConstant:70]
    ]];

    [self.view addSubview:stackView];

    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [stackView.topAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:-70],
        [stackView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [stackView.widthAnchor constraintEqualToConstant:300]
    ]];
}

- (void)addStartButton {
    UIButton *startButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    startButton.frame = CGRectMake(50.0, 500.0, 300.0, 50.0);
    startButton.layer.cornerRadius = 55.0 / 2.0f;
    startButton.backgroundColor = [UIColor rsschoolYellowColor];
    startButton.titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
    [startButton setTitle:@"START" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor rsschoolBlackColor] forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(startTapped) forControlEvents:UIControlEventTouchUpInside];
    startButton.translatesAutoresizingMaskIntoConstraints = NO;

    [self.view addSubview:startButton];

    [NSLayoutConstraint activateConstraints:@[
        [startButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [startButton.topAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:140],
        [startButton.heightAnchor constraintEqualToConstant:55],
        [startButton.widthAnchor constraintEqualToConstant:300],
    ]];

}

- (void)startTapped {
    UIViewController *tab1 = [ViewInfoController new];
    tab1.tabBarItem = [[UITabBarItem alloc] init];
    tab1.tabBarItem.image = [[UIImage imageNamed:@"info_unselected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tab1.tabBarItem.selectedImage = [[UIImage imageNamed:@"info_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tab1.tabBarItem.imageInsets = UIEdgeInsetsMake(15, 0, -15, 0);
    tab1.tabBarItem.tag = 0;

    UIViewController *tab2 = [ViewGalleryController new];
    tab2.tabBarItem = [[UITabBarItem alloc] init];
    tab2.tabBarItem.image = [[UIImage imageNamed:@"gallery_unselected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tab2.tabBarItem.selectedImage = [[UIImage imageNamed:@"gallery_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tab2.tabBarItem.imageInsets = UIEdgeInsetsMake(15, 0, -15, 0);
    tab2.tabBarItem.tag = 1;

    UIViewController *tab3 = [ViewAboutController new];
    tab3.tabBarItem = [[UITabBarItem alloc] init];
    tab3.tabBarItem.image = [[UIImage imageNamed:@"home_unselected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tab3.tabBarItem.selectedImage = [[UIImage imageNamed:@"home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tab3.tabBarItem.imageInsets = UIEdgeInsetsMake(15, 0, -15, 0);
    tab3.tabBarItem.tag = 3;

    TabBarController *tabBarController = [TabBarController new];
    tabBarController.viewControllers = @[tab1, tab2, tab3];
    tabBarController.selectedViewController = tab2;

    [self.navigationController pushViewController:tabBarController animated:NO];
}

- (void)customizeNavigationBar {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [UINavigationBar appearance].barTintColor = [UIColor rsschoolYellowColor];

    NSShadow* shadow = [NSShadow new];
    shadow.shadowOffset = CGSizeMake(0.0f, 0.0f);
    shadow.shadowColor = [UIColor blackColor];

    [[UINavigationBar appearance] setTitleTextAttributes: @{
        NSForegroundColorAttributeName: [UIColor blackColor],
        NSFontAttributeName: [UIFont systemFontOfSize:18.0f weight:UIFontWeightSemibold],
        NSShadowAttributeName: shadow
    }];
}


@end
