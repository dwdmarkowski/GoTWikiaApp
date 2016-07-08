//
//  ViewController.h
//  GoTWikiaApp
//
//  Created by Dawid Markowski on 07.07.2016.
//  Copyright © 2016 Dawid Markowski. All rights reserved.
//

@import UIKit;

#import "GoTArticlesService.h"

@interface GoTArticlesViewController : UIViewController

- (instancetype)initWithArticlesService:(GoTArticlesService *) articlesService;

@end

