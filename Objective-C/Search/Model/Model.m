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
    return @[[[Model alloc] initWithName:@"Yoda" andPhoto:@"" andCode:1],
             [[Model alloc] initWithName:@"Luki" andPhoto:@"" andCode:2],
             [[Model alloc] initWithName:@"Obi-Wan Kenobi" andPhoto:@"" andCode:3],
             [[Model alloc] initWithName:@"Anakin Skywalker" andPhoto:@"" andCode:4],
             [[Model alloc] initWithName:@"Quinlan Vos" andPhoto:@"" andCode:5],
             [[Model alloc] initWithName:@"Mace Windu" andPhoto:@"" andCode:6],
             [[Model alloc] initWithName:@"Quin-Gon Jinn" andPhoto:@"" andCode:7],
             [[Model alloc] initWithName:@"Ki-Adi-Mundi" andPhoto:@"" andCode:8],
             [[Model alloc] initWithName:@"Plo Koon" andPhoto:@"" andCode:9],
             [[Model alloc] initWithName:@"Saesee Tiin" andPhoto:@"" andCode:10],
             [[Model alloc] initWithName:@"Even Piell" andPhoto:@"" andCode:11],
             [[Model alloc] initWithName:@"Oppo Rancisis" andPhoto:@"" andCode:12],
             [[Model alloc] initWithName:@"Adi Gallia" andPhoto:@"" andCode:13],
             [[Model alloc] initWithName:@"Yarael Poof" andPhoto:@"" andCode:14],
             [[Model alloc] initWithName:@"Eeth Koth" andPhoto:@"" andCode:15],
             [[Model alloc] initWithName:@"Depa Billaba" andPhoto:@"" andCode:16],
             [[Model alloc] initWithName:@"Kit Fisto" andPhoto:@"" andCode:17],
             [[Model alloc] initWithName:@"Luminara Unduli" andPhoto:@"" andCode:18],
             [[Model alloc] initWithName:@"Barriss Offee" andPhoto:@"" andCode:19],
             [[Model alloc] initWithName:@"Shaak Ti" andPhoto:@"" andCode:20],
             [[Model alloc] initWithName:@"Coleman Trebor" andPhoto:@"" andCode:21],
             [[Model alloc] initWithName:@"Jocasta Nu" andPhoto:@"" andCode:22],
             [[Model alloc] initWithName:@"Zett Jukassa" andPhoto:@"" andCode:23],
             [[Model alloc] initWithName:@"Aayla Secura" andPhoto:@"" andCode:24],
             [[Model alloc] initWithName:@"Sifo-Dyas" andPhoto:@"" andCode:25],
             [[Model alloc] initWithName:@"Count Dooku" andPhoto:@"" andCode:26],
             [[Model alloc] initWithName:@"Agen Kolar" andPhoto:@"" andCode:27],
             [[Model alloc] initWithName:@"Stass Allie" andPhoto:@"" andCode:28],
             [[Model alloc] initWithName:@"Ahsoka Tano" andPhoto:@"" andCode:29],
             [[Model alloc] initWithName:@"Asajj Ventress" andPhoto:@"" andCode:30],
             [[Model alloc] initWithName:@"Ima-Gun Di" andPhoto:@"" andCode:31],
             [[Model alloc] initWithName:@"Nahdar Vebb" andPhoto:@"" andCode:32],
             [[Model alloc] initWithName:@"Bolla Ropal" andPhoto:@"" andCode:33],
             [[Model alloc] initWithName:@"Tera Sinube" andPhoto:@"" andCode:34]];
}

@end
