//
//  ViewController.m
//  GoTWikiaApp
//
//  Created by Dawid Markowski on 07.07.2016.
//  Copyright © 2016 Dawid Markowski. All rights reserved.
//

#import "GoTArticlesViewController.h"
#import "GoTArticleTableViewCell.h"
#import "GoTConstants.h"
#import "UIColor+GoTColorSet.h"
#import "UIView+GoTGradient.h"

@interface GoTArticlesViewController () <UITableViewDataSource, UITableViewDelegate>

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
        self.articlesTableView.delegate = self;
        self.articlesTableView.dataSource = self;
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
        [self.articlesTableView reloadData];
    } onError:^(NSError *error) {
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.articles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GoTArticleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:GoTArticleTableViewCellIdentifier];
    if (cell == nil) {
        cell = [[GoTArticleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:GoTArticleTableViewCellIdentifier];
    }
    GoTArticle *article = self.articles[indexPath.row];
    [cell setupLabelWithTitle:article.title abstract:article.abstract];
    return cell;
}

@end
