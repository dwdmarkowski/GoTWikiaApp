//
//  ViewController.m
//  GoTWikiaApp
//
//  Created by Dawid Markowski on 07.07.2016.
//  Copyright © 2016 Dawid Markowski. All rights reserved.
//

#import <PureLayout/PureLayout.h>
#import "GoTArticlesViewController.h"
#import "GoTArticleTableViewCell.h"
#import "GoTConstants.h"
#import "UIColor+GoTColorSet.h"
#import "UIView+GoTGradient.h"

@interface GoTArticlesViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) GoTArticlesService *articlesService;
@property (strong, nonatomic) NSArray<GoTArticle *> *articles;
@property (strong, nonatomic) UITableView *articlesTableView;
@property (strong, nonatomic) UILabel *tableHeader;

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

#pragma mark UI

- (void)loadView {
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

- (void)setupUI {
    [self.view addGradientWithColors:[UIColor lightBlueColor] secondColor:[UIColor lightYellowColor]];
    [self.view addSubview:self.articlesTableView];
    self.articlesTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.articlesTableView.backgroundColor = [UIColor clearColor];
    self.articlesTableView.contentInset = UIEdgeInsetsMake([[UIApplication sharedApplication] statusBarFrame].size.height, 0, 0, 0);
}

#pragma mark DATA

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

#pragma mark TABLE

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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

@end
