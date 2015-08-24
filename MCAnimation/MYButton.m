//
//  MYButton.m
//  layerDemo
//
//  Created by xulu on 15/8/19.
//  Copyright (c) 2015年 _MC. All rights reserved.
//
#define CHANGE_WIGHT 120
#import "MYButton.h"
@interface MYButton ()
@property (nonatomic) CGRect initialFrame;
@property (nonatomic) BOOL isInitial;
@property (nonatomic,strong)UILabel * contentLabel;
@property (nonatomic,strong) CALayer * initialLayer;
@end
@implementation MYButton

+(id)buttonWithType:(UIButtonType)buttonType initialFrame:(CGRect)initialFrame content:(NSString *)content {
    MYButton * button = [super buttonWithType:buttonType];
    button.initialFrame = initialFrame;
    button.frame = initialFrame;
    button.layer.cornerRadius = initialFrame.size.height/2;
    button.layer.masksToBounds = YES;
    CALayer * layer = [[CALayer alloc]init];
    layer.frame = CGRectMake(0, 5, initialFrame.size.width + CHANGE_WIGHT, initialFrame.size.height - 10);
    layer.cornerRadius = (initialFrame.size.height - 10)/2;
    layer.backgroundColor = [UIColor orangeColor].CGColor;
    layer.masksToBounds = YES;
    [button.layer addSublayer:layer];
    button.initialLayer = [[CALayer alloc]init];
    button.initialLayer.frame = button.bounds;
    button.initialLayer.cornerRadius=initialFrame.size.height/2;
    button.initialLayer.masksToBounds = YES;
    button.initialLayer.borderWidth = 2;
    button.initialLayer.backgroundColor = [UIColor orangeColor].CGColor;
    button.initialLayer.borderColor = [UIColor whiteColor].CGColor;
    button.backgroundColor = [UIColor clearColor];
    [button.layer addSublayer:button.initialLayer];
    button.contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(initialFrame.size.width,5,CHANGE_WIGHT, initialFrame.size.height - 10)];
    button.contentLabel.textColor = [UIColor whiteColor];
    button.contentLabel.textAlignment = NSTextAlignmentCenter;
    button.contentLabel.font = [UIFont systemFontOfSize:9];
    button.contentLabel.text = content;
    button.contentLabel.backgroundColor = [UIColor clearColor];
    [button addSubview:button.contentLabel];
    return button;
}

-(void)setIsInitial:(BOOL)isInitial {
    if (!isInitial) {
        [UIView beginAnimations:@" " context:nil];
        [UIView setAnimationDuration:0.5];
        self.frame = self.initialFrame;
        [UIView commitAnimations];
    } else {
        [UIView beginAnimations:@" " context:nil];
        [UIView setAnimationDuration:0.5];
        self.frame = CGRectMake(self.initialFrame.origin.x - CHANGE_WIGHT, self.initialFrame.origin.y, self.initialFrame.size.width + CHANGE_WIGHT, self.initialFrame.size.height);
        [UIView commitAnimations];

    }
    _isInitial = isInitial;
}


- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    self.isInitial = !self.isInitial;
    [super sendAction:action to:target forEvent:event];
}
@end
