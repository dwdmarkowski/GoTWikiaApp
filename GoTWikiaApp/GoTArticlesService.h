//
//  GoTArticlesService.h
//  GoTWikia
//
//  Created by Dawid Markowski on 07.07.2016.
//  Copyright © 2016 Dawid Markowski. All rights reserved.
//

#import "GoTArticlesAPI.h"
#import "GoTArticle.h"

@interface GoTArticlesService : NSObject

- (instancetype)initWithArticlesAPI:(GoTArticlesAPI *) articlesAPI;

- (void)getExpandedArticlesOnSuccess:(void(^)(NSArray<GoTArticle *> *receivedArticles))onSuccess onError:(void(^)(NSError *error))onError;

@end