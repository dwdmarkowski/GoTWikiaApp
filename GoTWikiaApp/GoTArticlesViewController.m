//
//  ViewController.m
//  GoTWikiaApp
//
//  Created by Dawid Markowski on 07.07.2016.
//  Copyright © 2016 Dawid Markowski. All rights reserved.
//

#import "GoTArticlesViewController.h"

@interface GoTArticlesViewController ()

@property (strong, nonatomic) GoTArticlesService *articlesService;
@property (strong, nonatomic) NSArray<GoTArticle *> *articles;

@end

@implementation GoTArticlesViewController

- (instancetype)initWithArticlesService:(GoTArticlesService *)articlesService {
    self = [super init];
    if (self) {
        self.articlesService = articlesService;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self getData];
}

- (void)setupUI {
    
}

- (void)getData {
    [self getArticles];
}

- (void)getArticles {
    [self.articlesService getExpandedArticlesOnSuccess:^(NSArray<GoTArticle *> *receivedArticles) {
        self.articles = receivedArticles;
    } onError:^(NSError *error) {
        
    }];
}

@end
