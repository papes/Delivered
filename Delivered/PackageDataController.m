//
//  PackageDataController.m
//  Delivered
//
//  Created by brett davis on 6/10/13.
//  Copyright (c) 2013 brett davis. All rights reserved.
//

#import "PackageDataController.h"
#import "Package.h"
@interface PackageDataController ()
- (void)initializeDefaultDataList;
@end

static PackageDataController *datacontroller = nil;

@implementation PackageDataController
+(id)sharedInstance{
    if(datacontroller == nil){
        datacontroller = [[self alloc] init];
    }
    return datacontroller;
}
- (void)initializeDefaultDataList {
    NSMutableArray *packageList = [[NSMutableArray alloc] init];
    self.masterPackageList = packageList;
   // Package *package;
    //NSDate *today = [NSDate date];
    //package = [[Package alloc] initWithName:@"Pigeon" tracking:@"z" shipper:@"USPS" date: today];
    //[self addPackage:package];
}



- (void)setPackageList:(NSMutableArray *)newList {
    if (_masterPackageList != newList) {
        _masterPackageList = [newList mutableCopy];
    }
}

- (id)init {
    if (self = [super init]) {
        [self initializeDefaultDataList];
        return self;
    }
    return nil;
}
    
- (NSUInteger)countOfList {
        return [self.masterPackageList count];
}

- (Package *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.masterPackageList objectAtIndex:theIndex];
}

- (void)addPackage:(Package *)package {
   // NSLog(@"Made it here before crashing!");
    [self.masterPackageList addObject:package];
      //NSLog(@"but not here!");
}



@end
