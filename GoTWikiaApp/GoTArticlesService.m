//
//  GoTArticlesService.m
//  GoTWikia
//
//  Created by Dawid Markowski on 07.07.2016.
//  Copyright © 2016 Dawid Markowski. All rights reserved.
//

@import Foundation;

#import "GoTArticlesService.h"
#import "GoTArticle.h"

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

- (void)getExpandedArticlesOnSuccess:(void(^)(NSArray<GoTArticle *> *receivedArticles))onSuccess onError:(void(^)(NSError *error))onError {
    [self.articlesAPI requestForArticlesOnSuccess:^(NSData *receivedData) {
        onSuccess([self receiveArticlesFromData:receivedData]);
    } onError:^(NSError *error) {
        onError(error);
    }];
}

- (NSArray<GoTArticle *> *)receiveArticlesFromData:(NSData *)receivedData {
    NSError *error = nil;
    NSDictionary<NSString *, id> *json = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingAllowFragments error:&error];
    NSDictionary<NSString *, id> *articles = json[@"items"];
    NSMutableArray<GoTArticle *> *mappedArticles = [[NSMutableArray alloc] init];
    for (NSDictionary<NSString *, id> *article in articles) {
        [mappedArticles addObject:[[GoTArticle alloc] initWithTitle:article[@"title"] abstract:article[@"abstract"]]];
    }
    return mappedArticles;
}

@end