//
//  ViewController.m
//  mouse
//
//  Created by 刘 伟生 on 15/11/18.
//  Copyright © 2015年 刘 伟生. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "WSexceple.h"
#import "WSCell.h"
#import "MJRefresh.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *exceples;

@property (nonatomic, assign) NSInteger page;

@end

@implementation ViewController

//懒加载数组
-(NSMutableArray *)exceples{
    if (!_exceples) {
        _exceples = [NSMutableArray array];
    }
    return _exceples;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
     __weak __typeof(self) weakSelf = self;
    
    //设置回调   一旦刷新就会马上回调这个方法们也就是bloc块中的内容   下拉刷新
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf setUpRefreshHead:YES];
    }];
    
    //同样,一旦刷新下拉刷新,就会调用这个方法中的block快的内容
    self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
    } ];
    
    //程序启动后,马上启动下拉刷新刷新
    
    [self.tableView.header beginRefreshing];

}


-(void)setUpRefreshHead:(BOOL) status{
    
    //判断状态,如果状态是yes,那么说明这是上拉刷新,如果是no,那么说明这时候正在下来刷新,因为上拉刷新和下刷新都需要使用到相同的数据请求和数据转换,那么可以将上拉刷新和下拉刷新公用一段代码,这样就可以减小代码量
    
    if (status) {
        self.page += 1;
    }else{
        self.page = 1;
    }
    
    
    NSLog(@"我对AFNetWorking恨得好疑惑");
    //创建一个请求管理者
    //    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //创建一个请求路径和非文件参数
    NSString *baseUrl = @"http://www.ecbaby.com/index.php";
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"text/html",nil]];
    
    NSDictionary *pramas = @{@"a":@"msglist",
                             @"c":@"iosapp",
                             @"keywards":@"吃饭",
                             @"page":@(self.page)};
    //常见任务,并发送网络请求
    [manager GET:baseUrl parameters:pramas success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        //取出responseObejcet中的需要的数据,字典对应的data数据
        NSArray *ifro = responseObject[@"data"];
        
        NSLog(@"%@",[ifro class]);
        
        for (NSDictionary *dict in ifro) {
            
            WSexceple *exceple = [WSexceple excepleWithDictionary:dict];
            //
            [self.exceples addObject:exceple];
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                
                [self.tableView reloadData];
            }];
        }
        
        NSLog(@"刷新完毕");
        //同样,如果数据获取完毕,那么也应该停止刷新
        [self.tableView.header endRefreshing];
        [self.tableView.footer endRefreshing];
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"请求失败%@",error);
        
        //如果请求失败的时候,也就是说无法获取数据,不能够刷新数据,这时候需要停止刷新,不然会非常浪费性能
        [self.tableView.header endRefreshing];
        [self.tableView.footer endRefreshing];
        
    }];
    
    
}


-(void)setUpRefreshFooter{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.exceples.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WSCell *cell = [WSCell cellWithTabelView:tableView];
    
    NSLog(@"我来了");
    //取出数组中对应的元素进行赋值给cell中的数组模型
    cell.exceple = self.exceples[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
    
}
@end
