//
//  EventsViewController.m
//  KemTeatr
//
//  Created by Андрей Щербинин on 15.06.15.
//  Copyright (c) 2015 Andrey Scherbinin. All rights reserved.
//

#import "EventsViewController.h"
#import "EventsCell.h"
#import "UIColor+ColorFromHex.h"

@interface EventsViewController ()


@end

@implementation EventsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Наши события";
    NSShadow* shadow = [NSShadow new];
    shadow.shadowOffset = CGSizeMake(0.5f, 1.0f);
    shadow.shadowColor = [UIColor lightGrayColor];
    [[UINavigationBar appearance] setTitleTextAttributes: @{
                                                            NSForegroundColorAttributeName: [UIColor colorWithHexString:@"995733"],
                                                            NSFontAttributeName: [UIFont fontWithName:@"Helvetica" size:17.0f],
                                                            NSShadowAttributeName: shadow
                                                            }];
    
    
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wallBG.png"]];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"EventsCell" bundle:nil] forCellReuseIdentifier:@"EventsCellID"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EventsCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"EventsCellID"];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 129;
}


@end
