//
//  GroupBuyCell.m
//  Cell
//
//  Created by 软通 on 16/3/15.
//  Copyright © 2016年 软通. All rights reserved.
//
#define WIDTH self.superview.frame.size.width
#import "GroupBuyCell.h"


@interface GroupBuyCell ()

@property (nonatomic,weak) UIImageView *backgroundImageView;

@end

@implementation GroupBuyCell

-(void)setCellWithDic:(NSDictionary *)dic andState:(NSInteger)integer{
    //self.backgroundView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cellBack"]];
    
    
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    
    UIImageView *backgroundImageView = [[UIImageView alloc]init];
    backgroundImageView.image = [UIImage imageNamed:@"cellBack"];
    [self.contentView addSubview:backgroundImageView];
    _backgroundImageView = backgroundImageView;
    
    NSArray * numbers=[dic valueForKey:@"numbers"];
    NSString * time=[dic valueForKey:@"time"];
    NSString * storeName=[dic valueForKey:@"storeName"];
    
    UIImageView * headView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 0, WIDTH-20, 30)];//
    headView.image = [UIImage imageNamed:@"used_refunded_coupon_top"];
    //headView.backgroundColor=[UIColor blueColor];
    UILabel *storeNameL=[[UILabel alloc]initWithFrame:CGRectMake(20, 0, WIDTH/2, 30)];//
    storeNameL.text=storeName;
    [headView addSubview:storeNameL];
    UILabel *timeL=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH/2, 0, WIDTH/2, 30)];//
    timeL.text=time;
    [headView addSubview:timeL];
    [self.contentView addSubview:headView];

    
    
    switch (integer) {
        case 0://不需要展开
            for (int i=0; i<numbers.count; i++) {
                [self creatViewWithNumber:numbers[i] andID:i];
            }
            break;
        case 1:
            [self creatViewWithNumber:numbers[0] andID:0];
            [self creatViewWithNumber:numbers[1] andID:1];
            [self creatBottomViewWithViewNumber:2 andNumberCount:(int)numbers.count];
            break;
        case 2:
            for (int i=0; i<numbers.count; i++) {
                [self creatViewWithNumber:numbers[i] andID:i];
            }
            [self creatBottomViewWithViewNumber:(int)numbers.count andNumberCount:(int)numbers.count];
            break;
        default:
            break;
    }
}

-(void)creatViewWithNumber:(NSString *)number andID:(int)id{
    UIView *view=[UIView new];
    //view.backgroundColor=[UIColor redColor];
    UILabel *l1=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, 50, 20)];
    l1.text=@"券号";
    l1.font = [UIFont systemFontOfSize:14];
    [view addSubview:l1];
    UILabel *l2=[[UILabel alloc]initWithFrame:CGRectMake(50, 5, 150, 20)];
    l2.text=number;
    l2.font = [UIFont systemFontOfSize:14];
    [view addSubview:l2];
    [self.contentView addSubview:view];
    view.frame=CGRectMake(20, id*30+30, WIDTH, 30);
    
    _backgroundImageView.frame = CGRectMake(10, 30, WIDTH-20, CGRectGetMaxY(view.frame)-30);
}

-(void)creatBottomViewWithViewNumber:(int)i andNumberCount:(int)j{
    UIView * bottomView=[[UIView alloc]init];
   // bottomView.backgroundColor=[UIColor yellowColor];
    [self.contentView addSubview:bottomView];
    UIButton *b=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH/2-50, 0, 100, 20)];
   // b.backgroundColor=[UIColor blackColor];
    [bottomView addSubview:b];
    if (i>2) {
        [b setTitle:@"收起" forState:UIControlStateNormal];
    }else{
        [b setTitle:[NSString stringWithFormat:@"更多%d张券",j-2] forState:UIControlStateNormal];
    }
    
    
    [b addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    bottomView.frame=CGRectMake(0, 30+i*30, WIDTH, 20);
    
    _backgroundImageView.frame = CGRectMake(10, 30, WIDTH-20, CGRectGetMaxY(bottomView.frame)-30);
}

-(void)tap{
    self.block();
    NSLog(@"tap");
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSLog(@"111");
    }
    return self;
}

+(instancetype)cellWithTableview:(UITableView *)tableview indexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"GroupBuyCell";
    [tableview registerClass:self forCellReuseIdentifier:ID];
    GroupBuyCell *cell = [tableview dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    return cell;
}





- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)dealloc{
    NSLog(@"cell dealloc");
}
@end
