//
//  JMIBlurView.h
//  blurView
//
//  Created by Ibanez, Jose on 6/25/13.
//  Copyright (c) 2013 Ibanez, Jose. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMIBlurStyle.h"

@class JMIBlurLayer;

@interface JMIBlurView : UIView

@property (nonatomic, readonly) JMIBlurLayer *blurLayer;

- (id)initWithFrame:(CGRect)frame blurStyle:(JMIBlurStyle)style;

@end
