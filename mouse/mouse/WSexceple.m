//
//  WSexceple.m
//  mouse
//
//  Created by 刘 伟生 on 15/11/18.
//  Copyright © 2015年 刘 伟生. All rights reserved.
//

#import "WSexceple.h"

@implementation WSexceple

+(instancetype)excepleWithDictionary:(NSDictionary *)dict{
    WSexceple *exceple = [[WSexceple alloc] init];
    
    exceple.descrip = dict[@"description"];
    exceple.title = dict[@"title"];
    NSArray *array = dict[@"images"];
    
    exceple.image = [array.firstObject stringByAppendingString:@"_large.jpg"];
    return exceple;
}

@end
