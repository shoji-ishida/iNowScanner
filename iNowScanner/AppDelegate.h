//
//  AppDelegate.h
//  iNowScanner
//
//  Created by 石田 勝嗣 on 2015/01/16.
//  Copyright (c) 2015年 石田 勝嗣. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <IOBluetooth/IOBluetooth.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, CBCentralManagerDelegate>

@property (nonatomic) CBCentralManager *mCentralManager;
@property (nonatomic, strong) dispatch_queue_t mManagerQueue;

@end

