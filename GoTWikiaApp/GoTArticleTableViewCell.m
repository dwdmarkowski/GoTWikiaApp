//
//  GoTArticleTableViewCell.m
//  GoTWikiaApp
//
//  Created by Dawid Markowski on 08.07.2016.
//  Copyright © 2016 Dawid Markowski. All rights reserved.
//

#import "GoTArticleTableViewCell.h"
#import "GoTConstants.h"

@interface GoTArticleTableViewCell ()

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *abstractLabel;

@end

@implementation GoTArticleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLabel = [[UILabel alloc] init];
        self.abstractLabel = [[UILabel alloc] init];
        [self setupUI];
    }
    return self;
}

- (void)setupLabelWithTitle:(NSString *)title abstract:(NSString *)abstract {
    self.titleLabel.text = title;
    self.abstractLabel.text = abstract;
}

- (void)setupUI {
    self.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.abstractLabel];
}

@end
