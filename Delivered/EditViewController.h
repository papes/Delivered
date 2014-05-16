//
//  EditViewController.h
//  Delivered
//
//  Created by brett davis on 7/12/13.
//  Copyright (c) 2013 brett davis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterViewController.h"
@class Package;

@protocol MyPopoverDelegate <NSObject>
-(void)didClickSaveButton:(Package*) thisPackage;
@end

@interface EditViewController : UITableViewController <UITextFieldDelegate>{
}
@property (weak) id<MyPopoverDelegate> delegate;
-(IBAction)saveButton;
@property (strong, nonatomic) Package *package;
@property (weak, nonatomic) IBOutlet UISegmentedControl *selector;
@property (weak, nonatomic) IBOutlet UITextField *packageDescription;
@property (weak, nonatomic) IBOutlet UITextField *trackingNumber;
@property (weak, nonatomic) NSString *shippingProvider;

@end
