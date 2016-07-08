//
//  GoTArticleTableViewCell.m
//  GoTWikiaApp
//
//  Created by Dawid Markowski on 08.07.2016.
//  Copyright © 2016 Dawid Markowski. All rights reserved.
//

#import <PureLayout/PureLayout.h>
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
    [self setupTitleLabelUI];
    [self setupAbstractLabelUI];
    [self setupTitleLabelConstraints];
    [self setupAbstractLabelConstraints];
}

- (void)setupTitleLabelConstraints {
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.titleLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
    [self.titleLabel autoSetDimension:ALDimensionHeight toSize:40];
}

- (void)setupAbstractLabelConstraints {
    self.abstractLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.abstractLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [self.abstractLabel autoSetDimension:ALDimensionHeight toSize:60];
}

- (void)setupTitleLabelUI {
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
}

- (void)setupAbstractLabelUI {
    self.abstractLabel.textAlignment = NSTextAlignmentCenter;
    self.abstractLabel.numberOfLines = 2;
    self.abstractLabel.font = [UIFont systemFontOfSize:14];
}

@end
