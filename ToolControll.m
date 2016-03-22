//
//  ToolControll.m
//  DesignerLikeMe
//
//  Created by 李金柱 on 15/10/15.
//  Copyright (c) 2015年 李金柱. All rights reserved.
//

#import "ToolControll.h"


@implementation ToolControll

+ (UILabel *)creatLabelWithFrame:(CGRect)frame text:(NSString *)text fontName:(NSString *)fontName size:(CGFloat)size isAttribute:(BOOL)isAttribute{
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.numberOfLines = 0;
    label.font = [UIFont fontWithName:fontName size:size];
    if (isAttribute&&![ToolControll isBlankString:text]) {
        NSAttributedString *attributedString =[[NSAttributedString alloc] initWithString:text attributes:@{NSKernAttributeName : @(1.75f)}];
        [label setAttributedText:attributedString];
    }else{
        label.text = text;
    }
  
    return [label autorelease];
}
+ (UITextField *)creatTextFieldWithFrame:(CGRect)frame placeHolder:(NSString *)placeholder delegate:(id<UITextFieldDelegate>)delegate {
    
    UITextField *textField = [[UITextField alloc]initWithFrame:frame];
    if (placeholder) {
        textField.placeholder = placeholder;
    }
    textField.delegate = delegate;
    textField.returnKeyType = UIReturnKeyDone;
    [textField setValue:[UIFont fontWithName:kFontText size:kTextSize] forKeyPath:@"_placeholderLabel.font"];
    textField.font = [UIFont fontWithName:kFontText size:kTextSize];
    
    return textField;
}
+ (UIButton *)creatButtonWithFrame:(CGRect)frame target:(id)target sel:(SEL)sel tag:(NSInteger)tag image:(NSString *)name title:(NSString *)title{
    
    UIButton *button = nil;
    if (name) {
        //创建背景图片 按钮
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    
        if (title) {//标题按钮
            
            [button setTitle:title forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//            button.titleLabel.font = [UIFont fontWithName:kFontText size:kTitleSize];
//            button.contentHorizontalAlignment =   UIControlContentHorizontalAlignmentCenter;
//            [button setImageEdgeInsets:UIEdgeInsetsMake(0, 12.5,5, 12.5)];
//            [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
            
            
        }
        
    }else if (title) {
        //创建标题按钮
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:title forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont fontWithName:kFontText size:kTextSize];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
   
        button.layer.borderColor = kLightGaryColor.CGColor;
        button.layer.borderWidth = 1;
    }
    
    button.frame = frame;
    button.tag = tag;
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    return button;
}
+ (UIButton *)creatButtonWithFrame:(CGRect)frame target:(id)target sel:(SEL)sel tag:(NSInteger)tag imageUrl:(NSString *)imageUrl{
    
    UIButton *button = nil;
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button  sd_setImageWithURL:[NSURL URLWithString:imageUrl] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"placeholder"]];
    button.backgroundColor = kGrayColor;
    button.frame = frame;
    button.tag = tag;
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    return button;
}
//创建首页button
+ (UIButton *)creatButtonWithFrame:(CGRect)frame target:(id)target sel:(SEL)sel title:(NSString *)title{
    
    UIButton *button = nil;
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.layer.borderWidth = 2;
    button.layer.borderColor = kBlackColor.CGColor;
    
    button.frame = frame;
    button.contentHorizontalAlignment =   UIControlContentHorizontalAlignmentCenter;
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:kFontText size:kTitleSize];
    button.titleLabel.textColor = [UIColor blackColor];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"right"] forState:UIControlStateNormal];
    [button setImageEdgeInsets:UIEdgeInsetsMake(13.25, frame.size.width - 65.5, 13.25,60)];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(10, 0, 10, 10)];
  
 
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    return button;

}
+ (UIImageView *)creatImageViewWithFrame:(CGRect)frame imageName:(NSString *)name{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image  = [UIImage imageNamed:name];
    return [imageView autorelease];
}
+ (UIImageView *)creatDesignersViewWithFrame:(CGRect)frame title:(NSString *)title{
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    UILabel *starLabel = [ToolControll creatLabelWithFrame:CGRectMake(0, imageView.frame.size.height/2 - 20, imageView.frame.size.width, 20)
                                                      text:title fontName:kFontText size:kTextSize - 1 isAttribute:NO];
    starLabel.textAlignment = NSTextAlignmentCenter;
    starLabel.textColor = [UIColor whiteColor];
    [imageView addSubview:starLabel];
    
    UILabel *view = [ToolControll creatLabelWithFrame:CGRectMake(0, imageView.frame.size.height - 30, imageView.frame.size.width, 20)
                                                      text:@"VIEW" fontName:kFontText size:kTextSize - 2 isAttribute:NO];
    view.textAlignment = NSTextAlignmentCenter;
    view.textColor = [UIColor whiteColor];
    [imageView addSubview:view];
    imageView.backgroundColor = kGrayColor;
    
    return [imageView autorelease];
}
+ (NSString *)dateStringFromNumberTimer:(NSString *)timerStr {
    //转化为Double
    double t = [timerStr doubleValue];
    //计算出距离1970的NSDate
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:t];
    //转化为 时间格式化字符串
    NSDateFormatter *df = [[[NSDateFormatter alloc] init] autorelease];
    df.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    //转化为 时间字符串
    return [df stringFromDate:date];
}
//动态 计算行高
//根据字符串的实际内容的多少 在固定的宽度和字体的大小，动态的计算出实际的高度
+ (CGFloat)textHeightFromTextString:(NSString *)text width:(CGFloat)textWidth fontSize:(CGFloat)size{
    if ([ToolControll getCurrentIOS] >= 7.0) {
        //iOS7之后
        /*
         第一个参数: 预设空间 宽度固定  高度预设 一个最大值
         第二个参数: 行间距
         第三个参数: 属性字典 可以设置字体大小
         */
     
        NSDictionary *dict = @{NSFontAttributeName:[UIFont fontWithName:kFontText size:size]};
        CGRect rect = [text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:dict context:nil];
        //返回计算出的行高
        return rect.size.height;
        
    }else {
        //iOS7之前
        /*
         1.第一个参数  设置的字体固定大小
         2.预设 宽度和高度 宽度是固定的 高度一般写成最大值
         3.换行模式 字符换行
         */
        CGSize textSize = [text sizeWithFont:[UIFont fontWithName:kFontText size:size] constrainedToSize:CGSizeMake(textWidth, MAXFLOAT) lineBreakMode:NSLineBreakByCharWrapping];
        return textSize.height;//返回 计算出得行高
    }
}

