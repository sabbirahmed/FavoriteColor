//
//  FavoriteColor.m
//  My Favorite Color
//
//  Created by Sabbir Ahmed on 10/16/16.
//  Copyright © 2016 Sabbir Ahmed. All rights reserved.
//

#import "FavoriteColor.h"

@implementation FavoriteColor

-(id) init {
    self = [super init];
    if (self != nil) {
        _redValue = 1.0;
        _greenValue = 1.0;
        _blueValue = 1.0;
    }
    
    return self;
}

@end
