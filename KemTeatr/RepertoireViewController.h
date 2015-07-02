//
//  RepertoireViewController.h
//  KemTeatr
//
//  Created by Андрей Щербинин on 15.06.15.
//  Copyright (c) 2015 Andrey Scherbinin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RepertoireViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;

@end
