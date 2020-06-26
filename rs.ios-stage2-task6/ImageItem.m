//
// Created by Eugene Maysyuk on 6/26/20.
// Copyright (c) 2020 Eugene Maysyuk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageItem.h"


@implementation ImageItem

- (instancetype)initWithImage:(UIImage *)image title:(NSString *)title subtitle:(NSString *)subtitle {
    self = [super init];
    if (self) {
        self.image = image;
        self.title = title;
        self.subtitle = subtitle;
    }
    return self;
}

@end