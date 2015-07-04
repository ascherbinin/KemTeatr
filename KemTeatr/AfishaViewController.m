//
//  AfishaViewController.m
//  KemTeatr
//
//  Created by Андрей Щербинин on 15.06.15.
//  Copyright (c) 2015 Andrey Scherbinin. All rights reserved.
//

#import "AfishaViewController.h"
#import "UIColor+ColorFromHex.h"
#import "AfishaCell.h"

@interface AfishaViewController ()

@end

@implementation AfishaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Афиша";

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wallBG.png"]];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"AfishaCell" bundle:nil] forCellReuseIdentifier:@"AfishaCellID"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AfishaCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"AfishaCellID"];
    //http://www.kemteatr.ru/afisha.html
    cell.title.text = @"Сезон закончился, приходите позднее";
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 125;
}

@end
