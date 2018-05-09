//
//  ViewController.m
//  Runtime
//
//  Created by zhutao on 2018/5/9.
//  Copyright © 2018年 zhutao. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Runtime.h"
#import "Person.h"
#import "Person+son.h"
#import <objc/objc.h>
#import <objc/runtime.h>
@interface ViewController ()
@property (nonatomic,retain) Person *person;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     _person = [[Person alloc]init];
 
     [self test6];
}
#pragma mark 交换两个方法
- (void)test6
{
    Method method1 = class_getInstanceMethod([Person class], @selector(testOne));
    Method method2 = class_getInstanceMethod([Person class], @selector(testTwo));
    
    //交换方法
    method_exchangeImplementations(method1, method2);
    [_person testOne];
}
#pragma mark 添加方法
- (void)test5
{
    class_addMethod([_person class], @selector(sayHi), (IMP)myAddingFunction, 0);
    
    //调用方法
    [_person performSelector:@selector(sayHi)];
}
- (void)sayHi
{
    NSLog(@"hi");
}
int myAddingFunction(id self, SEL _cmd){
    NSLog(@"已新增方法:NewMethod");
    //具体的实现（方法的内部都默认包含两个参数Class类和SEL方法，被称为隐式参数。）
    
    return 1;
}

#pragma mark 添加新属性
- (void)test4
{
    _person.height = 12;
    NSLog(@"%f",_person.height);
}
#pragma mark 改变私有变量的值
- (void)test3
{
    NSLog(@"更改前:%@",_person);
    unsigned int count = 0;
    Ivar *allList = class_copyIvarList([Person class], &count);
    Ivar ivv = allList[count-1];//从得到所有方法输出的信息，可以看到name 为最后一个实例属性
    object_setIvar(_person, ivv, @"huohu");//强制修改name属性
    NSLog(@"改变后%@",_person);
}
#pragma mark 获取所有变量
- (void)test2
{
    unsigned int count = 0;
    //获取类的一个包含所有变量的列表，IVar是runtime声明的一个宏，是实例变量的意思
    
    Ivar *allVariables = class_copyIvarList([Person class], &count);
    for (int i = 0; i < count; i++) {
        //便利每一个变量
        Ivar ivar = allVariables[i];
        const char *variableName = ivar_getName(ivar);
        const char *variableType = ivar_getTypeEncoding(ivar);
        NSLog(@"name:%s --type:%s",variableName,variableType);
    }
}
#pragma mark 获得所有方法
- (void)test1
{
    unsigned int count;
   
    Method *allMethods = class_copyMethodList([Person class], &count);
    for (int i = 0; i<count; i++) {
      
        Method md = allMethods[i];
       
        SEL sel = method_getName(md);
        
        const char *methodName = sel_getName(sel);
        NSLog(@"method: %s",methodName);
    }
}
- (void)test
{
   
    _person.name =@"火狐";
    [_person pi_performSelectorWithArgs:@selector(setName:),@"huohu"];
    [_person pi_performSelectorWithArgs:@selector(setAge:),50];
    
    _person.age =30;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
