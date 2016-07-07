//
//  GoTArticlesService.m
//  GoTWikia
//
//  Created by Dawid Markowski on 07.07.2016.
//  Copyright © 2016 Dawid Markowski. All rights reserved.
//

@import Foundation;

#import "GoTArticlesService.h"

@interface GoTArticlesService ()

@property (strong, nonatomic) GoTArticlesAPI *articlesAPI;

@end

@implementation GoTArticlesService

- (instancetype)initWithArticlesAPI:(GoTArticlesAPI *) articlesAPI {
    self = [super init];
    if (self) {
        self.articlesAPI = articlesAPI;
    }
    return self;
}

- (NSArray<GoTArticle *> *)getExpandedArticles {
    [self.articlesAPI requestForArticlesOnSuccess:^(NSData *receivedData) {
        
    } onError:^(NSError *error) {
        
    }];
    return @[];
}

@end