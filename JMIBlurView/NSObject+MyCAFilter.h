//
//  CAFilter+mine.h
//  blurView
//
//  Created by Ibanez, Jose on 7/1/13.
//  Copyright (c) 2013 Ibanez, Jose. All rights reserved.
//



@interface NSObject (MyCAFilter)

+ (id)_filterTypes;
+ (id)_filterWithName:(id)arg1;
+ (id)_filterWithType:(id)arg1;

- (BOOL)_cachesInputImage;
- (id)_copyWithZone:(NSZone *)arg1;
- (BOOL)_enabled;
- (void)_encodeWithCoder:(id)arg1;
- (id)_initWithCoder:(id)arg1;
- (id)_initWithName:(id)arg1;
- (id)_initWithType:(id)arg1;
- (BOOL)_isEnabled;
- (id)_mutableCopyWithZone:(NSZone *)arg1;
- (id)_name;
- (void)_setCachesInputImage:(BOOL)arg1;
- (void)_setDefaults;
- (void)_setEnabled:(BOOL)arg1;
- (void)_setName:(id)arg1;
- (void)_setValue:(id)arg1 forKey:(id)arg2;
- (id)_type;
- (id)_valueForKey:(id)arg1;

@end
