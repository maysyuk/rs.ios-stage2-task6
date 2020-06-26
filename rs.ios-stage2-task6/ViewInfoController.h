//
// Created by Eugene Maysyuk on 6/22/20.
// Copyright (c) 2020 Eugene Maysyuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class ImageItem;


@interface ViewInfoController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray <ImageItem*> *items;

@end
