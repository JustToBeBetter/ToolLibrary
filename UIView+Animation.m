//
//  UIView+Animation.m
//  DesignerLikeMe
//
//  Created by 李金柱 on 15/11/12.
//  Copyright © 2015年 李金柱. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView (Animation)
//启动动画
- (void)shakeWithRaid:(CGFloat)raid duration:(NSTimeInterval)duration repeatCount:(NSUInteger)count{
    CABasicAnimation *shakeAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    shakeAnimation.duration = duration;
    
    //设置摇动幅度
    shakeAnimation.fromValue = [NSNumber numberWithFloat:-raid];
    
    shakeAnimation.toValue = [NSNumber numberWithFloat:raid];
    
    //设置自动倒带
    shakeAnimation.autoreverses = YES;
    
    //设置完成后自动移动动画
    shakeAnimation.removedOnCompletion = YES;
    if (count != 0) {
        shakeAnimation.repeatCount = count;
    }
    else
    {
        shakeAnimation.repeatCount = FLT_MAX;
    }
    
    [self.layer addAnimation:shakeAnimation forKey:@"Let me Shake"];
    

}

- (void)stopShake{
    //删除动画，动画停止
    [self.layer removeAnimationForKey:@"Let me Shake"];
}

@end
