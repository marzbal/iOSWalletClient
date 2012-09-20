//
//  WalleetUserData.m
//  wallet
//
//  Created by Natalia Terlecka on 9/20/12.
//  Copyright (c) 2012 Natalia Terlecka. All rights reserved.
//

#import "WalleetUserData.h"

@implementation WalleetUserData

@synthesize userEmail = _userEmail;
@synthesize userPassword = _userPassword;
@synthesize userToken = _userToken;

static WalleetUserData *sharedInstance = nil;

+ (WalleetUserData *)sharedInstance 
{
    if(sharedInstance == nil) 
    {
        sharedInstance = [[self alloc] init];
    }
    
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    
    if (self) 
    {
    }
    
    return self;
}

@end
