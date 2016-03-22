//
//  UINavigationBar+Extention.h
//  PullTopDemo
//
//  Created by 李金柱 on 15/12/28.
//  Copyright © 2015年 Mr.Li. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BackGestureOffsetXToBack 80

@interface UINavigationBar (Extention)<UIGestureRecognizerDelegate>

- (void)ljz_setBackgroudColor:(UIColor *)backgroundColor;

@property (assign,nonatomic) BOOL enableBackGesture;
@end
