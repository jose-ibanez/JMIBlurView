//
//  JMIBlurView.m
//  blurView
//
//  Created by Ibanez, Jose on 6/25/13.
//  Copyright (c) 2013 Ibanez, Jose. All rights reserved.
//

#import "JMIBlurView.h"
#import "JMIBlurLayer.h"

@interface JMIBlurView()

@end

@implementation JMIBlurView

- (id)initWithFrame:(CGRect)frame blurStyle:(JMIBlurStyle)style {
    self = [super initWithFrame:frame];
    if (self) {
        if (style != blurStyleCustom) {
            [(JMIBlurLayer *)self.layer setBlurStyle:style];
        }
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame blurStyle:blurStyleCustom];
}

+ (Class)layerClass {
    return [JMIBlurLayer class];
}


#pragma mark - public properties

- (JMIBlurLayer *)blurLayer {
    return (JMIBlurLayer *)self.layer;
}

@end
