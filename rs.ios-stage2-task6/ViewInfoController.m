//
// Created by Eugene Maysyuk on 6/22/20.
// Copyright (c) 2020 Eugene Maysyuk. All rights reserved.
//

#import "ViewInfoController.h"
#import "ImageItem.h"
#import "InfoTableViewCell.h"


@implementation ViewInfoController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initDataSource];
    [self addTableView];
    [self setBackground];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    self.parentViewController.navigationItem.title = @"Info";
}

- (void)initDataSource {
    ImageItem *img1 = [[ImageItem alloc] initWithImage:[UIImage imageNamed:@"image"] title:@"IMG_0001.HEIC" subtitle:@"4032x3024"];
    ImageItem *img2 = [[ImageItem alloc] initWithImage:[UIImage imageNamed:@"image"] title:@"IMG_0002.HEIC" subtitle:@"4032x3024"];
    ImageItem *img3 = [[ImageItem alloc] initWithImage:[UIImage imageNamed:@"video"] title:@"mov3932.mov" subtitle:@"720x480 01:23"];
    ImageItem *img4 = [[ImageItem alloc] initWithImage:[UIImage imageNamed:@"audio"] title:@"sample.mp3" subtitle:@"01:23"];
    ImageItem *img5 = [[ImageItem alloc] initWithImage:[UIImage imageNamed:@"audio"] title:@"sample.mp3" subtitle:@"01:23"];
    ImageItem *img6 = [[ImageItem alloc] initWithImage:[UIImage imageNamed:@"image"] title:@"IMG_003.HEIC" subtitle:@"4032x3024"];
    ImageItem *img7 = [[ImageItem alloc] initWithImage:[UIImage imageNamed:@"image"] title:@"IMG_004.HEIC" subtitle:@"4032x3024"];
    ImageItem *img8 = [[ImageItem alloc] initWithImage:[UIImage imageNamed:@"image"] title:@"IMG_005.HEIC" subtitle:@"4032x3024"];
    ImageItem *img9 = [[ImageItem alloc] initWithImage:[UIImage imageNamed:@"image"] title:@"IMG_006.HEIC" subtitle:@"4032x3024"];
    ImageItem *img10 = [[ImageItem alloc] initWithImage:[UIImage imageNamed:@"image"] title:@"IMG_007.HEIC" subtitle:@"4032x3024"];
    ImageItem *img11 = [[ImageItem alloc] initWithImage:[UIImage imageNamed:@"image"] title:@"IMG_008.HEIC" subtitle:@"4032x3024"];
    ImageItem *img12 = [[ImageItem alloc] initWithImage:[UIImage imageNamed:@"image"] title:@"IMG_009.HEIC" subtitle:@"4032x3024"];
    self.items = [NSMutableArray arrayWithArray:@[img1, img2, img3, img4, img5, img6, img7, img8, img9, img10, img11, img12]];
}

-(void)addTableView {
    self.tableView = [[UITableView alloc] init];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[InfoTableViewCell class] forCellReuseIdentifier:@"CellId"];

    [self.view addSubview:self.tableView];

    [NSLayoutConstraint activateConstraints:@[
        [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
    ]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    [cell configureWithCell:self.items[(NSUInteger) indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70.0;
}

- (void)setBackground {
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
