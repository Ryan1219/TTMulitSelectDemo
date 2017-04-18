//
//  YZShopTableViewCell.h
//  YZMultiSelectDemo
//
//  Created by zhang liangwang on 17/4/18.
//  Copyright © 2017年 zhangliangwang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YZShopModel.h"

@interface YZShopTableViewCell : UITableViewCell

/** <#description#> **/
@property (nonatomic,strong) YZShopModel *model;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

/** <#description#> **/
@property (nonatomic,strong) UIImageView *selectImageView;

@end
