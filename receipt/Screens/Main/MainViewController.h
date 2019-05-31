//
//  ViewController.h
//  receipt
//
//  Created by Vicente Cantu Garcia on 5/21/19.
//  Copyright © 2019 Vicente Cantu Garcia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property NSMutableArray *receipts;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

