//
//  ColorViewController.h
//  My Favorite Color
//
//  Created by Sabbir Ahmed on 10/16/16.
//  Copyright © 2016 Sabbir Ahmed. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FavoriteColor;

@protocol FavoriteColorChangeDelegate <NSObject>

-(void) favoriteColorChange:(FavoriteColor*)color;

@end

@interface ColorViewController : UIViewController

// model

@property (weak, nonatomic) FavoriteColor *favColor;
@property (copy, nonatomic) NSString *personName;
@property (weak, nonatomic) id<FavoriteColorChangeDelegate> delegate;

@end
