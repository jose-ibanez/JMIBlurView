//
//  Swizz.h
//  tappd
//
//  Created by Jose Ibanez on 5/26/13.
//  Copyright (c) 2013 Jose Ibanez. All rights reserved.
//

#ifndef tappd_Swizz_h
#define tappd_Swizz_h

void SwizzClassMethod(Class origClass, Class replaceClass, SEL origSel, SEL replaceSel);
void SwizzInstanceMethod(Class origClass, Class replaceClass, SEL origSel, SEL replaceSel);

#endif
