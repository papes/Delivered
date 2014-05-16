//
//  Package.h
//  Delivered
//
//  Created by brett davis on 6/10/13.
//  Copyright (c) 2013 brett davis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Package : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *trackingNumber;
@property (nonatomic,copy) NSString *shippingProvider;
-(id)initWithName:(NSString *)name tracking:(NSString *)trackingNumber shipper:(NSString*) shippingProvider;
@end
