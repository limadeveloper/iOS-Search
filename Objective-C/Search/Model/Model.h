//
//  Model.h
//  Search
//
//  Created by John Lima on 18/04/17.
//  Copyright © 2017 John Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Model : NSObject

#pragma mark - Properties
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *photo;
@property (assign, nonatomic) int code;

#pragma mark - Actions
-(NSArray *)getData;

@end
