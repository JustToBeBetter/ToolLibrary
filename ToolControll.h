//
//  ToolControll.h
//  DesignerLikeMe
//
//  Created by 李金柱 on 15/10/15.
//  Copyright (c) 2015年 李金柱. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToolControll : NSObject

+ (UILabel *)creatLabelWithFrame:(CGRect)frame text:(NSString *)text fontName:(NSString *)fontName size:(CGFloat)size isAttribute:(BOOL)isAttribute;
+ (UIButton *)creatButtonWithFrame:(CGRect)frame target:(id)target sel:(SEL)sel tag:(NSInteger)tag imageUrl:(NSString *)imageUrl;
//创建button可以创建 标题按钮和 图片按钮
+ (UIButton *)creatButtonWithFrame:(CGRect)frame
                            target:(id)target
                               sel:(SEL)sel
                               tag:(NSInteger)tag
                             image:(NSString *)name
                             title:(NSString *)title;
//创建UIImageView
+ (UIImageView *)creatImageViewWithFrame:(CGRect)frame
                               imageName:(NSString *)name;
//创建UITextField
+ (UITextField *)creatTextFieldWithFrame:(CGRect)frame
                             placeHolder:(NSString *)placeholder
                                delegate:(id <UITextFieldDelegate>)delegate;
+ (UIImageView *)creatDesignersViewWithFrame:(CGRect)frame
                                       title:(NSString *)title;

+ (UIButton *)creatButtonWithFrame:(CGRect)frame
                            target:(id)target
                               sel:(SEL)sel
                             title:(NSString *)title;
//把一个秒字符串 转化为真正的本地时间
+ (NSString *)dateStringFromNumberTimer:(NSString *)timerStr;
//动态 计算行高
//根据字符串的实际内容的多少 在固定的宽度和字体的大小，动态的计算出实际的高度
+ (CGFloat)textHeightFromTextString:(NSString *)text width:(CGFloat)textWidth fontSize:(CGFloat)size;
+ (NSString *)getFullPathWithFile:(NSString *)urlName;
//获取 当前设备版本
+ (double)getCurrentIOS;
//获取设计师标签
+ (NSString *)getDesignerTag:(NSString *)designerid;
//检测 缓存文件 是否超时
+ (BOOL)isTimeOutWithFile:(NSString *)filePath timeOut:(double)timeOut ;
//判断是否是空字符串是返回yes 否则返回no
+ (BOOL) isBlankString:(NSString *)string;
//判断是否是有效密码 是返回yes 否则返回no
+ (BOOL)isAvailablePassword:(NSString *)password;
//请求用户数据时用户的uid，mcode，apptoken
+ (NSString *)getUid;
//返回订单状态
+ (NSString *)getOrderStatus:(NSString *)orderStatus;
//返回退款状态
+ (NSString *)getOrderRefundStatus:(NSString *)orderRefundStatus;
@end
