//
//  WSCell.m
//  mouse
//
//  Created by 刘 伟生 on 15/11/18.
//  Copyright © 2015年 刘 伟生. All rights reserved.
//

#import "WSCell.h"
#import "WSexceple.h"
#import "UIImageView+WebCache.h"

@interface WSCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *decrop;

@end

@implementation WSCell

//重写setExceple方法
-(void)setExceple:(WSexceple *)exceple{
    _exceple = exceple;
    
    //将数据模型中的数据写入成员属性中http://www.ecbaby.com//data/attachments/2015/04/15/\1429110476580568_large.jpg
    
    
    self.title.text = exceple.title;
    self.decrop.text = exceple.descrip;
    
    //上面的String是一个NSURL,图片都是保存在网络上,需要将数据从网络上下载下来
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:exceple.image] placeholderImage:[UIImage imageNamed:@"17"]];
    
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
    cell = [[[NSBundle mainBundle] loadNibNamed:@"WSCell" owner:nil options:nil] firstObject];
   
    return cell;
  

}


@end
