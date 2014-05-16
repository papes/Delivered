//
//  PackageDataController.h
//  Delivered
//
//  Created by brett davis on 6/10/13.
//  Copyright (c) 2013 brett davis. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Package;

@interface PackageDataController : NSObject
@property (nonatomic, strong) NSMutableArray *masterPackageList;
@property int reference;
- (NSUInteger)countOfList;
- (Package *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)addPackage:(Package *)package;
+(id) sharedInstance;


@end
