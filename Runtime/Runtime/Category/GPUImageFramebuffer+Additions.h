//
//  GPUImageFramebuffer+Additions.h
//  Runtime
//
//  Created by zhutao on 2018/5/9.
//  Copyright © 2018年 zhutao. All rights reserved.
//

#import <GPUImage/GPUImage.h>

@interface GPUImageFramebuffer (Additions)
- (CVPixelBufferRef)gpuBufferRef;

@end
