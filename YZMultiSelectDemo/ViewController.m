//
//  ViewController.m
//  YZMultiSelectDemo
//
//  Created by zhang liangwang on 17/4/18.
//  Copyright © 2017年 zhangliangwang. All rights reserved.
//

#import "ViewController.h"
#import "YZShopModel.h"
#import "YZShopTableViewCell.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

/** <#description#> **/
@property (nonatomic,strong) UITableView *tableView;

/** <#description#> **/
@property (nonatomic,strong) NSMutableArray *dataArray;

/** <#description#> **/
@property (nonatomic,strong) NSMutableArray *deleleArr;

@end

@implementation ViewController

/** <#description#> **/
- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
       
        NSArray *dataArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"shop.plist" ofType:nil]];
        
        NSMutableArray *tempArr = [NSMutableArray array];
        for (NSDictionary *dict in dataArr) {
            YZShopModel *model = [YZShopModel shopModelWithDict:dict];
            [tempArr addObject:model];
        }
        _dataArray = tempArr;
        
    }
    return _dataArray;
}

/** <#description#> **/
- (NSMutableArray *)deleleArr {
    if (_deleleArr == nil) {
        _deleleArr = [NSMutableArray array];
    }
    return _deleleArr;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    
    //系统方法，
    self.tableView.allowsSelectionDuringEditing = true;
    
    UIButton *deleteBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
    [deleteBtn setTitle:@"Delete" forState:UIControlStateNormal];
    [deleteBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [deleteBtn addTarget:self action:@selector(clickDeleteBtnAction) forControlEvents:UIControlEventTouchUpInside];
    deleteBtn.backgroundColor = [UIColor lightGrayColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:deleteBtn];
}

- (void)clickDeleteBtnAction {
    
    // 第一种方法
//    NSMutableArray *tempArr = [NSMutableArray array];
//    for (YZShopModel *model in self.dataArray) {
//        if (model.isSelected) {
//            [tempArr addObject:model];
//        }
//    }
//    
//    [self.dataArray removeObjectsInArray:tempArr];
//    
//    [self.tableView reloadData];
    
    
    // 第二种方法
    [self.dataArray removeObjectsInArray:self.deleleArr];
    
    [self.tableView reloadData];
    
    [self.deleleArr removeAllObjects];
}



//MARK:- 系统方法
- (void)multi { //点击多选
    
    [self.tableView setEditing:!self.tableView.isEditing animated:true];
}

- (void)remove { //删除
    
    NSArray *indexPaths = [self.tableView indexPathsForSelectedRows];
    
    NSMutableArray *tempArr = [NSMutableArray array];
    for (NSIndexPath *indexPath in indexPaths) {
        [tempArr addObject:self.dataArray[indexPath.row]];
    }
    
    [self.dataArray removeObjectsInArray:tempArr];
    
    [self.tableView reloadData];
}


//MARK:-UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    YZShopTableViewCell *cell = [YZShopTableViewCell cellWithTableView:tableView];
    // 第一种方法
    cell.model = self.dataArray[indexPath.row];
    // 第二种方法
    cell.selectImageView.hidden = ![self.deleleArr containsObject:cell.model];
    
    return cell;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"----%ld",indexPath.row);
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    // 第一种方法
//    YZShopModel *model = self.dataArray[indexPath.row];
//    model.selected = !model.isSelected;
//    
//    [self.tableView reloadData];
    
    // 第二种方法
    YZShopModel *model = self.dataArray[indexPath.row];
    if ([self.deleleArr containsObject:model]) {
        [self.deleleArr removeObject:model];
    } else {
        [self.deleleArr addObject:model];
    }
    
    [self.tableView reloadData];
}









@end
