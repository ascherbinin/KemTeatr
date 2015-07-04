//
//  ActorElement.h
//  KemTeatr
//
//  Created by Admin on 04.07.15.
//  Copyright (c) 2015 Andrey Scherbinin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActorElement : NSObject

@property (nonatomic,strong) NSString* actorElementName;
@property (nonatomic,strong) NSString* actorElementPosition;
@property (nonatomic,strong) NSURL* actorElementFullInfoURL;
@property (nonatomic,strong) NSURL* actorElementImageURL;

@end
