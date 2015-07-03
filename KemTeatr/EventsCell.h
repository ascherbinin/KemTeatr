//
//  EventsCell.h
//  KemTeatr
//
//  Created by Андрей Щербинин on 15.06.15.
//  Copyright (c) 2015 Andrey Scherbinin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventsCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *titleEvent;
@property (strong, nonatomic) IBOutlet UILabel *descriptionEvent;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *mouthLabel;

@end
