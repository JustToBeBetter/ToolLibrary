//
//  UIView+Animation.h
//  DesignerLikeMe
//
//  Created by 李金柱 on 15/11/12.
//  Copyright © 2015年 李金柱. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Animation)

//启动动画
-(void)shakeWithRaid:(CGFloat)raid duration:(NSTimeInterval)duration repeatCount:(NSUInteger)count;

-(void)stopShake;

@end
