//
//  Receipt.m
//  receipt
//
//  Created by Vicente Cantu Garcia on 5/31/19.
//  Copyright © 2019 Vicente Cantu Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Receipt.h"

@implementation Receipt

- (instancetype) initWithDictionary:(NSDictionary *)dict {
    
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
    
}

@end
