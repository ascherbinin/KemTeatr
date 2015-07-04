//
//  ActorsViewController.m
//  KemTeatr
//
//  Created by Андрей Щербинин on 15.06.15.
//  Copyright (c) 2015 Andrey Scherbinin. All rights reserved.
//

#import "ActorsViewController.h"
#import "UIColor+ColorFromHex.h"
#import "RDHelper.h"
#import "ActorsViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "ActorElement.h"

@interface ActorsViewController ()
{
    NSMutableArray* _actorsObjects;
}
@end

@implementation ActorsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        _actorsObjects = [[NSMutableArray alloc] init];
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Актеры";
   

    
    [self.collectionView registerNib:[UINib nibWithNibName:@"ActorsViewCell" bundle:nil] forCellWithReuseIdentifier:@"ActorsCell"];
   
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wallBG.png"]];
    self.collectionView.backgroundColor = [UIColor clearColor];
    
    [self loadActors];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if(section ==0)
    {
       return 1;
    }
    else {
        return [_actorsObjects count]-1;
    }
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ActorsViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ActorsCell" forIndexPath:indexPath];
    
    ActorElement *actor = _actorsObjects[indexPath.row];
    
    NSLog(@"%@",actor.actorElementImageURL);
    [cell.imageView setImageWithURL:actor.actorElementImageURL placeholderImage:[UIImage imageNamed:@"NoActorPhoto.png"]];
    
    cell.nameLabel.text = actor.actorElementName;
    
    return  cell;
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

-(void)loadActors
{
    
    NSURL *actorsUrl = [NSURL URLWithString:@"http://www.kemteatr.ru/o-nas/"];
    
    
    NSArray *actorsNodes = [RDHelper requestData:actorsUrl xPathQueryStr:@"//div[@class='a_pimg']"];
    
    if ([actorsNodes count] == 0)
        NSLog(@"Нету актеров");
    else
    {
        NSLog(@"Найдено %lu корневых элементов", (unsigned long)[actorsNodes count]);
        
        [_actorsObjects addObjectsFromArray:[RDHelper actorsParsToArray:actorsNodes]];
        
        
        [self.collectionView reloadData];
        
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ActorElement *actor = _actorsObjects[indexPath.row];
    NSLog(@"%@",actor.actorElementName);
    NSLog(@"%@",actor.actorElementImageURL);

}



@end
