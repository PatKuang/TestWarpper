//
//  CppObject.cpp
//  TestMixC++
//
//  Created by Patrick (Pei) Kuang on 4/21/15.
//  Copyright (c) 2015 FutureGeeks. All rights reserved.
//

#include "CppObject.h"
#include <iostream>

using namespace std;

void CppObject::ExampleMethod(const std::string& str) {
    cout<<str;
}

void CppObject::add(int n) {
    int totlaNum = 0;
    for (int i =0; i < n; i++) {
        totlaNum +=i;
    }
}
