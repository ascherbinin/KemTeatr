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
    NSMutableArray* _matureObjects;
    NSMutableArray* _kidObjects;
    NSMutableArray* _amatureObjects;
    
    NSMutableArray *_uniqueRep;
    
    
    
}
@end

@implementation RepertoireViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        _repertoireObjects = [NSMutableArray new];
        _matureObjects = [NSMutableArray new];
        _kidObjects = [NSMutableArray new];
        _amatureObjects = [NSMutableArray new];
        _uniqueRep = [NSMutableArray new];
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.title = @"Репертуар";
    
    
    
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
    switch ([self.segmentController selectedSegmentIndex]) {
        case 0:
            return [_matureObjects count];
            break;
        case 1:
            return [_amatureObjects count];
            break;
        case 2:
            return [_kidObjects count];
        default:
            return [_repertoireObjects count];
            break;
    }

    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RepertuarElement *repElement;
    
    switch ([self.segmentController selectedSegmentIndex]) {
        case 0:
            repElement = _matureObjects[indexPath.row];
            break;
        case 1:
            repElement = _amatureObjects[indexPath.row];
            break;
        case 2:
            repElement = _kidObjects[indexPath.row];
        default:
            break;
    }
    
    RepertoireFullViewController* repertoireVC = [[RepertoireFullViewController alloc] initWithURL:repElement.repElementFullTextURL];
    [self.navigationController presentViewController:repertoireVC animated:YES completion:nil];
    
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RepertoireCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"RepertoireCellID"];
    
    RepertuarElement *repElement;
    
    switch ([self.segmentController selectedSegmentIndex]) {
        case 0:
            repElement = _matureObjects[indexPath.row];
            break;
        case 1:
            repElement = _amatureObjects[indexPath.row];
            break;
        case 2:
            repElement = _kidObjects[indexPath.row];
        default:
            break;
    }

    
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
        
        dispatch_queue_t myQueue = dispatch_queue_create("My Queue",NULL);
        dispatch_async(myQueue, ^{
        
        [_repertoireObjects addObjectsFromArray:[RDHelper repertoireParsToArray:repNodes]];

            for (RepertuarElement* item in _repertoireObjects)
            {
                if (![_uniqueRep containsObject:item]) {
                    [_uniqueRep addObject:item];
                };
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                for (RepertuarElement *object in _uniqueRep) {
                    if(object.repCat == categoryMature)
                    {
                        [_matureObjects addObject:object];
                    }
                    else if(object.repCat == categoryKids)
                    {
                        [_kidObjects addObject:object];
                    }
                    else
                    {
                        [_amatureObjects addObject:object];
                    }
                    
                }
                
                [self.tableView reloadData];            });
        });
            
        
        
    }
}


- (IBAction)segmentValueChanged:(id)sender
{
    [self.tableView reloadData];
}
@end
