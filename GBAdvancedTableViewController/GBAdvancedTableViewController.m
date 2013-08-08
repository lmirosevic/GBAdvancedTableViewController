//
//  GBAdvancedTableViewController.m
//  GBAdvancedTableViewController
//
//  Created by Luka Mirosevic on 15/07/2013.
//  Copyright (c) 2013 Goonbee. All rights reserved.
//

#import "GBAdvancedTableViewController.h"

static BOOL kDefaultShouldShowRefreshControl =                  NO;
static BOOL kDefaultShouldAutomaticallyFinishRefreshing =       NO;

@interface GBAdvancedTableViewController ()

@property (strong, nonatomic) ODRefreshControl                  *refreshControl;

@end

@implementation GBAdvancedTableViewController

#pragma mark - CA

-(void)setShouldShowRefreshControl:(BOOL)shouldShowRefreshControl {
    _shouldShowRefreshControl = shouldShowRefreshControl;
    
    if (shouldShowRefreshControl) {
        self.refreshControl = [[ODRefreshControl alloc] initInScrollView:self.tableView];
        [self.refreshControl addTarget:self action:@selector(refreshAction:) forControlEvents:UIControlEventValueChanged];
    }
    else {
        self.refreshControl = nil;
    }
}

#pragma mark - overrides

-(id)initWithStyle:(UITableViewStyle)style {
    if (self = [super initWithStyle:style]) {
        self.shouldShowRefreshControl = kDefaultShouldShowRefreshControl;
        self.shouldAutomaticallyFinishRefreshing = kDefaultShouldAutomaticallyFinishRefreshing;
    }
    
    return self;
}

#pragma mark - actions

-(void)refreshAction:(id)sender {
    if (self.shouldAutomaticallyFinishRefreshing) {
        [self.refreshControl endRefreshing];

        //moves the table back up
        self.tableView.scrollEnabled = NO;
        self.tableView.scrollEnabled = YES;
    }
    
    [self refresh];
}

#pragma mark - API

-(void)refresh _abstract

-(void)didFinishRefreshing {
    [self.refreshControl endRefreshing];
}

-(void)addTargetForRefreshAction:(id)target withAction:(SEL)selector {
    [self.refreshControl addTarget:target action:selector forControlEvents:UIControlEventValueChanged];
}

-(void)removeTargetForRefreshControlAction:(id)target withAction:(SEL)selector {
    [self.refreshControl removeTarget:target action:selector forControlEvents:UIControlEventValueChanged];
}

@end
