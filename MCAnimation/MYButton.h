//
//  MYButton.h
//  layerDemo
//
//  Created by xulu on 15/8/19.
//  Copyright (c) 2015年 _MC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    StretchLeft,
    StretchRight,
    StretchUp,
    StretchDown,
} MCAnimationOptions;

@interface MYButton : UIButton

@property (nonatomic,assign) MCAnimationOptions animationOptions;

+(id)buttonWithType:(UIButtonType)buttonType initialFrame:(CGRect)initialFrame;
@end
