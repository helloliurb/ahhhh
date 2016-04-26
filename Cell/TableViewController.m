//
//  TableViewController.m
//  Cell
//
//  Created by 软通 on 16/3/15.
//  Copyright © 2016年 软通. All rights reserved.
//

#import "TableViewController.h"
#import "GroupBuyCell.h"

@interface TableViewController ()
@property(strong,nonatomic)NSMutableArray *datasArr;
@property(strong,nonatomic)NSMutableArray *arr;//cell状态
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.allowsSelection=NO;
    self.tableView.showsVerticalScrollIndicator = FALSE;
   // self.tableView.bounces=NO;
    NSArray *arr1=@[@"5467613143"];
    NSArray *arr2=@[@"5467613143",@"546761314"];
    NSArray *arr3=@[@"5467613143",@"546761314",@"54676131"];
    NSArray *arr4=@[@"5467613143",@"546761314",@"54676131",@"5467613"];
    NSArray *arr5=@[@"5467613143",@"546761314",@"54676131",@"5467613",@"546761314",@"54676131",@"5467613",@"546761314",@"54676131",@"5467613"];
    NSDictionary *dic1=@{@"numbers":arr1,@"time":@"2014-2017",@"storeName":@"火锅城",};
    NSDictionary *dic2=@{@"numbers":arr2,@"time":@"2012-2017",@"storeName":@"电脑城",};
    NSDictionary *dic3=@{@"numbers":arr3,@"time":@"2012-2017",@"storeName":@"电脑城",};
    NSDictionary *dic4=@{@"numbers":arr4,@"time":@"2012-2017",@"storeName":@"电脑城",};
    NSDictionary *dic5=@{@"numbers":arr5,@"time":@"2012-2017",@"storeName":@"电脑城",};
    NSDictionary *dic6=@{@"numbers":arr1,@"time":@"2014-2017",@"storeName":@"火锅城",};
    NSDictionary *dic7=@{@"numbers":arr2,@"time":@"2012-2017",@"storeName":@"电脑城",};
    NSDictionary *dic8=@{@"numbers":arr3,@"time":@"2012-2017",@"storeName":@"电脑城",};
    NSDictionary *dic9=@{@"numbers":arr4,@"time":@"2012-2017",@"storeName":@"电脑城",};
    NSDictionary *dic10=@{@"numbers":arr5,@"time":@"2012-2017",@"storeName":@"电脑城",};
    self.datasArr=[[NSMutableArray alloc]initWithObjects:dic1,dic2,dic3,dic4,dic5,dic6,dic7,dic8,dic9,dic10, nil];
    
    
    self.arr=[NSMutableArray new];
    for (int i=0; i<self.datasArr.count; i++) {//0无展开选项，1收起，2展开
        NSArray *arr=[self.datasArr[i] valueForKey:@"numbers"];
        if (arr.count>2) {
            [self.arr addObject:@1];
        }else{
             [self.arr addObject:@0];
        }
    }
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _datasArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *arr=[self.datasArr[indexPath.row] valueForKey:@"numbers"];
    unsigned long height=0;
    NSInteger i=[_arr[indexPath.row] intValue];

    switch (i) {
        case 0:
            height= 30+arr.count*30;
            break;
        case 1:
            height= 30*3+20;
            break;
        case 2:
            height= 30+arr.count*30+20;
            break;
        default:
            NSLog(@"cell高度出现错误，请检查");
            break;
    }
    return height;
   
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GroupBuyCell *cell = [GroupBuyCell cellWithTableview:tableView indexPath:indexPath];
    NSInteger i=[_arr[indexPath.row] intValue];
    __weak typeof(self)weakSelf=self;
    cell.block=^{
        switch (i) {
            case 1:
                [weakSelf.arr replaceObjectAtIndex:indexPath.row withObject:@2];
                break;
            case 2:
                [weakSelf.arr replaceObjectAtIndex:indexPath.row withObject:@1];
                break;
            default:
                break;
        }
        [weakSelf.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        //[weakSelf.tableView reloadData];
    };
    [cell setCellWithDic:self.datasArr[indexPath.row] andState:[self.arr[indexPath.row] intValue]];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    NSLog(@"tableviewC dealloc");
}
@end
