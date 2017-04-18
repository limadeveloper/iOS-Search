//
//  ViewController.m
//  SearchBothiOS7AndiOS8
//
//  Created by John Lima on 5/24/15.
//  Copyright (c) 2015 limadeveloper. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating>

@end

@implementation ViewController

#pragma mark - Properties
BOOL searchEnable = NO;
UISearchController *searchController;
NSArray *tableData;
NSArray *searchData;
NSIndexPath *selectedIndexPath;

#pragma mark - View LifeCycle
-(void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    [self.tableView reloadData];
}

-(void)getData {

}

-(void)createSearch {
    
    searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
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

-(void)clearSearch {
    
    searchData = @[];
    searchEnable = NO;
    
    [self.tableView reloadData];
}

#pragma mark - Search Delegates

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchController.searchBar.text];
    NSArray *array = [tableData filteredArrayUsingPredicate:searchPredicate];
    
    searchData = array;
    searchEnable = YES;
    
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
    self.tableView.allowsSelection = false;
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
        //FIXME: do something here
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
