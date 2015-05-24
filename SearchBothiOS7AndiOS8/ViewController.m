//
//  ViewController.m
//  SearchBothiOS7AndiOS8
//
//  Created by John Silva on 5/24/15.
//  Copyright (c) 2015 John Silva. All rights reserved.
//

#import "ViewController.h"

#define DATA @"http://restcountries.eu/rest/v1/all"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.table.delegate = self;
    self.table.dataSource = self;
    
    [self getData];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0) {
        NSLog(@"iOS 7");
        [self createSearchiOS7];
    }else {
        NSLog(@"iOS 8");
        [self createSearchiOS8];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark-
#pragma mark- methods ios 8
- (void)createSearchiOS8 {
    
    // search controller
    self.searchControlleriOS8 = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchControlleriOS8.searchResultsUpdater = self;
    self.searchControlleriOS8.dimsBackgroundDuringPresentation = NO;
    self.searchControlleriOS8.hidesNavigationBarDuringPresentation = NO;
    [self.searchControlleriOS8.searchBar sizeToFit];
    self.searchControlleriOS8.searchBar.placeholder = @"Search in iOS 8";
    self.searchControlleriOS8.searchBar.tintColor = [UIColor whiteColor];
    self.searchControlleriOS8.searchBar.delegate = self;
    [self.viewSearch addSubview:self.searchControlleriOS8.searchBar];
    
}

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchController.searchBar.text];
    NSArray *array = [self.resultsTable filteredArrayUsingPredicate:searchPredicate];
    self.resultsSearch = array;
    
    NSLog(@"ARRAY: %@", self.resultsSearch);
    [self.table reloadData];
}

#pragma mark-
#pragma mark- methods ios 7
- (void)createSearchiOS7 {
    
    // search bar
    self.searchBariOS7 = [[UISearchBar alloc] init];
    [self.searchBariOS7 sizeToFit];
    self.searchBariOS7.placeholder = @"Search in iOS 7";
    self.searchBariOS7.delegate = self;
    [self.viewSearch addSubview:self.searchBariOS7];
    
    // search display controller
    self.searchDisplayControlleriOS7 = [[UISearchDisplayController alloc] initWithSearchBar:self.searchBariOS7 contentsController:nil];
    self.searchDisplayControlleriOS7.searchResultsDataSource = self;
    self.searchDisplayControlleriOS7.searchResultsDelegate = self;
    
}

- (void)updateSearchResultsForSearchDisplayController:(UISearchBar *)searchBar {
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchBar.text];
    NSArray *array = [self.resultsTable filteredArrayUsingPredicate:searchPredicate];
    self.resultsSearch = array;
    
    NSLog(@"ARRAY: %@", self.resultsSearch);
    [self.table reloadData];
}

#pragma mark-
#pragma mark- table view datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0) {
        // ios 7
        if (self.searchid == 1) {
            return self.resultsSearch.count;
        }
    }else {
        // ios 8
        if (self.searchControlleriOS8.active) {
            return self.resultsSearch.count;
        }
    }
    return self.resultsTable.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.table dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0) {
        // ios 7
        if (self.searchid == 1) {
            cell.textLabel.text = [self.resultsSearch objectAtIndex:indexPath.row];
            cell.textLabel.textColor = [UIColor redColor];
        }else {
            cell.textLabel.text = [self.resultsTable objectAtIndex:indexPath.row];
            cell.textLabel.textColor = [UIColor blackColor];
        }
    }else {
        // ios 8
        if (self.searchControlleriOS8.active) {
            cell.textLabel.text = [self.resultsSearch objectAtIndex:indexPath.row];
            cell.textLabel.textColor = [UIColor orangeColor];
        }else {
            cell.textLabel.text = [self.resultsTable objectAtIndex:indexPath.row];
            cell.textLabel.textColor = [UIColor blackColor];
        }
    }
    
    return cell;
}

#pragma mark-
#pragma mark- table view delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.table deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark-
#pragma mark- search bar delegate
-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    NSLog(@"begin editing");
    searchBar.tintColor = [UIColor whiteColor];
    self.resultsSearch = nil;
    self.searchid = 1;
    [self.table reloadData];
    return YES;
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"search button clicked");
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"cancel button clicked");
    self.searchid = 0;
    [self.table reloadData];
}
-(BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    NSLog(@"text in range");
    NSLog(@"%@", searchBar.text);
    [self updateSearchResultsForSearchDisplayController:searchBar];
    return YES;
}

#pragma mark-
#pragma mark- methods
- (void)getData {
    
    NSURL *url = [NSURL URLWithString:DATA];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSError *error;
    NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    self.resultsTable = [[NSMutableArray alloc] init];
    if (error == nil) {
        for (int i=0; i<json.count; i++) {
            NSString *name = [[json objectAtIndex:i] objectForKey:@"name"];
            [self.resultsTable insertObject:name atIndex:i];
        }
        //NSLog(@"JSON: %@", json);
        [self.table reloadData];
    }else {
        NSLog(@"Error: %@", error);
    }
    
}

@end
