//
//  GoTArticleTableViewCell.h
//  GoTWikiaApp
//
//  Created by Dawid Markowski on 08.07.2016.
//  Copyright © 2016 Dawid Markowski. All rights reserved.
//

@import UIKit;

@interface GoTArticleTableViewCell : UITableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

- (void)setupLabelWithTitle:(NSString *)title abstract:(NSString *)abstract;

@end