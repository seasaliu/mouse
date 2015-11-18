//
//  ViewController.m
//  mouse
//
//  Created by 刘 伟生 on 15/11/18.
//  Copyright © 2015年 刘 伟生. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"我对AFNetWorking恨得好疑惑");
    //创建一个请求管理者
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //创建一个请求路径和非文件参数
    NSString *baseUrl = @"http://www.ecbaby.com/index.php";
//     @"http://www.ecbaby.com/index.php?a=msglist&c=iosapp&keywards=吃饭&page=1";
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"text/html", nil]];
    
    NSDictionary *pramas = @{@"a":@"msglist",
                             @"c":@"iosapp",
                             @"keywards":@"吃饭",
                             @"page":@1};
    //常见任务,并发送网络请求
    [manager GET:baseUrl parameters:pramas success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
       //取出responseObejcet中的需要的数据,字典对应的data数据
        NSArray *ifro = responseObject[@"data"];
       
        NSLog(@"%@",ifro.firstObject);
        
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"请求失败%@",error);
    }];

//    [manager POST:baseUrl parameters:pramas success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
//        
//        NSLog(@"真失败");
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"我还以为我弄懂了,其实没有");
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
