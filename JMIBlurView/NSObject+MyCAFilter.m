//
//  CAFilter+mine.m
//  blurView
//
//  Created by Ibanez, Jose on 7/1/13.
//  Copyright (c) 2013 Ibanez, Jose. All rights reserved.
//

#import "NSObject+MyCAFilter.h"
typedef struct {
    float amount0, _01, _02, _03, intercept0;
    float _10, amount1, _12, _13, intercept1;
    float _20, _21, amount2, _23, intercept2;
    float _30, _31, _32, _33, _34;
} ColorMatrix;

@implementation NSObject (MyCAFilter)

+ (id)_filterTypes {
    NSLog(@"[%@ %@]", self, NSStringFromSelector(_cmd));
    id retval = [self _filterTypes];
    NSLog(@" return %@ *%@", [retval class], retval);
    return retval;
}
+ (id)_filterWithName:(id)arg1 {
    NSLog(@"[%@ %@] %@ *%@", self, NSStringFromSelector(_cmd), [arg1 class], arg1);
    id retval = [self _filterWithName:arg1];
    NSLog(@" return %@ *%@", [retval class], retval);
    return retval;
}
+ (id)_filterWithType:(id)arg1 {
    NSLog(@"[%@ %@] %@ *%@", self, NSStringFromSelector(_cmd), [arg1 class], arg1);
    id retval = [self _filterWithType:arg1];
    NSLog(@" return %@ *%@", [retval class], retval);
    return retval;
}


- (BOOL)_cachesInputImage {
    NSLog(@"[%@ %@]", self, NSStringFromSelector(_cmd));
    BOOL retval = [self _cachesInputImage];
    NSLog(@" return BOOL %@", retval ? @"YES" : @"NO");
    return retval;
}
- (id)_copyWithZone:(NSZone *)arg1 {
    NSLog(@"[%@ %@]", self, NSStringFromSelector(_cmd));
    id retval = [self _copyWithZone:arg1];
    NSLog(@" return %@ *%@", [retval class], retval);
    return retval;
}
- (BOOL)_enabled {
    NSLog(@"[%@ %@]", self, NSStringFromSelector(_cmd));
    BOOL retval = [self _enabled];
    NSLog(@" return BOOL %@", retval ? @"YES" : @"NO");
    return retval;
}
- (void)_encodeWithCoder:(id)arg1 {
    NSLog(@"[%@ %@] %@ *%@", self, NSStringFromSelector(_cmd), [arg1 class], arg1);
    [self _encodeWithCoder:arg1];
}
- (id)_initWithCoder:(id)arg1 {
    NSLog(@"[%@ %@] %@ *%@", self, NSStringFromSelector(_cmd), [arg1 class], arg1);
    id retval = [self _initWithCoder:arg1];
    NSLog(@" return %@ *%@", [retval class], retval);
    return retval;
}
- (id)_initWithName:(id)arg1 {
    NSLog(@"[%@ %@] %@ *%@", self, NSStringFromSelector(_cmd), [arg1 class], arg1);
    id retval = [self _initWithName:arg1];
    NSLog(@" return %@ *%@", [retval class], retval);
    return retval;
}
- (id)_initWithType:(id)arg1 {
    NSLog(@"[%@ %@] %@ *%@", self, NSStringFromSelector(_cmd), [arg1 class], arg1);
    id retval = [self _initWithType:arg1];
    NSLog(@" return %@ *%@", [retval class], retval);
    return retval;
}
- (BOOL)_isEnabled {
    NSLog(@"[%@ %@]", self, NSStringFromSelector(_cmd));
    BOOL retval = [self _isEnabled];
    NSLog(@" return BOOL %@", retval ? @"YES" : @"NO");
    return retval;
}
- (id)_mutableCopyWithZone:(NSZone *)arg1 {
    NSLog(@"[%@ %@]", self, NSStringFromSelector(_cmd));
    id retval = [self _mutableCopyWithZone:arg1];
    NSLog(@" return %@ *%@", [retval class], retval);
    return retval;
}
- (id)_name {
    NSLog(@"[%@ %@]", self, NSStringFromSelector(_cmd));
    id retval = [self _name];
    NSLog(@" return %@ *%@", [retval class], retval);
    return retval;
}
- (void)_setCachesInputImage:(BOOL)arg1 {
    NSLog(@"[%@ %@] BOOL %@", self, NSStringFromSelector(_cmd), arg1 ? @"YES" : @"NO");
    [self _setCachesInputImage:arg1];
}
- (void)_setDefaults {
    NSLog(@"[%@ %@]", self, NSStringFromSelector(_cmd));
    [self _setDefaults];
}
- (void)_setEnabled:(BOOL)arg1 {
    NSLog(@"[%@ %@] BOOL %@", self, NSStringFromSelector(_cmd), arg1 ? @"YES" : @"NO");
    [self _setEnabled:arg1];
}
- (void)_setName:(id)arg1 {
    NSLog(@"[%@ %@] %@ *%@", self, NSStringFromSelector(_cmd), [arg1 class], arg1);
    [self _setName:arg1];
}
- (void)_setValue:(id)arg1 forKey:(id)arg2 {
    NSLog(@"[%@ %@] %@ *%@, %@ *%@", self, NSStringFromSelector(_cmd), [arg1 class], arg1, [arg2 class], arg2);
    [self _setValue:arg1 forKey:arg2];
}
- (id)_type {
    NSLog(@"[%@ %@]", self, NSStringFromSelector(_cmd));
    id retval = [self _type];
    NSLog(@" return %@ *%@", [retval class], retval);
    return retval;
}
- (id)_valueForKey:(id)arg1 {
    NSLog(@"[%@ %@] %@ *%@", self, NSStringFromSelector(_cmd), [arg1 class], arg1);
    id retval = [self _valueForKey:arg1];
    NSLog(@" return %@ *%@", [retval class], retval);
    return retval;

}

@end
