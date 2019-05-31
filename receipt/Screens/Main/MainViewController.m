//
//  ViewController.m
//  receipt
//
//  Created by Vicente Cantu Garcia on 5/21/19.
//  Copyright © 2019 Vicente Cantu Garcia. All rights reserved.
//

#import "MainViewController.h"
#import "MainTableViewCell.h"
#import "RestApi.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize receipts;

+ (BOOL)canHandleRequest:(NSString *)type forUrl:(NSString *)url {
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [RestApi getReceipt:^(NSArray *receipts) {
        NSMutableArray *mutReceipts = [[NSMutableArray alloc] initWithArray:receipts];
        self.receipts = mutReceipts;
        [self.tableView reloadData];
    } onError:^(NSError *error) {
        NSLog(@"Ups! %@", error);
    }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = @"ReceiptCell";
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    Receipt *receipt = receipts[indexPath.row];
    
    cell.provider.text = receipt.provider;
    cell.currencyCode.text = receipt.currency_code;
    cell.amount.text = [NSString stringWithFormat:@"$%@", receipt.amount];
    cell.comment.text = receipt.comment;
    cell.emissionDate.text = receipt.emission_date;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //        [RestApi deleteReceipt:receipt.id]; No funciona bien la api :(
        [receipts removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [receipts count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 1000.0f;
}

@end
