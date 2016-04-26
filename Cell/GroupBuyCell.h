//
//  GroupBuyCell.h
//  Cell
//
//  Created by 软通 on 16/3/15.
//  Copyright © 2016年 软通. All rights reserved.
//
typedef void(^CellBlock)();
#import <UIKit/UIKit.h>

@interface GroupBuyCell : UITableViewCell
-(void)setCellWithDic:(NSDictionary *)dic andState:(NSInteger)integer;
@property(copy,nonatomic)CellBlock block;

+(instancetype)cellWithTableview:(UITableView *)tableview indexPath:(NSIndexPath *)indexPath;

@end
