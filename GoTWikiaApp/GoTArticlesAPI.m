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

- (NSURL *)baseURL {
    return [NSURL URLWithString:@"http://gameofthrones.wikia.com/api/v1/"];
}

- (void)requestForArticlesOnSuccess:(void(^)(NSData *receivedData))onSuccess onError:(void(^)(NSError *error))onError {
    
}

@end
