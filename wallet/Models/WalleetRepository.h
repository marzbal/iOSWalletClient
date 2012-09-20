//
//  WalleetRepository.h
//  wallet
//
//  Created by Future Simple on 9/20/12.
//  Copyright (c) 2012 Natalia Terlecka. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFNetworking.h"

@protocol data <NSObject>

@end

typedef void(^GroupsSuccessBlock)(NSArray *groups);
@interface WalleetRepository : NSObject


- (void)createUserWithEmail:(NSString *)email andPassword:(NSString *)password;
- (void)getUserForEmail:(NSString *)email andPassword:(NSString *)password successBlock:(void(^)(void))successBlock;
- (void)getUserAccount;

- (void)getGroupsWithSuccessBlock:(GroupsSuccessBlock)successBlock;

@property (nonatomic, strong) NSObject<data> *delegate;

@end
