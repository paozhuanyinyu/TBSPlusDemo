//
//  SiteInfo.m
//  TBSPlusDemo
//
//  Created by maxli on 2018/12/4.
//  Copyright © 2018 maxli. All rights reserved.
//

#import "SiteInfo.h"

@implementation SiteInfo

+ (instancetype)initWithDomain:(NSString *)domain URL:(NSURL *)url {
    SiteInfo *site = [[SiteInfo alloc] init];
    site.domain = [domain copy];
    site.url = [url copy];
    return site;
}

@end
