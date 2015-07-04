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
#import "RDHelper.h"
#import "EventElement.h"


@interface EventsViewController ()

{
    NSMutableArray* _eventsObjects;
}

@end

@implementation EventsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        _eventsObjects = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"События";
    
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wallBG.png"]];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"EventsCell" bundle:nil] forCellReuseIdentifier:@"EventsCellID"];
    
    [self loadEvents];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_eventsObjects count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EventsCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"EventsCellID"];
    
    EventElement *event = _eventsObjects[indexPath.row];
    
    cell.titleEvent.text = event.eventName;
    cell.dateLabel.text = event.eventDay;
    cell.mouthLabel.text = event.eventMounth;
    cell.descriptionEvent.text = event.eventDetail;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

-(void)loadEvents
{
    
    NSURL *newsUrl = [NSURL URLWithString:@"http://www.kemteatr.ru/nashi-sobyitiya/"];
    
    
    NSArray *eventsNodes = [RDHelper requestData:newsUrl xPathQueryStr:@"//div[@class='one_event']"];
    
    if ([eventsNodes count] == 0)
        NSLog(@"Нету событий");
    else
    {
        NSLog(@"Найдено %lu корневых элементов", (unsigned long)[eventsNodes count]);
        
        [_eventsObjects addObjectsFromArray:[RDHelper eventsParsToArray:eventsNodes]];
        
        
        [self.tableView reloadData];
        
    }
}



@end
