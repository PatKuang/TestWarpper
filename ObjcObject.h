//
//  ObjcObject.h
//  TestMixC++
//
//  Created by Patrick (Pei) Kuang on 4/21/15.
//  Copyright (c) 2015 FutureGeeks. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ObjcObject : NSObject
- (void)exampleMethodWithString:(NSString*)str;
// other wrapped methods and properties
- (void)add:(NSUInteger)num;
@end
