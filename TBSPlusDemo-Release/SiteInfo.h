//
//  SiteInfo.h
//  TBSPlusDemo
//
//  Created by maxli on 2018/12/4.
//  Copyright © 2018 maxli. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SiteInfo : NSObject

@property (strong, nonatomic) NSString *domain;
@property (strong, nonatomic) NSURL *url;

+ (instancetype)initWithDomain:(NSString *)domain URL:(NSURL *)url;

@end

NS_ASSUME_NONNULL_END
