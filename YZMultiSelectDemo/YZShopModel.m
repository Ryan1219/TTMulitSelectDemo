//
//  YZShopModel.m
//  YZMultiSelectDemo
//
//  Created by zhang liangwang on 17/4/18.
//  Copyright © 2017年 zhangliangwang. All rights reserved.
//

#import "YZShopModel.h"

@implementation YZShopModel

+ (instancetype)shopModelWithDict:(NSDictionary *)dict {
    
    YZShopModel *model = [[self alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}

@end
