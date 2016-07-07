//
//  GoTArticlesAPI.m
//  GoTWikia
//
//  Created by Dawid Markowski on 07.07.2016.
//  Copyright © 2016 Dawid Markowski. All rights reserved.
//

@import Foundation;

#import "GoTArticlesAPI.h"

@interface GoTArticlesAPI ()

@property (strong, nonatomic) NSURLSession *session;

@end

@implementation GoTArticlesAPI

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.session = [self createSession];
    }
    return self;
}

- (NSURL *)baseURL {
    return [NSURL URLWithString:@"http://gameofthrones.wikia.com/api/v1/"];
}

- (NSURL *)articlesURL {
    return [[self baseURL] URLByAppendingPathComponent:@"Articles/Top"];
}

- (void)requestForArticlesOnSuccess:(void(^)(NSData *receivedData))onSuccess onError:(void(^)(NSError *error))onError {

}

- (NSURLSession *)createSession {
    return [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
}

@end
