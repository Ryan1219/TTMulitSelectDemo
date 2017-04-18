//
//  YZShopTableViewCell.m
//  YZMultiSelectDemo
//
//  Created by zhang liangwang on 17/4/18.
//  Copyright © 2017年 zhangliangwang. All rights reserved.
//

#import "YZShopTableViewCell.h"


@interface YZShopTableViewCell()

@property (nonatomic,strong) UILabel *nameLabel;


@end

@implementation YZShopTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self configUI];
    }
    
    return self;
}


- (void)configUI {
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 200, 30)];
    self.nameLabel.font = [UIFont systemFontOfSize:16];
    self.nameLabel.textAlignment = NSTextAlignmentLeft;
    self.nameLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:self.nameLabel];
    
    self.selectImageView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth-20-15, 22, 16, 16)];
    self.selectImageView.image = [UIImage imageNamed:@"icon_select"];
    [self.contentView addSubview:self.selectImageView];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 59.5, ScreenWidth, 0.5)];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:lineView];
    
}


+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    static NSString *shopCellIndentifier = @"shopCellIndentifier";
    YZShopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:shopCellIndentifier];
    if (cell == nil) {
        cell = [[YZShopTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:shopCellIndentifier];
    }
    
    return cell;
}


- (void)setModel:(YZShopModel *)model {
    
    _model = model;
    self.nameLabel.text = model.name;
    
    self.selectImageView.hidden = !model.isSelected;

}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
