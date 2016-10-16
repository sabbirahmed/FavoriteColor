//
//  PersonsViewController.m
//  My Favorite Color
//
//  Created by Sabbir Ahmed on 10/16/16.
//  Copyright © 2016 Sabbir Ahmed. All rights reserved.
//

#import "PersonsViewController.h"
#import "FavoriteColor.h"
#import "ColorViewController.h"

@interface PersonsViewController ()<FavoriteColorChangeDelegate>{
    
    IBOutletCollection(UIButton) NSArray *personButton;
}

@property (nonatomic, strong) NSDictionary *data;
@property (nonatomic, weak) UIButton *currentButton;
@property (nonatomic, readonly, getter = currentPerson) NSString *currentPerson;

@end

@implementation PersonsViewController
@synthesize currentButton = _currentButton;

-(void) awakeFromNib{
    [super awakeFromNib];
    
    _data = @{
              @"Sabbir Ahmed" : [FavoriteColor new],
              @"Rumana Akter" : [FavoriteColor new],
              @"Shuvo Ahmed" : [FavoriteColor new],
              @"Sony" : [FavoriteColor new]
    };
    
    
}
-(void)viewDidLoad{
    [super viewDidLoad];
    [self updateUI];
}

-(void)updateUI {
    for (UIButton *button in personButton) {
        if(_data[button.currentTitle] != nil){
            FavoriteColor *color = _data[button.currentTitle];
            button.backgroundColor = [UIColor colorWithRed:color.redValue
                                                     green:color.greenValue
                                                      blue:color.blueValue
                                                     alpha:1.0];
        }
    }
}

#pragma mark - Setter Getter

-(NSString*) currentPerson{
    return _currentButton != nil ? _currentButton.currentTitle.copy : @"";
}

-(UIButton*) currentButton{
    return _currentButton;
}

-(void)setCurrentButton:(UIButton *)currentButton{
    _currentButton = currentButton;
}

#pragma mark - Nevigation

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.destinationViewController isMemberOfClass:[ColorViewController class]]) {
        
        ColorViewController *dvc = segue.destinationViewController;
        dvc.delegate = self;
        dvc.favColor = _data[self.currentPerson];
        dvc.personName = self.currentPerson;
        
    }
}

#pragma mark - Actions

- (IBAction)choseColorAction:(UIButton *)sender {
    _currentButton = sender;
    [self performSegueWithIdentifier:@"pickColor" sender:sender];
}

#pragma mark - FavoriteColorChangeDelegate

-(void) favoriteColorChange:(FavoriteColor *)color{
    _currentButton.backgroundColor = [UIColor colorWithRed:color.redValue
                                                     green:color.greenValue
                                                      blue:color.blueValue
                                                     alpha:1.0];
}

@end
