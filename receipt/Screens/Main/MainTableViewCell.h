//
//  MainTableViewCell.h
//  receipt
//
//  Created by Vicente Cantu Garcia on 5/23/19.
//  Copyright © 2019 Vicente Cantu Garcia. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *provider;
@property (weak, nonatomic) IBOutlet UILabel *currencyCode;
@property (weak, nonatomic) IBOutlet UILabel *amount;
@property (weak, nonatomic) IBOutlet UILabel *emissionDate;
@property (weak, nonatomic) IBOutlet UILabel *comment;


@end

NS_ASSUME_NONNULL_END
