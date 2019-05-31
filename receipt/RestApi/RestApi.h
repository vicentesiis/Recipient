//
//  RestApi.h
//  receipt
//
//  Created by Vicente Cantu Garcia on 5/24/19.
//  Copyright © 2019 Vicente Cantu Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "Receipt/Receipt.h"

@interface RestApi : NSObject 

+ (void) getReceipt:(void (^)(NSArray *receipts))completionHandler onError:(void (^)(NSError *error))errorHandler;

@end
