//
//  ViewController.m
//  SearchBothiOS7AndiOS8
//
//  Created by John Lima on 5/24/15.
//  Copyright (c) 2015 limadeveloper. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating>

@end

@implementation ViewController

#pragma mark - Properties
BOOL searchEnable = NO;
UISearchController *searchController;
NSArray *tableData;
NSMutableArray *searchData;
NSIndexPath *selectedIndexPath;
UIRefreshControl *refreshControll;

#pragma mark - View LifeCycle
-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self createSearch];
    [self setupRefresh];
    
    [self getData];
    [self updateUI];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (searchEnable) {
        [self searchBarCancelButtonClicked:searchController.searchBar];
        [self clearSearch];
    }
}

#pragma mark - Actions
-(void)updateUI {
    
    UIView *footer = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.tableView.tableFooterView = footer;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.allowsSelection = tableData.count > 0;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView reloadData];
}

-(void)getData {
    
    Model *model = [[Model alloc] init];
    
    tableData = [[NSArray alloc] init];
    tableData = [model getData];
    
    [refreshControll endRefreshing];
    [self.tableView reloadData];
}

-(void)createSearch {
    
    searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    
    [searchController loadViewIfNeeded];
    
    searchController.searchResultsUpdater = self;
    
    [searchController.searchBar sizeToFit];
    [searchController.searchBar setBarTintColor:[UIColor purpleColor]];
    [searchController.searchBar setTintColor:[UIColor whiteColor]];
    
    [self.viewSearch addSubview:searchController.searchBar];
    
    searchController.delegate = self;
    searchController.dimsBackgroundDuringPresentation = false;
    searchController.hidesNavigationBarDuringPresentation = false;
    searchController.searchBar.delegate = self;
}

-(void)setupRefresh {
    
    refreshControll = [[UIRefreshControl alloc] init];
    refreshControll.tintColor = [UIColor purpleColor];
    
    [refreshControll addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventValueChanged];
    
    [self.tableView addSubview:refreshControll];
}

-(void)clearSearch {
    
    searchData = [[NSMutableArray alloc] init];
    searchEnable = NO;
    
    [self.tableView reloadData];
}

-(void)refreshData {
    [self getData];
    [self updateUI];
    [self clearSearch];
}

#pragma mark - Search Delegates

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    NSString *searchText = searchController.searchBar.text;
    
    if (searchText == nil) {
        searchData = [[NSMutableArray alloc] init];
    }else {
    
        searchData = [[NSMutableArray alloc] init];
        
        for (Model *model in tableData) {
            if ([model.name containsString:searchText]) {
                [searchData addObject:model];
            }
        }
    }
    
    searchEnable = searchController.searchBar.showsCancelButton;
    
    [self.tableView reloadData];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    searchBar.text = nil;
    searchBar.showsCancelButton = NO;
    
    [searchBar resignFirstResponder];
    
    self.tableView.allowsSelection = YES;
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self searchBarCancelButtonClicked:searchBar];
}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [self clearSearch];
    self.tableView.allowsSelection = NO;
    searchBar.showsCancelButton = YES;
}

#pragma mark - TableView DataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *data = searchEnable ? searchData : tableData;
    return data.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSArray *data = searchEnable ? searchData : tableData;
    
    if (data.count > 0) {
        cell.textLabel.text = [(Model *)data[indexPath.row] name];
        cell.textLabel.textColor = [UIColor purpleColor];
    }
    
    return cell;
}

#pragma mark - TableView Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [searchController setActive:NO];
    
    selectedIndexPath = indexPath;
}

@end
