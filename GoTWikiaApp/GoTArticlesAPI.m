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

- (void)requestForArticlesOnSuccess:(void(^)(NSData *receivedData))onSuccess onError:(void(^)(NSError *error))onError {
    [self.session dataTaskWithRequest:[self articlesRequest] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
    }];
}

- (NSURL *)baseURL {
    return [NSURL URLWithString:@"http://gameofthrones.wikia.com/api/v1/"];
}

- (NSURL *)articlesURL {
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithURL:[[self baseURL] URLByAppendingPathComponent:@"Articles/Top"]
                                                  resolvingAgainstBaseURL:YES];
    urlComponents.queryItems = [self queryParameters];
    return urlComponents.URL;
}

- (NSArray<NSURLQueryItem *> *)queryParameters {
    return @[
        [[NSURLQueryItem alloc] initWithName:@"expand" value:@"1"],
        [[NSURLQueryItem alloc] initWithName:@"limit" value:@"75"],
        [[NSURLQueryItem alloc] initWithName:@"category" value:@"Characters"]
    ];
}

- (NSURLRequest *)articlesRequest {
    return [[NSURLRequest alloc] initWithURL:[self articlesURL]];
}

- (NSURLSession *)createSession {
    return [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
}

@end
