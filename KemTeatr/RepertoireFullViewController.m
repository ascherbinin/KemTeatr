//
//  RepertoireFullViewController.m
//  KemTeatr
//
//  Created by Admin on 05.07.15.
//  Copyright (c) 2015 Andrey Scherbinin. All rights reserved.
//

#import "RepertoireFullViewController.h"
#import "RDHelper.h"

@interface RepertoireFullViewController ()
{
    NSMutableString* fullText;
}
@end

@implementation RepertoireFullViewController


-(id)initWithURL:(NSURL*)url
{
   self = [super initWithNibName:@"RepertoireFullViewController" bundle:nil];
    NSArray *tempArray = [RDHelper requestData:url xPathQueryStr:@"//div[@id='s_poster']"];
    
    if ([tempArray count] == 0)
        NSLog(@"Нету событий");
    else
    {
        NSLog(@"Найдено %lu корневых элементов", (unsigned long)[tempArray count]);
        
        dispatch_queue_t myQueue = dispatch_queue_create("My Queue",NULL);
        dispatch_async(myQueue, ^{
            
            [fullText appendString:[RDHelper repFullParsToArray:tempArray]];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.view setNeedsLayout];
            });
        });
        
        
    }

    
    
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mainTextLabel.attributedText = [[NSAttributedString alloc] initWithString:fullText];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
