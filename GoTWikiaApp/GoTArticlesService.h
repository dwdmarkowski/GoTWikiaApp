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

- (NSArray<GoTArticle *> *)getExpandedArticles;

@end