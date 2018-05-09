//
//  Person.m
//  Runtime
//
//  Created by zhutao on 2018/5/9.
//  Copyright © 2018年 zhutao. All rights reserved.
//

#import "Person.h"

@interface Person ()
@property (nonatomic,retain) NSString *nameTest; //实例变量
@property (nonatomic,assign)int ageTest;  //属性变量
@end
@implementation Person
//初始化person属性
-(instancetype)init{
    self = [super init];
    if(self) {
        _nameTest = @"火狐";
        self.ageTest = 50;
    }
    return self;
}
- (void)setName:(NSString *)name
{
    _name =name;
    NSLog(@"person name ==%@",name);
}
- (void)setAge:(NSInteger)age
{
    _age =age;
  
    NSLog(@"person age ==%d",(int)age);
}
//person的2个普通方法
-(void)testOne{
    NSLog(@"执行test1方法。");
}

-(void)testTwo{
    NSLog(@"执行test2方法。");
}
//输出person对象时的方法：
-(NSString *)description{
    return [NSString stringWithFormat:@"name:%@ age:%d",_nameTest,self.ageTest];
}
/*
 *1、系统推荐方法   [NSString stringWithFormat:@“%ld", (long)integerNum];
 *2、强制转换int    [NSString stringWithFormat:@"%d", (int)integerNum];
 *3、转为数字对象  [NSString stringWithFormat:@“%@", @(integerNum)];
 *4、使用%zd占位符  [NSString stringWithFormat:@“%zd", integerNum];  （最简单的方法）
 *
 *关于%zd格式化字符，只能运行在支持C99标准的编译器中，表示对应的数字是一个size_t类型，size_t是unsigned int 的增强版，表示与机器类型相关的unsigned类型，即：size-t在32位系统下是unsigned int(4个字节)，在64位系统中为long unsigned int(8个字节)。
 *
 *
 */

@end
