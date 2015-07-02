//
//  RepertoireViewController.m
//  KemTeatr
//
//  Created by Андрей Щербинин on 15.06.15.
//  Copyright (c) 2015 Andrey Scherbinin. All rights reserved.
//

#import "RepertoireViewController.h"
#import "UIColor+ColorFromHex.h"

@interface RepertoireViewController ()

@end

@implementation RepertoireViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navBar = [[UINavigationBar alloc]init];
    
    self.navigationItem.title = @"Репертуар";
    NSShadow* shadow = [NSShadow new];
    shadow.shadowOffset = CGSizeMake(0.5f, 1.0f);
    shadow.shadowColor = [UIColor lightGrayColor];
    [[UINavigationBar appearance] setTitleTextAttributes: @{
                                                            NSForegroundColorAttributeName: [UIColor colorWithHexString: @"995733"],
                                                            NSFontAttributeName: [UIFont fontWithName:@"Helvetica" size:17.0f],
                                                            NSShadowAttributeName: shadow
                                                            }];
    
    
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wallBG.png"]];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"RepertoireCell" bundle:nil] forCellReuseIdentifier:@"RepertoireCellID"];

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
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"RepertoireCellID"];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 320;
}

@end
