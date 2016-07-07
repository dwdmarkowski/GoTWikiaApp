//
//  GoTArticlesAPI.h
//  GoTWikia
//
//  Created by Dawid Markowski on 07.07.2016.
//  Copyright © 2016 Dawid Markowski. All rights reserved.
//

@interface GoTArticlesAPI : NSObject

- (void)requestForArticlesOnSuccess:(void(^)(NSData *receivedData))onSuccess onError:(void(^)(NSError *error))onError;

@end
