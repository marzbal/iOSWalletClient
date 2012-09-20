//
//  WaleetGroupTableViewController.h
//  wallet
//
//  Created by Natalia Terlecka on 9/20/12.
//  Copyright (c) 2012 Natalia Terlecka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WalleetRepository.h"

@interface WaleetGroupTableViewController : UITableViewController

@property (nonatomic, strong) NSArray *groups;
@property (nonatomic) WalleetRepository *model;

@end
