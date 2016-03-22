//
//  MDTool.h
//  DesignerLikeMe
//
//  Created by 李金柱 on 15/12/10.
//  Copyright © 2015年 李金柱. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDTool : NSObject
+ (NSString *)md5:(NSString *)input;

+ (NSString *)sha1:(NSString *)input;

+ (NSString *)getIPAddress:(BOOL)preferIPv4;

+ (NSDictionary *)getIPAddresses;
@end
