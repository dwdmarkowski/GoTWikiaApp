//
//  GoTArticle.h
//  GoTWikia
//
//  Created by Dawid Markowski on 07.07.2016.
//  Copyright © 2016 Dawid Markowski. All rights reserved.
//

@interface GoTArticle : NSObject

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *abstract;

- (instancetype)initWithTitle:(NSString *)title abstract:(NSString *)abstract;

@end