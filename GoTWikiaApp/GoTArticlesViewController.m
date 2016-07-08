//
//  ViewController.m
//  GoTWikiaApp
//
//  Created by Dawid Markowski on 07.07.2016.
//  Copyright © 2016 Dawid Markowski. All rights reserved.
//

#import "GoTArticlesViewController.h"
#import "UIColor+GoTColorSet.h"
#import "UIView+GoTGradient.h"

@interface GoTArticlesViewController ()

@property (strong, nonatomic) GoTArticlesService *articlesService;
@property (strong, nonatomic) NSArray<GoTArticle *> *articles;
@property (strong, nonatomic) UITableView *articlesTableView;

@end

@implementation GoTArticlesViewController

- (instancetype)initWithArticlesService:(GoTArticlesService *)articlesService {
    self = [super init];
    if (self) {
        self.articlesService = articlesService;
        self.articlesTableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self getData];
}

- (void)loadView {
    self.view = self.articlesTableView;
}

- (void)setupUI {
    self.articlesTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.articlesTableView addGradientWithColors:[UIColor lightBlueColor] secondColor:[UIColor lightYellowColor]];
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
