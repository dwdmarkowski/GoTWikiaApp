//
//  UIView+GoTGradient.m
//  GoTWikiaApp
//
//  Created by Dawid Markowski on 08.07.2016.
//  Copyright © 2016 Dawid Markowski. All rights reserved.
//

#import "UIView+GoTGradient.h"

@implementation UIView (GoTGradient)

- (void)addGradientWithColors:(UIColor *)firstColor secondColor:(UIColor *)secondColor {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];

    gradientLayer.colors = [NSArray arrayWithObjects:(id)[firstColor CGColor], (id)[secondColor CGColor], nil];
    gradientLayer.locations = @[@0.0, @1.0];
    gradientLayer.startPoint = CGPointMake(0.0, 0.0);
    gradientLayer.endPoint = CGPointMake(1.0, 1.0);
    gradientLayer.frame = CGRectMake(0.0, 0.0, self.frame.size.width, self.frame.size.height);

    [self.layer insertSublayer:gradientLayer atIndex:0];
}

@end
