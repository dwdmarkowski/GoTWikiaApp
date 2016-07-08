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