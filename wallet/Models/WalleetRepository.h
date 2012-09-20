//
//  WalleetRepository.h
//  wallet
//
//  Created by Future Simple on 9/20/12.
//  Copyright (c) 2012 Natalia Terlecka. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFNetworking.h"

@interface WalleetRepository : NSObject

- (void)createUserWithEmail:(NSString *)email andPassword:(NSString *)password;
- (void)getUserForEmail:(NSString *)email andPassword:(NSString *)password;
- (void)getUserAccount;

@end
