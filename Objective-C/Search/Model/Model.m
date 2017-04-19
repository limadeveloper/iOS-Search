//
//  Model.m
//  Search
//
//  Created by John Lima on 18/04/17.
//  Copyright © 2017 John Lima. All rights reserved.
//

#import "Model.h"

@implementation Model

-(id)initWithName:(NSString *)name andPhoto:(NSString *)photo andCode:(int)code {
    
    self = [super init];
    
    if (self) {
        [self setCode:code];
        [self setName:name];
        [self setPhoto:photo];
    }
    
    return self;
}

-(NSArray *)getData {
    return @[[[Model alloc] initWithName:@"Ioda" andPhoto:@"" andCode:1],
             [[Model alloc] initWithName:@"Luki" andPhoto:@"" andCode:2]];
}

@end
