//
//  JMIBlurLayer.m
//  blurView
//
//  Created by Jose Ibanez on 7/6/13.
//  Copyright (c) 2013 Ibanez, Jose. All rights reserved.
//

#import "JMIBlurLayer.h"

// the names for the values in this struct are taken from webkit's contrast
// colormatrix function
// https://github.com/WebKit/webkit/blob/626d29f4dd3fba37300bb9b923358f169edd770f/Source/WebCore/platform/graphics/ca/mac/PlatformCAFiltersMac.mm#L568
typedef struct {
    float amount0, _01, _02, _03, intercept0;
    float _10, amount1, _12, _13, intercept1;
    float _20, _21, amount2, _23, intercept2;
    float _30, _31, _32, _33, _34;
} ColorMatrix;

@interface JMIBlurLayer ()

@property (nonatomic, strong) id gaussianBlurFilter;
@property (nonatomic, strong) id colorSaturateFilter;
@property (nonatomic, strong) id colorMatrixFilter;

@end

@implementation JMIBlurLayer

- (id)initWithBlurStyle:(JMIBlurStyle)style {
    self = [super init];
    if (self) {
        self.masksToBounds = YES;
        
        // set filter defaults based on style
        [self setBlurStyle:style];
        
        // create the filters
        Class classCAFilter = NSClassFromString(@"CAFilter");
        if (classCAFilter) {
            // CAFilter exists
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            // no way around this warning unless we disable it
            
            SEL selectorFilterWithType = NSSelectorFromString(@"filterWithType:");
            // gaussian blur
            self.gaussianBlurFilter = [classCAFilter performSelector:selectorFilterWithType withObject:@"gaussianBlur"];
            [self.gaussianBlurFilter setValue:@(self.blurRadius) forKey:@"inputRadius"];
            [self.gaussianBlurFilter setValue:@"default" forKey:@"inputQuality"];
            // saturate
            self.colorSaturateFilter = [classCAFilter performSelector:selectorFilterWithType withObject:@"colorSaturate"];
            [self.colorSaturateFilter setValue:@(self.saturation) forKey:@"inputAmount"];
            // contrast...? this is the one I don't understand yet
            // it appears to be a contrast filter combined with a brightness filter
            // but if they went though the trouble of combining those two filters,
            // why not also combine the saturation filter in here?
            self.colorMatrixFilter = [classCAFilter performSelector:selectorFilterWithType withObject:@"colorMatrix"];
            ColorMatrix matrix = [self currentColorMatrix];
            NSValue *matrixValue = [NSValue value:&matrix withObjCType:@encode(ColorMatrix)];
            [self.colorMatrixFilter setValue:matrixValue forKey:@"inputColorMatrix"];
#pragma clang diagnostic pop
            
            self.backgroundFilters = @[self.gaussianBlurFilter, self.colorSaturateFilter, self.colorMatrixFilter];
        }
    }
    return self;
}

- (id)init {
    return [self initWithBlurStyle:blurStyleCustom];
}


#pragma mark - Public Methods

- (void)setBlurStyle:(JMIBlurStyle)style {
    switch (style) {
        case blurStylePlayerControls:
            self.blurRadius = 30.0;
            self.saturation = 1.8;
            self.contrast = 0.7;
            self.brightness = 2.0;
            break;
        case blurStyleBar:
            self.blurRadius = 20.0;
            self.saturation = 1.8;
            self.contrast = 0.08;
            self.brightness = 1.94;
            break;
        default:
            self.blurRadius = 0.0;
            self.saturation = 1.0;
            self.contrast = 1.0;
            self.brightness = 1.0;
            break;
    }
}


#pragma mark - Properties

- (void)setBlurRadius:(CGFloat)blurRadius {
    if (fabs(_blurRadius - blurRadius) < FLT_EPSILON) {
        return;
    }
    _blurRadius = blurRadius;
    [self.gaussianBlurFilter setValue:@(self.blurRadius) forKey:@"inputRadius"];
}

- (void)setSaturation:(CGFloat)saturation {
    if (fabs(_saturation - saturation) < FLT_EPSILON) {
        return;
    }
    _saturation = saturation;
    [self.colorSaturateFilter setValue:@(self.saturation) forKey:@"inputAmount"];
}

- (void)setContrast:(CGFloat)contrast {
    if (fabs(_contrast - contrast) < FLT_EPSILON) {
        return;
    }
    _contrast = contrast;
    ColorMatrix matrix = [self currentColorMatrix];
    NSValue *matrixValue = [NSValue value:&matrix withObjCType:@encode(ColorMatrix)];
    [self.colorMatrixFilter setValue:matrixValue forKey:@"inputColorMatrix"];
}

- (void)setBrightness:(CGFloat)brightness {
    if (fabs(_brightness - brightness) < FLT_EPSILON) {
        return;
    }
    _brightness = brightness;
    ColorMatrix matrix = [self currentColorMatrix];
    NSValue *matrixValue = [NSValue value:&matrix withObjCType:@encode(ColorMatrix)];
    [self.colorMatrixFilter setValue:matrixValue forKey:@"inputColorMatrix"];
}


#pragma mark - Private interface

- (ColorMatrix)currentColorMatrix {
    CGFloat c = self.contrast;
    CGFloat t = -0.5 * c + 0.5;
    t *= self.brightness;
    ColorMatrix matrix = {
        c, 0, 0, 0, t,
        0, c, 0, 0, t,
        0, 0, c, 0, t,
        0, 0, 0, 1, 0};
    return matrix;
}


@end
