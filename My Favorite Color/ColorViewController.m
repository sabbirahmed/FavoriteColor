//
//  ColorViewController.m
//  My Favorite Color
//
//  Created by Sabbir Ahmed on 10/16/16.
//  Copyright © 2016 Sabbir Ahmed. All rights reserved.
//

#import "ColorViewController.h"
#import "FavoriteColor.h"

#define minColor [UIColor blackColor]
#define redColor [UIColor redColor]
#define greenColor [UIColor greenColor]
#define blueColor [UIColor blueColor]

@interface ColorViewController (){
    
    __weak IBOutlet UILabel *greatingLeavel;
    __weak IBOutlet UISlider *redSlider;
    __weak IBOutlet UISlider *greenSlider;
    __weak IBOutlet UISlider *blueSlider;
}

@end

@implementation ColorViewController

#pragma mark - Controlar

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setupUI];
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    if (_favColor != nil && _delegate != nil) {
        [_delegate favoriteColorChange:_favColor];
    }
}

-(void)setupUI {
    redSlider.minimumTrackTintColor = minColor;
    redSlider.maximumTrackTintColor = redColor;
    
    greenSlider.minimumTrackTintColor = minColor;
    greenSlider.maximumTrackTintColor = greenColor;
    
    blueSlider.minimumTrackTintColor = minColor;
    blueSlider.maximumTrackTintColor = blueColor;
    
    if (_favColor != nil) {
        redSlider.value = _favColor.redValue;
        greenSlider.value = _favColor.greenValue;
        blueSlider.value = _favColor.blueValue;
    }
    
    self.view.backgroundColor = [UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0];
    
    if (_personName != nil) {
        greatingLeavel.text = [NSString stringWithFormat:@"Hello %@!", _personName];
    }
}


#pragma mark - Actions

- (IBAction)sliderValueChange:(UISlider *)sender {
    self.view.backgroundColor = [UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0];
    if (_favColor != nil) {
        _favColor.redValue = redSlider.value;
        _favColor.greenValue = greenSlider.value;
        _favColor.blueValue = blueSlider.value;
    }
}

@end
