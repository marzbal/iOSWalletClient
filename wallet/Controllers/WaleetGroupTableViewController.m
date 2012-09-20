//
//  WaleetGroupTableViewController.m
//  wallet
//
//  Created by Natalia Terlecka on 9/20/12.
//  Copyright (c) 2012 Natalia Terlecka. All rights reserved.
//

#import "WaleetGroupTableViewController.h"
#import "WalleetGroup.h"

@implementation WaleetGroupTableViewController

- (void)setGroups:(NSArray *)groups
{
    if (_groups != groups) {
        _groups = groups;
        [self.tableView reloadData];
    }
}

- (void)setModel:(WalleetRepository *)model
{
    if (_model != model) {
        _model = model;
        
        [self.model getGroupsWithSuccessBlock:^(NSArray *groups) {
            self.groups = groups;
            NSLog(@"groups %@", groups);
        }];
    }
}

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    

}

#pragma mark - <UITableViewDataSource>

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"GroupCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *groupName = ((WalleetGroup *)[self.groups objectAtIndex:indexPath.row]).name;
    
    cell.textLabel.text = groupName;
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.groups count];
}

@end
