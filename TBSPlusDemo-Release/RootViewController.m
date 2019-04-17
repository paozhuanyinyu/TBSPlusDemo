//
//  RootViewController.m
//  TBSPlusDemo
//
//  Created by maxli on 2018/12/4.
//  Copyright © 2018 maxli. All rights reserved.
//

#import "RootViewController.h"
#import "SiteInfo.h"
#import <WebKit/WebKit.h>

//引入TBSPlus.framework的头文件
#import <TBSPlus/TBSWKWebView.h>
#import <TBSPlus/TBSWebViewController.h>

@interface RootViewController ()

@property (nonatomic, strong) NSArray *sitesList;

@property (nonatomic, strong) TBSWebViewController *webViewController;

@end

@implementation RootViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.sitesList = [NSArray arrayWithObjects:
                          [SiteInfo initWithDomain:@"手机腾讯网" URL:[NSURL URLWithString:@"https://portal.3g.qq.com/?aid=index&g_ut=3&_wv=1&g_f=22580&plg_auth=1&plg_dev=1"]],
                          [SiteInfo initWithDomain:@"百度" URL:[NSURL URLWithString:@"https://m.baidu.com"]],
                          [SiteInfo initWithDomain:@"手机搜狐网" URL:[NSURL URLWithString:@"https://m.sohu.com"]],
                          [SiteInfo initWithDomain:@"京东" URL:[NSURL URLWithString:@"https://m.jd.com"]],
                          [SiteInfo initWithDomain:@"bilibili" URL:[NSURL URLWithString:@"https://m.bilibili.com/index.html"]],
                          [SiteInfo initWithDomain:@"新浪微博" URL:[NSURL URLWithString:@"https://m.weibo.cn"]],              
                          nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    NSMutableArray *whiteList = [[NSMutableArray alloc] init];
    for (SiteInfo *siteInfo in self.sitesList) {
        [whiteList addObject:siteInfo.domain];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sitesList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    SiteInfo *siteInfo = self.sitesList[indexPath.row];
    cell.textLabel.text = siteInfo.domain;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 48;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SiteInfo *siteInfo = self.sitesList[indexPath.row];

    //创建TBSWebViewController对象
    if (nil == self.webViewController) {
        self.webViewController = [[TBSWebViewController alloc] init];
    }
    //TBSWebViewController *webViewController = [[TBSWebViewController alloc] init];
    
    //设置需要加载的url
    [self.webViewController loadRequestWithURL:siteInfo.url];
    
    //当前1.0版本SDK，TBSWebViewController需要使用UINavigationController push方式来展示
    [self.navigationController pushViewController:_webViewController animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
