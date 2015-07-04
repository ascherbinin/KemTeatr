//
//  RepertuarElement.h
//  KemTeatr
//
//  Created by Андрей Щербинин on 03.07.15.
//  Copyright (c) 2015 Andrey Scherbinin. All rights reserved.
//

typedef enum EnumRepCategory{
    categoryMature,
    categoryAmature,
    categoryKids
}EnumRepCategory;

#import <Foundation/Foundation.h>

@interface RepertuarElement : NSObject

@property (nonatomic,strong) NSString* repElementName;
@property (nonatomic,strong) NSString* repElementDetail;
@property (nonatomic,strong) NSString* repElementAuthor;
@property (nonatomic,strong) NSString* repElementCategory;
@property (nonatomic,strong) NSURL* repElementImageURL;
@property (nonatomic,strong) NSURL* repElementFullTextURL;
@property (nonatomic,assign) EnumRepCategory repCat;


@end
