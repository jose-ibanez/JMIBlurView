//
//  Swizz.c
//  tappd
//
//  Created by Jose Ibanez on 5/26/13.
//  Copyright (c) 2013 Jose Ibanez. All rights reserved.
//

#include <stdio.h>
#include <objc/runtime.h>

void SwizzClassMethod(Class origClass, Class replaceClass, SEL origSel, SEL replaceSel)
{
    Method origMethod = class_getClassMethod(origClass, origSel);
    Method newMethod = class_getClassMethod(replaceClass, replaceSel);
    
    origClass = object_getClass((id)origClass);
    
    if(class_addMethod(origClass, origSel, method_getImplementation(newMethod), method_getTypeEncoding(newMethod)))
        class_replaceMethod(origClass, replaceSel, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    else
        method_exchangeImplementations(origMethod, newMethod);
}

void SwizzInstanceMethod(Class origClass, Class replaceClass, SEL origSel, SEL replaceSel)
{
    Method origMethod = class_getInstanceMethod(origClass, origSel);
    Method newMethod = class_getInstanceMethod(replaceClass, replaceSel);
    if(class_addMethod(origClass, origSel, method_getImplementation(newMethod), method_getTypeEncoding(newMethod)))
        class_replaceMethod(origClass, replaceSel, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    else
        method_exchangeImplementations(origMethod, newMethod);
}