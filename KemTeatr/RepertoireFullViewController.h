//
//  RepertoireFullViewController.h
//  KemTeatr
//
//  Created by Admin on 05.07.15.
//  Copyright (c) 2015 Andrey Scherbinin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RepertoireFullViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *mainTextLabel;


-(id)initWithURL:(NSURL*)url;
@end
