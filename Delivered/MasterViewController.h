//
//  MasterViewController.h
//  Delivered
//
//  Created by brett davis on 6/10/13.
//  Copyright (c) 2013 brett davis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PackageSelectionDelegate.h"
@class DetailViewController;
@class PackageDataController;

@interface MasterViewController : UITableViewController
@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) PackageDataController *dataController;
@property (nonatomic, strong) NSMutableArray *packages;
@property (nonatomic, assign) id<PackageSelectionDelegate> delegate;

- (IBAction)done:(UIStoryboardSegue *)segue;
- (IBAction)cancel:(UIStoryboardSegue *)segue;
- (IBAction)refresh;
-(void) save:(Package *) newPackage;

@end
