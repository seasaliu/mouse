//
//  WSCell.h
//  mouse
//
//  Created by 刘 伟生 on 15/11/18.
//  Copyright © 2015年 刘 伟生. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WSexceple;

@interface WSCell : UITableViewCell
//定义一个模型属性
@property (nonatomic, strong) WSexceple *exceple;

+(instancetype)cellWithTabelView:(UITableView *)tabelView;

@end
