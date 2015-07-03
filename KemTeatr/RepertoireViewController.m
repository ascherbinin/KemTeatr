//
//  RepertoireViewController.m
//  KemTeatr
//
//  Created by Андрей Щербинин on 15.06.15.
//  Copyright (c) 2015 Andrey Scherbinin. All rights reserved.
//

#import "RepertoireViewController.h"
#import "UIColor+ColorFromHex.h"
#import "RDHelper.h"
#import "RepertoireCell.h"
#import "RepertuarElement.h"
#import "UIImageView+AFNetworking.h"

@interface RepertoireViewController ()
{
    NSMutableArray* _repertoireObjects;
}
@end

@implementation RepertoireViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        _repertoireObjects = [[NSMutableArray alloc] init];
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.title = @"Репертуар";
    NSShadow* shadow = [NSShadow new];
    shadow.shadowOffset = CGSizeMake(0.5f, 1.0f);
    shadow.shadowColor = [UIColor lightGrayColor];
    [[UINavigationBar appearance] setTitleTextAttributes: @{
                                                            NSForegroundColorAttributeName: [UIColor colorWithHexString: @"995733"],
                                                            NSFontAttributeName: [UIFont fontWithName:@"Helvetica" size:17.0f],
                                                            NSShadowAttributeName: shadow
                                                            }];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"topBG.png"] forBarMetrics:UIBarMetricsDefault];

    
    
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wallBG.png"]];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"RepertoireCell" bundle:nil] forCellReuseIdentifier:@"RepertoireCellID"];
    
    [self loadRepertoire];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_repertoireObjects count];
}



-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RepertoireCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"RepertoireCellID"];
    
    RepertuarElement *repElement = _repertoireObjects[indexPath.row];
    
    cell.title.text = [NSString stringWithFormat:@"\"%@\"",repElement.repElementName];
    
    if (repElement.repElementDetail == nil)
    {
        cell.detail.text = @"Нет описания";
    }
    else
    {
        cell.detail.text =repElement.repElementDetail;
    }
    cell.category.text = repElement.repElementCategory;
    cell.author.text = repElement.repElementAuthor;
    [cell.repImageView setImageWithURL:repElement.repElementImageURL placeholderImage:[UIImage imageNamed:@"NoActorPhoto.png"]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     RepertuarElement *repElement = _repertoireObjects[indexPath.row];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 305;
}

-(void)loadRepertoire
{
    
    NSURL *repUrl = [NSURL URLWithString:@"http://www.kemteatr.ru/repertuar/"];
    
    
    NSArray *repNodes = [RDHelper requestData:repUrl xPathQueryStr:@"//div[@class='Repertuarnyj  vz_det']"];
    
    if ([repNodes count] == 0)
        NSLog(@"Нету репертуара");
    else
    {
        NSLog(@"Найдено %lu корневых элементов", (unsigned long)[repNodes count]);
        
        [_repertoireObjects addObjectsFromArray:[RDHelper repertoireParsToArray:repNodes]];
        
        
        [self.tableView reloadData];
        
    }
}


- (IBAction)segmentValueChanged:(id)sender
{
        switch ([sender selectedSegmentIndex]) {
            case 0:
                
                break;
            case 1:
                
                break;
            case 2:
                
            default:
                break;
        }
}
@end
