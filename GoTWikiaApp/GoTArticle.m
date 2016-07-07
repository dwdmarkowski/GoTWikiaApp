//
//  GoTArticle.m
//  GoTWikia
//
//  Created by Dawid Markowski on 07.07.2016.
//  Copyright © 2016 Dawid Markowski. All rights reserved.
//

@import Foundation;

#import "GoTArticle.h"

@interface GoTArticle()

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *abstract;

@end

@implementation GoTArticle

- (instancetype)initWithTitle:(NSString *)title abstract:(NSString *)abstract {
    self = [super init];
    if (self) {
        self.title = title;
        self.abstract = abstract;
    }
    return self;
}

@end