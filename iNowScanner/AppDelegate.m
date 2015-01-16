//
//  AppDelegate.m
//  iNowScanner
//
//  Created by 石田 勝嗣 on 2015/01/16.
//  Copyright (c) 2015年 石田 勝嗣. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSMutableDictionary* options = [NSMutableDictionary dictionary];
    [options setObject:[NSNumber numberWithBool:YES] forKey:CBCentralManagerOptionShowPowerAlertKey];
    self.mManagerQueue = dispatch_queue_create("jp.nemustech.centralManagerQueue", DISPATCH_QUEUE_SERIAL);
    self.mCentralManager = [[CBCentralManager alloc] initWithDelegate:self queue:self.mManagerQueue options:options];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
    [self.mCentralManager stopScan];
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    switch (central.state) {
        case CBCentralManagerStateResetting:
        case CBCentralManagerStateUnsupported:
        case CBCentralManagerStateUnauthorized:
        case CBCentralManagerStatePoweredOff:
            break;
        case CBCentralManagerStatePoweredOn:
            [self.mCentralManager scanForPeripheralsWithServices:nil
                                                        options:@{ CBCentralManagerScanOptionAllowDuplicatesKey : @YES}];
            break;
        default:
            break;
            
    }
}

- (void)centralManager:(CBCentralManager*)central didDiscoverPeripheral:(CBPeripheral*)peripheral
     advertisementData:(NSDictionary*)advertisementData RSSI:(NSNumber*)RSSI
{
    NSString *name = [advertisementData objectForKey:CBAdvertisementDataLocalNameKey];
    NSArray *UUIDs = [advertisementData objectForKey:CBAdvertisementDataServiceUUIDsKey];
    NSData *data = [advertisementData objectForKey:CBAdvertisementDataManufacturerDataKey];
}
@end
