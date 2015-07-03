//
//  EventElement.h
//  KemTeatr
//
//  Created by Андрей Щербинин on 03.07.15.
//  Copyright (c) 2015 Andrey Scherbinin. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EventElement : NSObject 

@property (nonatomic,strong) NSString* eventName;
@property (nonatomic,strong) NSString* eventDetail;
@property (nonatomic,strong) NSString* eventDay;
@property (nonatomic,strong) NSString* eventMounth;


@end