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
    
    
    if([commonUtils getUserDefault:@"currentLatitude"] != nil && [commonUtils getUserDefault:@"currentLongitude"] != nil) {
        
        GoogleAutoCompleteViewController *pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"GoogleAutoCompleteViewController"];
        
        pageViewController.GoogleAutoCompleteViewDelegate = self;
        
        [self presentViewController:pageViewController animated:YES completion:nil];
        
        
        
    } else {
//        [commonUtils showVAlertSimple:@"Failed" body:@"Please allow your location settings enabled" duration:1.2];
    }
    
}



#pragma mark - GoogleAutoComplete Delegate

-(void) GoogleAutoCompleteViewControllerDismissedWithAddress:(NSString *)address AndPlacemark:(CLPlacemark *)placeMark ForTextObj:(NSInteger *)textObjTag {
    
}

- (void)GoogleAutoCompleteViewControllerDismissedWithAddress:(NSString *)address AndLocation:(CLLocation *)location ForTextObj:(NSInteger *)textObjTag{
    
    
//    NSLog(@"selected location : %f : %f", location.coordinate.latitude, location.coordinate.longitude);
//    [locationLatitude setText:[NSString stringWithFormat:@"%f",location.coordinate.latitude]];
//    [locationLongitude setText:[NSString stringWithFormat:@"%f", location.coordinate.longitude]];
//    
//    [self requestLatLongFromAddress:address];
    
    
    
    NSString *addLocationAddress = @"";
    //    addLocationAddress = [commonUtils removeCharactersFromString:address withFormat:@[@"&"]];
    addLocationAddress = [address stringByReplacingOccurrencesOfString:@"&" withString:@"and"];
    
    NSLog(@"Address => %@", addLocationAddress);
    [addressTextField setText:addLocationAddress];
    
    
    if([addLocationAddress isEqualToString:@""]) {
//        [commonUtils showVAlertSimple:@"Warning" body:@"Please try again with different address to add" duration:1.3f];
    } else {
        
//        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
//        
//        [dic setObject:[appController.currentUser objectForKey:@"user_id"] forKey:@"user_id"];
//        [dic setObject:@"add" forKey:@"tag"];
//        [dic setObject:addLocationAddress forKey:@"location_address"];
//        
//        NSLog(@"/api/location_settings %@", dic);
//        self.isLoadingBase = YES;
//        [commonUtils showActivityIndicatorColored:self.view];
//        [NSThread detachNewThreadSelector:@selector(requestDataAddLocation:) toTarget:self withObject:dic];
    }
}


@end
