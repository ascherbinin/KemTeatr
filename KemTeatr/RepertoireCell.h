//
//  RepertoireCell.h
//  KemTeatr
//
//  Created by Андрей Щербинин on 16.06.15.
//  Copyright (c) 2015 Andrey Scherbinin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RepertoireCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *repImageView;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *category;
@property (strong, nonatomic) IBOutlet UILabel *author;
@property (strong, nonatomic) IBOutlet UILabel *detail;

@end
