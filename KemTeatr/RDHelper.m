//
//  RDHelper.m
//  GLNews
//
//  Created by Admin on 08.05.15.
//  Copyright (c) 2015 GoodLine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFHpple.h"
#import "EventElement.h"
#import "RepertuarElement.h"

@interface RDHelper : NSObject



@end


@implementation RDHelper

+(NSArray*)requestData:(NSURL*)urlString xPathQueryStr:(NSString*)xpathQueryString
{
    
    NSData *newHtmlData = [NSData dataWithContentsOfURL:urlString];
    
    TFHpple *newParser = [TFHpple hppleWithHTMLData:newHtmlData];
    
    NSString *newXpathQueryString = xpathQueryString;
    
    NSArray *newNodes = [newParser searchWithXPathQuery:newXpathQueryString];
    
    return newNodes;
}

+(NSMutableArray*)eventsParsToArray:(NSArray*)arrayToPars
{
    NSMutableArray *tempMArray = [[NSMutableArray alloc]init];
    
    for (TFHppleElement *element in arrayToPars){
        
        
        
        
        EventElement *event = [[EventElement alloc]init];
        
        
        
        
        TFHppleElement *dataEventElement = [element firstChildWithClassName:@"event_circle"];
        TFHppleElement *mainEventElement =[element firstChildWithClassName:@"our_events_content"] ;
        
        TFHppleElement *dayElement = [[dataEventElement firstChildWithClassName:@"event_date_circle"] firstChildWithClassName:@"event_cur_day"];
        TFHppleElement *mounthElement = [[dataEventElement firstChildWithClassName:@"event_date_circle"] firstChildWithClassName:@"event_cur_month"];
        
        TFHppleElement *titleElement = [mainEventElement firstChildWithClassName:@"event_name"];
        TFHppleElement *detailElement = [mainEventElement firstChildWithClassName:@"text_our_event"];

        event.eventName = [[titleElement firstChildWithTagName:@"a" ] text];
        event.eventDetail = [[detailElement text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        event.eventDay = [[dayElement firstChildWithClassName:@"d1"]text];
        event.eventMounth = [[mounthElement firstChildWithClassName:@"d1"]text];
        
        
        
        [tempMArray addObject:event];
    }
    
    return tempMArray;
}

+(NSMutableArray*)repertoireParsToArray:(NSArray*)arrayToPars
{
    NSMutableArray *tempMArray = [[NSMutableArray alloc]init];
    
    for (TFHppleElement *element in arrayToPars){
    
        
         RepertuarElement *repElement = [[RepertuarElement alloc]init];
        
   
        TFHppleElement *mainElement = [element firstChildWithClassName:@"r_med"];
        
        repElement.repElementFullTextURL = [NSURL URLWithString:[[mainElement firstChildWithTagName:@"a"] objectForKey:@"href"]];
        
        TFHppleElement *imageRepElement =[[mainElement firstChildWithTagName:@"a" ] firstChildWithClassName:@"s_image"] ;
        
        repElement.repElementImageURL = [NSURL URLWithString:[[[imageRepElement firstChildWithTagName:@"img" ] objectForKey:@"src"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] ;
        
        repElement.repElementName = [[[mainElement firstChildWithClassName:@"r_name"] firstChildWithTagName:@"a"]text];
        
        repElement.repElementAuthor = [[[[mainElement firstChildWithClassName:@"r_name"] firstChildWithClassName:@"r_name2"]firstChildWithTagName:@"p"]text];
        
        repElement.repElementDetail = [[[[mainElement firstChildWithClassName:@"r_name"] firstChildWithClassName:@"r_name3"]firstChildWithTagName:@"p"]text];
        
        repElement.repElementCategory = [[[[mainElement firstChildWithClassName:@"r_description"] firstChildWithClassName:@"r_type"] firstChildWithTagName:@"a" ] text];
        
       // repElement.repCat =

        
        
        [tempMArray addObject:repElement];
    }
    
    return tempMArray;
}




@end