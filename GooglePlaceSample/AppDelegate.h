//
//  AppDelegate.h
//  GooglePlaceSample
//
//  Created by LandtoSky on 9/17/16.
//  Copyright © 2016 landtosky2018. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, retain) CLLocationManager *locationManager;

- (void)updateLocationManager;

@end

