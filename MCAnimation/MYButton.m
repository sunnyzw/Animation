//
//  MYButton.m
//  layerDemo
//
//  Created by xulu on 15/8/19.
//  Copyright (c) 2015年 _MC. All rights reserved.
//
#define CHANGE_VALUE 100
#import "MYButton.h"
@interface MYButton ()

@property (nonatomic) CGRect initialFrame;
@property (nonatomic) BOOL isInitial;
@property (nonatomic,strong) CALayer * initialLayer;
@property (nonatomic) CGRect finalFrame;
@property (nonatomic,strong) CALayer * backgroundLayer;

@end

@implementation MYButton

+ (id)buttonWithType:(UIButtonType)buttonType initialFrame:(CGRect)initialFrame {
    MYButton * button = [super buttonWithType:buttonType];
    button.initialFrame = initialFrame;
    button.frame = initialFrame;
    button.layer.cornerRadius = initialFrame.size.height/2;
    button.layer.masksToBounds = YES;
    button.backgroundLayer = [[CALayer alloc]init];
    button.backgroundLayer.cornerRadius = (initialFrame.size.height - 10)/2;
    button.backgroundLayer.backgroundColor = [UIColor orangeColor].CGColor;
    button.backgroundLayer.masksToBounds = YES;
    [button.layer addSublayer:button.backgroundLayer];
    
    button.initialLayer = [[CALayer alloc]init];
    button.initialLayer.frame = button.bounds;
    button.initialLayer.cornerRadius=initialFrame.size.height/2;
    button.initialLayer.masksToBounds = YES;
    button.initialLayer.borderWidth = 2;
    button.initialLayer.backgroundColor = [UIColor orangeColor].CGColor;
    button.initialLayer.borderColor = [UIColor whiteColor].CGColor;
    button.backgroundColor = [UIColor clearColor];
    [button.layer addSublayer:button.initialLayer];
    
    return button;
}

- (void)setAnimationOptions:(MCAnimationOptions)animationOptions {
    CGFloat x,y,width,height;
    
    switch (animationOptions) {
        case StretchUp:
            
        case StretchDown:
            
            width = self.initialFrame.size.width;
            height = self.initialFrame.size.height + CHANGE_VALUE;
            break;
            
        case StretchLeft:
            
        case StretchRight:
            
            width = self.initialFrame.size.width + CHANGE_VALUE;
            height = self.initialFrame.size.height;
            break;
            
        default:
            break;
    }
    
    
    switch (animationOptions) {
        case StretchUp:
            
            x = self.initialFrame.origin.x;
            y = self.initialFrame.origin.y - CHANGE_VALUE;
            break;
            
        case StretchDown:
            
        case StretchRight:
            
            
            x = self.initialFrame.origin.x;
            y = self.initialFrame.origin.y;
            break;
            
        case StretchLeft:
            
            x = self.initialFrame.origin.x - CHANGE_VALUE;
            y = self.initialFrame.origin.y;
            break;

        default:
            
            break;
    }
    
    self.finalFrame = CGRectMake(x, y, width, height);
    
    
    switch (animationOptions) {
        case StretchUp:

        case StretchDown:
            
            self.backgroundLayer.frame = CGRectMake(5, 0, self.initialFrame.size.width - 10, self.initialFrame.size.height + CHANGE_VALUE);
            break;
            
        case StretchLeft:
        
        case StretchRight:
            
            self.backgroundLayer.frame = CGRectMake(0, 5, self.initialFrame.size.width + CHANGE_VALUE, self.initialFrame.size.height - 10);
            break;
            
        default:
            break;
    }
}


- (void)setIsInitial:(BOOL)isInitial {
    if (!isInitial) {
        
        [UIView beginAnimations:@" " context:nil];
        [UIView setAnimationDuration:0.5];
        self.frame = self.initialFrame;
        self.initialLayer.frame = self.bounds;
        [UIView commitAnimations];
        
    } else {
        
        [UIView beginAnimations:@" " context:nil];
        [UIView setAnimationDuration:0.5];
        self.frame = self.finalFrame;
        [UIView commitAnimations];

    }
    _isInitial = isInitial;
}


- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    self.isInitial = !self.isInitial;
    [super sendAction:action to:target forEvent:event];
}
@end
