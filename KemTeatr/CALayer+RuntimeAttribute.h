//
//  CALayer+RuntimeAttribute.h
//  KemTeatr
//
//  Created by Admin on 04.07.15.
//  Copyright (c) 2015 Andrey Scherbinin. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CALayer (IBConfiguration)

@property(nonatomic, assign) UIColor* borderIBColor;
@property(nonatomic, assign) UIColor* shadowIBColor;

@end
