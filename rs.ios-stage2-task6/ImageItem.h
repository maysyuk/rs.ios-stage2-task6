//
// Created by Eugene Maysyuk on 6/26/20.
// Copyright (c) 2020 Eugene Maysyuk. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ImageItem : NSObject

@property(strong, nonatomic) UIImage *image;
@property(strong, nonatomic) NSString *title;
@property(strong, nonatomic) NSString *subtitle;

- (instancetype)initWithImage:(UIImage *)image title:(NSString *)title subtitle:(NSString *)subtitle;

@end