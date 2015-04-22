//
//  ObjcObject.m
//  TestMixC++
//
//  Created by Patrick (Pei) Kuang on 4/21/15.
//  Copyright (c) 2015 FutureGeeks. All rights reserved.
//

#import "ObjcObject.h"
#import "CppObject.h"

@interface ObjcObject () { // note the empty parentheses
CppObject wrapped;
}
- (void)methodWeDontWantInTheHeaderFile;
@end

@implementation ObjcObject

- (void)exampleMethodWithString:(NSString*)str
{
    // NOTE: if str is nil this will produce an empty C++ string
    // instead of dereferencing the NULL pointer from UTF8String.
    std::string cpp_str([str UTF8String], [str lengthOfBytesUsingEncoding:NSUTF8StringEncoding]);
    wrapped.ExampleMethod(cpp_str);
}

- (void)methodWeDontWantInTheHeaderFile {
    
}

- (void)add:(NSUInteger)num {
    wrapped.add(num);
}

@end
