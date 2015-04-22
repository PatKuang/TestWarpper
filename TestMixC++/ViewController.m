//
//  ViewController.m
//  TestMixC++
//
//  Created by Patrick (Pei) Kuang on 4/21/15.
//  Copyright (c) 2015 FutureGeeks. All rights reserved.
//

#import "ViewController.h"
#import "ObjcObject.h"

#import <mach/mach_time.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)calculateTimeOfBlock:(void (^)())block {
    uint64_t start = mach_absolute_time();
    
    block();
    
    
    uint64_t end = mach_absolute_time();
    uint64_t elapsed = end - start;mach_timebase_info_data_t info;
    if (mach_timebase_info (&info) != KERN_SUCCESS)
    {
        printf ("mach_timebase_info failed\n");
    }
    uint64_t nanosecs = elapsed * info.numer / info.denom;
    uint64_t millisecs = nanosecs / 1000000;
    NSLog(@">>>>>>>>>>cost time = %llu ns", nanosecs);
};

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self calculateTimeOfBlock:^{
        NSLog(@"print by Objective-C directly");
    }];
   
    
    [self calculateTimeOfBlock:^{
        ObjcObject *objc = [ObjcObject new];
        [objc exampleMethodWithString:@"print by Objective-C warpper\n"];
    }];
    
    
    [self calculateTimeOfBlock:^{
        ObjcObject *objc = [ObjcObject new];
        [objc add:100000000];
    }];

    
    [self calculateTimeOfBlock:^{
        int totlaNum = 0;
        for (int i =0; i < 100000000; i++) {
            totlaNum +=i;
        }
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
