//
//  RestApi.m
//  receipt
//
//  Created by Vicente Cantu Garcia on 5/24/19.
//  Copyright © 2019 Vicente Cantu Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestApi.h"

#define BASE_URL @"https://devapi.axosnet.com/am/v2/api_receipts_beta/api/receipt/"

@implementation RestApi

+ (void) getReceipt:(void (^)(NSArray *))completionHandler onError:(void (^)(NSError *))errorHandler {

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    NSString *endPoint = @"getall";
    
    [manager GET:[NSString stringWithFormat:@"%@%@",BASE_URL, endPoint] parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        // responseObject (NSString) to data
        NSData* data = [responseObject dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error;
        
        id jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dict in jsonArray) {
             Receipt *receipt = [[Receipt alloc] initWithDictionary:dict];
            [items addObject:receipt];
        }
        
        completionHandler(items);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"operation: %@", operation.description);
        NSLog(@"Error: %@", error.description);
        errorHandler(error);
    }];
    
}

@end

