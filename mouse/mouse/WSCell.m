//
//  WSCell.m
//  mouse
//
//  Created by 刘 伟生 on 15/11/18.
//  Copyright © 2015年 刘 伟生. All rights reserved.
//

#import "WSCell.h"
#import "WSexceple.h"
@interface WSCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UITextField *title;
@property (weak, nonatomic) IBOutlet UITextView *decrop;

@end

@implementation WSCell

//重写setExceple方法
-(void)setExceple:(WSexceple *)exceple{
    _exceple = exceple;
    
    //将数据模型中的数据写入成员属性中http://www.ecbaby.com//data/attachments/2015/04/15/\1429110476580568_large.jpg
    
    self.imageV.image = [UIImage imageNamed:exceple.image];
    self.title.text = exceple.title;
    self.decrop.text = exceple.descrip;
    
}

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

+(instancetype)cellWithTabelView:(UITableView *)tabelView{
    //创建一个cell
    WSCell *cell = (WSCell *)[tabelView dequeueReusableHeaderFooterViewWithIdentifier:@"seasa"];
    
    //如果缓存池中没有,那么就重新创建一个
    cell = [[WSCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"seasa"];
    
    return cell;
}


@end