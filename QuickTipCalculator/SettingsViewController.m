//
//  SettingsViewController.m
//  QuickTipCalculator
//
//  Created by Helen Tse on 6/4/14.
//  Copyright (c) 2014 Helen Tse. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *tipPicker;
@property (strong, nonatomic) NSArray *defaultTipValues;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.defaultTipValues = [[NSArray alloc] initWithObjects:@"10%", @"15%", @"20%", nil];
}

- (void) viewWillAppear:(BOOL)animated
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    int defaultPickerRow = [defaults integerForKey:@"defaultPickerRow"];
    
    [self.tipPicker reloadAllComponents];
    [self.tipPicker selectRow:defaultPickerRow inComponent:0 animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component{
    return 3;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    return [self.defaultTipValues objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    NSString *defaultTipValue = [self.defaultTipValues objectAtIndex:row];
    
    int defaultPickerRow = row;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:defaultTipValue forKey:@"defaultTipValue"];
    [defaults setInteger:defaultPickerRow forKey:@"defaultPickerRow"];
    [defaults synchronize];
    
}


@end
