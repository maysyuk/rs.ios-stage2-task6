//
// Created by Eugene Maysyuk on 6/26/20.
// Copyright (c) 2020 Eugene Maysyuk. All rights reserved.
//

#import "InfoTableViewCell.h"
#import "ImageItem.h"


@implementation InfoTableViewCell

- (void)configureWithCell:(ImageItem *)imageItem {
    self.imageView.image = imageItem.image;
    self.textLabel.text = imageItem.title;
    self.detailTextLabel.text = imageItem.subtitle;
}



@end