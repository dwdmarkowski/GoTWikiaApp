//
//  AppDelegate.m
//  GoTWikiaApp
//
//  Created by Dawid Markowski on 07.07.2016.
//  Copyright © 2016 Dawid Markowski. All rights reserved.
//

#import "AppDelegate.h"
#import "GoTArticlesViewController.h"
#import "GoTArticlesService.h"
#import "GoTArticlesAPI.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self setupRootVC];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)setupRootVC {
    GoTArticlesAPI *articlesAPI = [[GoTArticlesAPI alloc] init];
    GoTArticlesService * articlesService = [[GoTArticlesService alloc] initWithArticlesAPI:articlesAPI];
    GoTArticlesViewController *rootVC = [[GoTArticlesViewController alloc] initWithArticlesService:articlesService];
    self.window.rootViewController = rootVC;
}

@end
