//
//  WalleetUserData.h
//  wallet
//
//  Created by Natalia Terlecka on 9/20/12.
//  Copyright (c) 2012 Natalia Terlecka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WalleetUserData : NSObject

@property (nonatomic, strong) NSString *userToken;
@property (nonatomic, strong) NSString *userEmail;
@property (nonatomic, strong) NSString *userPassword;

+ (WalleetUserData *)sharedInstance;

@end
