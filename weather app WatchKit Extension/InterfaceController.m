//
//  InterfaceController.m
//  weather app WatchKit Extension
//
//  Created by hooman mohammadi on 8/28/15.
//  Copyright (c) 2015 hooman mohammadi. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)weatherUpdate {
  NSURLRequest *requestForWeather = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/weather?q=London,uk"]];
  NSURLRequest *response = nil;
  NSError *error = nil;
  
/*  NSData* data = [NSURLConnection sendSynchronousRequest:requestForWeather returningResponse:&response error:&error]; //for saving all of received data in non-serialized view
  */
  
  NSData* data = [NSURLConnection sendSynchronousRequest:requestForWeather returningResponse:&response error:&error]; //for saving all of received data in non-serialized view
  
  
  NSMutableDictionary *allData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error ];
  NSString *currentWeather = nil;
  
  NSArray *weather = allData[@"weather"];
  
  for (NSDictionary *weatherDic in weather)
  {
    currentWeather = weatherDic[@"main"];
  }
  
  [self setImageAndTextWeather:currentWeather];
}

- (void)setImageAndTextWeather: (NSString*) weatherName
{
  NSString* weatherNameWithoutSpaces = [weatherName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
  [_weatherImage setImageNamed:[weatherNameWithoutSpaces stringByAppendingString:@".jpg"]];
  
  NSMutableAttributedString *customString = [[NSMutableAttributedString alloc] initWithString:weatherNameWithoutSpaces];
  [customString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:NSMakeRange(0,[weatherNameWithoutSpaces length])];
  
  [_weatherType setAttributedText:customString];
  
}


@end


