//
//  AddPackageViewController.h
//  Delivered
//
//  Created by brett davis on 6/10/13.
//  Copyright (c) 2013 brett davis. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Package;

@interface AddPackageViewController : UITableViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UISegmentedControl *selector;
@property (weak, nonatomic) IBOutlet UITextField *packageDescription;
@property (weak, nonatomic) IBOutlet UITextField *trackingNumber;
@property (weak, nonatomic) NSString *shippingProvider;
@property (strong, nonatomic) Package *package;
@end
