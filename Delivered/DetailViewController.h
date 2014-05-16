//
//  DetailViewController.h
//  Delivered
//
//  Created by brett davis on 6/10/13.
//  Copyright (c) 2013 brett davis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PackageSelectionDelegate.h"
#import "MasterViewController.h"
#import "EditViewController.h"
@class Package;

@interface DetailViewController : UITableViewController <PackageSelectionDelegate, UISplitViewControllerDelegate,UIPopoverControllerDelegate, MyPopoverDelegate>{
}

@property (strong, nonatomic) UIStoryboardPopoverSegue *currentPopoverSegue;
@property (strong, nonatomic) MasterViewController * masterViewController;
@property (strong,nonatomic) PackageDataController *dataController;
@property (strong, nonatomic) EditViewController *editView;
@property (strong, nonatomic) Package *package;
@property (strong, nonatomic) NSMutableArray *container;
@property (weak, nonatomic) IBOutlet UILabel *packageNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *trackingNumberLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *shippingProvider;
@property (weak, nonatomic) IBOutlet UIWebView *shippingUpdates;
@property (nonatomic, weak) IBOutlet UINavigationItem *navBarItem;
@property (nonatomic, strong) UIPopoverController *popover;
@end
