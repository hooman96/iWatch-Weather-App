//
//  InterfaceController.h
//  weather app WatchKit Extension
//
//  Created by hooman mohammadi on 8/28/15.
//  Copyright (c) 2015 hooman mohammadi. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *weatherType;
@property (weak, nonatomic) IBOutlet WKInterfaceImage *weatherImage;

- (IBAction)weatherUpdate;

@end
