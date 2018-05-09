//
//  NSObject+Runtime.h
//  Runtime
//
//  Created by zhutao on 2018/5/9.
//  Copyright © 2018年 zhutao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Runtime)
- (id)pi_performSelectorWithArgs:(SEL)sel, ...;

@end
