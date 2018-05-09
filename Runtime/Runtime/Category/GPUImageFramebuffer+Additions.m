//
//  GPUImageFramebuffer+Additions.m
//  Runtime
//
//  Created by zhutao on 2018/5/9.
//  Copyright © 2018年 zhutao. All rights reserved.
//

#import "GPUImageFramebuffer+Additions.h"
#import <objc/runtime.h>

@implementation GPUImageFramebuffer (Additions)

- (CVPixelBufferRef)gpuBufferRef {
    Ivar var = class_getInstanceVariable([super class], "renderTarget");
    
    ptrdiff_t offset = ivar_getOffset(var);
    unsigned char* bytes = (unsigned char *)(__bridge void*)self;
    CVPixelBufferRef bufferValue = *((CVPixelBufferRef *)(bytes+offset));
    return bufferValue;
    
}

@end