//获取iOS版本号
+ (double)getCurrentIOS {
    
    return [[[UIDevice currentDevice] systemVersion] doubleValue];
}
//获取 一个文件 在沙盒Library/Caches/ 目录下的路径
+ (NSString *)getFullPathWithFile:(NSString *)urlName {
    
    //先获取 沙盒中的Library/Caches/路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *myCacheDirectory = [docPath stringByAppendingPathComponent:@"caches"];
    //检测Caches 文件夹是否存在
    if (![[NSFileManager defaultManager] fileExistsAtPath:myCacheDirectory]) {
        //不存在 那么创建
        [[NSFileManager defaultManager] createDirectoryAtPath:myCacheDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    }
    //用md5进行 加密 转化为 一串十六进制数字 (md5加密可以把一个字符串转化为一串唯一的用十六进制表示的串)
    NSString * newName = [urlName md5Encrypt];
    
    //拼接路径
    return [myCacheDirectory stringByAppendingPathComponent:newName];
}
+ (NSString *)getDesignerTag:(NSString *)designerid{
    
    NSString *tagStr = nil;
    if ([designerid isEqualToString:@"1"]) {
        tagStr = @"新晋设计师";
    }else if ([designerid isEqualToString:@"2"]){
        tagStr = @"独立设计师";
    }else if ([designerid isEqualToString:@"3"]){
        tagStr = @"明星设计师";
    }else if ([designerid isEqualToString:@"4"]){
        tagStr = @"达人设计师";
    }
    return tagStr;
}
//检测 缓存文件 是否超时
+ (BOOL)isTimeOutWithFile:(NSString *)filePath timeOut:(double)timeOut {
    //获取文件的属性
    NSDictionary *fileDict = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
    //获取文件的上次的修改时间
    NSDate *lastModfyDate = fileDict.fileModificationDate;
    //算出时间差 获取当前系统时间 和 lastModfyDate时间差
    NSTimeInterval sub = [[NSDate date] timeIntervalSinceDate:lastModfyDate];
    if (sub < 0) {
        sub = -sub;
    }
    //比较是否超时
    if (sub > timeOut) {
        //如果时间差 大于 设置的超时时间 那么就表示超时
        return YES;
    }
    return NO;
}
//判断是否是空字符串
+ (BOOL) isBlankString:(NSString *)string {
    
    if (string == nil
        ||string == NULL
        ||[string isKindOfClass:[NSNull class]]
        ||[[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        
        return YES;
        
    }else{
        return NO;
    }
    
}
//设置是否是有效密码
+ (BOOL)isAvailablePassword:(NSString *)password{
    
    NSString *ps = @"^[0-9_a-zA-Z]{6,20}$";
    NSPredicate *regex = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",ps];
    
    if ([regex evaluateWithObject:password] == YES){
        return YES;
    }
    else
    {
        return NO;
    }
    
}
+ (NSString *)getUid{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
#if 1
    NSString *uid = [userDefaults objectForKey:@"Uid"];
#else
    NSString *uid = @"18";
#endif
    NSString *mcode = [userDefaults objectForKey:@"mcode"];

    NSString *apptoken = [userDefaults objectForKey:@"app_token"];
    NSString *userinfo = [NSString stringWithFormat:@"uid=%@&mcode=%@&app_token=%@",uid,mcode,apptoken];
    return userinfo;
}
- (BOOL)isMobileNumber:(NSString *)numstring{
    
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189,181
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     * 中国联通：China Unicom
     * 130,131,132,152,155,156,185,186,181
     */
    NSString * CU = @"^1(3[0-2]|5[256]|8[156])\\d{8}$";
    /**
     * 中国电信：China Telecom
     * 133,1349,153,180,189,181
     */
    NSString * CT = @"^1((33|53|8[019])[0-9]|349)\\d{7}$";
    /**
     * 大陆地区固话及小灵通
     * 区号：010,020,021,022,023,024,025,027,028,029
     * 号码：七位或八位
     */
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    
    if (([regextestmobile evaluateWithObject:numstring] == YES)
        || ([regextestcm  evaluateWithObject:numstring] == YES)
        || ([regextestct  evaluateWithObject:numstring] == YES)
        || ([regextestcu  evaluateWithObject:numstring] == YES)
        || ([regextestphs evaluateWithObject:numstring] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

//返回订单状态
+ (NSString *)getOrderStatus:(NSString *)orderStatus{
    if ([orderStatus isEqualToString:@"-1"]) {
        return @"已关闭";
    }
    else if ([orderStatus isEqualToString:@"0"]){
        return @"待付款";
    }
    else if ([orderStatus isEqualToString:@"1"]){
        return @"待发货";
    }
    else if ([orderStatus isEqualToString:@"2"]){
        return @"待收货";
    }
    else if ([orderStatus isEqualToString:@"3"]){
        return @"交易成功";
    }
    else if ([orderStatus isEqualToString:@"10"]){
        return @"退款中";
    }
    else {
        return @"已退款";
    }
    
}
//返回退款状态
+ (NSString *)getOrderRefundStatus:(NSString *)orderRefundStatus{
    
   if ([orderRefundStatus isEqualToString:@"1"]){
        return @"等待确认";
    }
    else if ([orderRefundStatus isEqualToString:@"2"]){
        return @"退款中";
    }
    else if ([orderRefundStatus isEqualToString:@"3"]){
        return @"退货中";
    }
    else if ([orderRefundStatus isEqualToString:@"4"]){
        return @"退款完成";
    }
    else {
        return @"禁止退款";
    }
}
@end
