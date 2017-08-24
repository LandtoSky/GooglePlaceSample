//
//  MainVC.m
//  GooglePlaceSample
//
//  Created by LandtoSky on 9/17/16.
//  Copyright © 2016 landtosky2018. All rights reserved.
//

#import "MainVC.h"
#import "GoogleAutoCompleteViewController.h"

@interface MainVC ()<GoogleAutoCompleteViewDelegate>{
    
    IBOutlet UILabel *addressTextField;
    IBOutlet UILabel *locationLatitude;
    IBOutlet UILabel *locationLongitude;
    
}

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Settings - Add Location
- (IBAction) onAddLocation:(UIButton *)sender {
    
    
//    if([commonUtils getUserDefault:@"currentLatitude"] != nil && [commonUtils getUserDefault:@"currentLongitude"] != nil) {
    
        GoogleAutoCompleteViewController *pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"GoogleAutoCompleteViewController"];
        
        pageViewController.GoogleAutoCompleteViewDelegate = self;
        
        [self presentViewController:pageViewController animated:YES completion:nil];
        
        
        
//    } else {
//        [commonUtils showVAlertSimple:@"Failed" body:@"Please allow your location settings enabled" duration:1.2];
//    }
    
}



#pragma mark - GoogleAutoComplete Delegate

-(void) GoogleAutoCompleteViewControllerDismissedWithAddress:(NSString *)address AndPlacemark:(CLPlacemark *)placeMark ForTextObj:(NSInteger *)textObjTag {
    
}

- (void)GoogleAutoCompleteViewControllerDismissedWithAddress:(NSString *)address AndLocation:(CLLocation *)location ForTextObj:(NSInteger *)textObjTag{
    
    NSString *addLocationAddress = @"";
    //    addLocationAddress = [commonUtils removeCharactersFromString:address withFormat:@[@"&"]];
    addLocationAddress = [address stringByReplacingOccurrencesOfString:@"&" withString:@"and"];
    
    [addressTextField setText:addLocationAddress];
    [locationLatitude setText:[NSString stringWithFormat:@"%f", location.coordinate.latitude]];
    [locationLongitude setText:[NSString stringWithFormat:@"%f", location.coordinate.longitude]];
    
    if([addLocationAddress isEqualToString:@""]) {

    } else {
        

    }
}


@end
