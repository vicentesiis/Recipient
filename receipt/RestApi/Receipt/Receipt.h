//
//  Receipt.h
//  receipt
//
//  Created by Vicente Cantu Garcia on 5/31/19.
//  Copyright © 2019 Vicente Cantu Garcia. All rights reserved.
//

#ifndef Receipt_h
#define Receipt_h


#endif /* Receipt_h */

@interface Receipt : NSObject

- (instancetype) initWithDictionary:(NSDictionary *) dict;

@property (copy, nonatomic) NSNumber *amount;
@property (copy, nonatomic) NSString *comment;
@property (copy, nonatomic) NSString *currency_code;
@property (copy, nonatomic) NSString *emission_date;
@property (copy, nonatomic, nullable) NSNumber *id;
@property (copy, nonatomic) NSString *provider;

@end
