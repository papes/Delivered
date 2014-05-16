//
//  PackageSelectionDelegate.h
//  Delivered
//
//  Created by brett davis on 7/21/13.
//  Copyright (c) 2013 brett davis. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Package;
@protocol PackageSelectionDelegate <NSObject>
@required
-(void)selectedPackage:(Package *)newPackage;
@end

