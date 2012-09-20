//
//  WaleetGroupTableViewController.m
//  wallet
//
//  Created by Natalia Terlecka on 9/20/12.
//  Copyright (c) 2012 Natalia Terlecka. All rights reserved.
//

#import "WaleetGroupTableViewController.h"

@implementation WaleetGroupTableViewController

#pragma mark - <UITableViewDataSource>

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"GroupCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *groupName = [self.groups objectAtIndex:indexPath.row];
    
    cell.textLabel.text = groupName;
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.groups count];
}

@end
