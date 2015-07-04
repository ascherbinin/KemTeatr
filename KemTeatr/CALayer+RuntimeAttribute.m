//
//  CALayer+RuntimeAttribute.m
//  KemTeatr
//
//  Created by Admin on 04.07.15.
//  Copyright (c) 2015 Andrey Scherbinin. All rights reserved.
//

#import "CALayer+RuntimeAttribute.h"

@implementation CALayer (IBConfiguration)

-(void)setBorderIBColor:(UIColor*)color
{
    self.borderColor = color.CGColor;
}

-(UIColor*)borderIBColor
{
    return [UIColor colorWithCGColor:self.borderColor];
}

-(void)setShadowIBColor:(UIColor*)color
{
    self.shadowColor = color.CGColor;
}

-(UIColor*)shadowIBColor
{
    return [UIColor colorWithCGColor:self.shadowColor];
}

@end
