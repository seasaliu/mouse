//
//  WSexceple.h
//  mouse
//
//  Created by 刘 伟生 on 15/11/18.
//  Copyright © 2015年 刘 伟生. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WSexceple : NSObject
//定义一个描述属性
@property (nonatomic, strong) NSString *descrip;

//定义一个图片属性
@property (nonatomic, strong) NSString *image;

//定义一个masgid属性
@property (nonatomic, assign) NSNumber *msgid;

//定义一个title属性
@property (nonatomic, strong) NSString *title;

//定义一个url属性
@property (nonatomic, strong) NSString *url;

+(instancetype)excepleWithDictionary:(NSDictionary *)dict;

@end
