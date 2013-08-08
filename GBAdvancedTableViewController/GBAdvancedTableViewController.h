//
//  GBAdvancedTableViewController.h
//  GBAdvancedTableViewController
//
//  Created by Luka Mirosevic on 15/07/2013.
//  Copyright (c) 2013 Goonbee. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GBToolbox.h"
#import "ODRefreshControl.h"

@interface GBAdvancedTableViewController : GBTableViewController

@property (assign, nonatomic) BOOL                                          shouldShowRefreshControl;               //defaults to NO
@property (assign, nonatomic) BOOL                                          shouldAutomaticallyFinishRefreshing;    //defaults to NO

-(void)refresh;
-(void)didFinishRefreshing;

//you can add additional targets if you like
-(void)addTargetForRefreshAction:(id)target withAction:(SEL)selector;
-(void)removeTargetForRefreshControlAction:(id)target withAction:(SEL)selector;

@end
