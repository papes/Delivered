//
//  Package.m
//  Delivered
//
//  Created by brett davis on 6/10/13.
//  Copyright (c) 2013 brett davis. All rights reserved.
//

#import "Package.h"

@implementation Package

-(id) initWithName:(NSString *)name tracking:(NSString *)trackingNumber shipper:(NSString *)shippingProvider   {
    self = [super init];
    if (self) {
        _name = name;
        _trackingNumber = trackingNumber;
        _shippingProvider = shippingProvider;
        return self;
    }
    return nil;
}
@end
