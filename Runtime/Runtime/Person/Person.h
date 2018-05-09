//
//  Person.h
//  Runtime
//
//  Created by zhutao on 2018/5/9.
//  Copyright © 2018年 zhutao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
/** name */
@property (copy, nonatomic) NSString *name;
/*age*/
@property (assign,nonatomic)NSInteger age;

-(void)testOne;
-(void)testTwo;
@end
