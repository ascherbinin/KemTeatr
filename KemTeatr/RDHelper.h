//
//  RDHelper.h
//  GLNews
//
//  Created by Admin on 08.05.15.
//  Copyright (c) 2015 GoodLine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RDHelper


+(NSArray*)requestData:(NSURL*)urlString xPathQueryStr:(NSString*)xpathQueryString;

+(NSMutableArray*)eventsParsToArray:(NSArray*)arrayToPars;
+(NSMutableArray*)repertoireParsToArray:(NSArray*)arrayToPars;
+(NSMutableArray*)actorsParsToArray:(NSArray*)arrayToPars;

@end
