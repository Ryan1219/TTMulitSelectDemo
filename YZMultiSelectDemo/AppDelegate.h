//
//  AppDelegate.h
//  YZMultiSelectDemo
//
//  Created by zhang liangwang on 17/4/18.
//  Copyright © 2017年 zhangliangwang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

