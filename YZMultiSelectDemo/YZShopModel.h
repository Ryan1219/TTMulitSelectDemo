//
//  YZShopModel.h
//  YZMultiSelectDemo
//
//  Created by zhang liangwang on 17/4/18.
//  Copyright © 2017年 zhangliangwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZShopModel : NSObject

/** <#description#> **/
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign,getter=isSelected) BOOL selected;

+ (instancetype)shopModelWithDict:(NSDictionary *)dict;

@end
