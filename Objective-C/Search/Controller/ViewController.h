//
//  ViewController.h
//  SearchBothiOS7AndiOS8
//
//  Created by John Silva on 5/24/15.
//  Copyright (c) 2015 John Silva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating>

@property (nonatomic, strong) IBOutlet UITableView *table;
@property (nonatomic, strong) IBOutlet UIView *viewSearch;

@property (nonatomic, strong) NSMutableArray *resultsTable;
@property (nonatomic, strong) NSArray *resultsSearch;

// ios 8
@property (nonatomic, strong) UISearchController *searchControlleriOS8;

// ios 7
@property (nonatomic, strong) UISearchBar *searchBariOS7;
@property (nonatomic, strong) UISearchDisplayController *searchDisplayControlleriOS7;
@property (nonatomic, assign) int searchid;

@end

