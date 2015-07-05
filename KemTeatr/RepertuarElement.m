//
//  RepertuarElement.m
//  KemTeatr
//
//  Created by Андрей Щербинин on 03.07.15.
//  Copyright (c) 2015 Andrey Scherbinin. All rights reserved.
//

#import "RepertuarElement.h"


@implementation RepertuarElement

- (BOOL)isEqualToRepElement:(RepertuarElement *)element {
    if (!element) {
        return NO;
    }
    
    BOOL haveEqualNames = (!self.repElementName && !element.repElementName) || [self.repElementName isEqualToString:element.repElementName];
    BOOL haveEqualAuthor = (!self.repElementAuthor && !element.repElementAuthor) || [self.repElementAuthor isEqualToString:element.repElementAuthor];
    
    return haveEqualNames && haveEqualAuthor;
}

#pragma mark - NSObject

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[RepertuarElement class]]) {
        return NO;
    }
    
    return [self isEqualToRepElement:(RepertuarElement *)object];
}

- (NSUInteger)hash {
    return [self.repElementName hash] ^ [self.repElementAuthor hash];
}

@end
